#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
err() { echo "FAIL: $1"; fail=1; }

[ -L CLAUDE.md ] && [ "$(readlink CLAUDE.md)" = "AGENTS.md" ] \
  || err "CLAUDE.md must be a symlink pointing at AGENTS.md"

agents_lines=$(wc -l < AGENTS.md | tr -d ' ')
[ "$agents_lines" -le 100 ] || err "AGENTS.md is $agents_lines lines (budget 100)"

[ -f LICENSE ] && head -1 LICENSE | grep -q '^MIT License$' \
  || err "LICENSE missing or not MIT (C14)"

for dir in skills/*/; do
  s="${dir}SKILL.md"
  [ -f "$s" ] || { err "$dir missing SKILL.md"; continue; }
  lines=$(wc -l < "$s" | tr -d ' ')
  [ "$lines" -le 70 ] || err "$s is $lines lines (budget 70)"
  head -1 "$s" | grep -q '^---$' || err "$s missing frontmatter"
  base=$(basename "${dir%/}")
  grep -q "^name: $base\$" "$s" || err "$s frontmatter name must be '$base' (match directory)"
  grep -q '^license: MIT$' "$s" || err "$s license must be MIT (match LICENSE, C14)"
  [ "$(grep -c '^---$' "$s")" -ge 2 ] || err "$s frontmatter is not closed"
  desc=$(awk '/^---$/{c++; next} c==1' "$s" \
    | awk '/^description:/{d=1; print; next} /^[a-zA-Z-]+:/{d=0} d')
  printf '%s' "$desc" | grep -q 'Use when' \
    || err "$s description must state triggers ('Use when …')"
  if printf '%s' "$desc" | head -1 | grep -q '^description: *[>|-]*$'; then
    dlen=$(printf '%s' "$desc" | tail -n +2 | tr -d '\n' | wc -c | tr -d ' ')
  else
    dlen=$(printf '%s' "$desc" | head -1 | sed 's/^description: *//' | wc -c | tr -d ' ')
  fi
  [ "$dlen" -le 1024 ] || err "$s description is $dlen chars (spec limit 1024)"
  for ref in "${dir}references/"*.md; do
    [ -e "$ref" ] || continue
    rl=$(wc -l < "$ref" | tr -d ' ')
    [ "$rl" -le 120 ] || err "$ref is $rl lines (budget 120)"
  done
done

tmpl="skills/craftsman-mode/references/AGENTS.template.md"
tmpl_lines=$(wc -l < "$tmpl" | tr -d ' ')
[ "$tmpl_lines" -le 100 ] \
  || err "$tmpl is $tmpl_lines lines (≤100: floor of the rendered constitution, C1; init's wc -l gate covers the rendered file)"

# Contract: the Flow table is 2-column with the skill name in column 2.
flow_skills=$(awk -F'|' '/^## Flow[[:space:]]*$/{f=1;next} /^## /{f=0} f && NF==4 {n=$3; gsub(/[[:space:]]/,"",n); if (n ~ /^[a-z][a-z-]*$/) print n}' "$tmpl" | sort -u)
[ -n "$flow_skills" ] || err "no skill names extracted from the Flow table in $tmpl"
for sk in $flow_skills; do
  [ -d "skills/$sk" ] || err "Flow table names '$sk' but skills/$sk is missing"
done
for dir in skills/*/; do
  base=$(basename "${dir%/}")
  echo "$flow_skills" | grep -qx "$base" \
    || err "skills/$base exists but no Flow-table row routes to it"
done

if command -v uvx >/dev/null 2>&1; then
  for dir in skills/*/; do
    uvx --from skills-ref agentskills validate "$dir" >/dev/null 2>&1 \
      || err "agentskills validate failed for $dir"
  done
fi

[ "$fail" -eq 0 ] && echo "check: all green" || exit 1
