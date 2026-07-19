#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
err() { echo "FAIL: $1"; fail=1; }

[ -L CLAUDE.md ] || err "CLAUDE.md must be a symlink to AGENTS.md"

agents_lines=$(wc -l < AGENTS.md | tr -d ' ')
[ "$agents_lines" -le 100 ] || err "AGENTS.md is $agents_lines lines (budget 100)"

for dir in skills/*/; do
  s="${dir}SKILL.md"
  [ -f "$s" ] || { err "$dir missing SKILL.md"; continue; }
  lines=$(wc -l < "$s" | tr -d ' ')
  [ "$lines" -le 70 ] || err "$s is $lines lines (budget 70)"
  head -1 "$s" | grep -q '^---$' || err "$s missing frontmatter"
  base=$(basename "${dir%/}")
  grep -q "^name: $base\$" "$s" || err "$s frontmatter name must be '$base' (match directory)"
  [ "$(grep -c '^---$' "$s")" -ge 2 ] || err "$s frontmatter is not closed"
  awk '/^---$/{c++; next} c==1' "$s" \
    | awk '/^description:/{d=1; print; next} /^[a-zA-Z-]+:/{d=0} d' \
    | grep -q 'Use when' || err "$s description must state triggers ('Use when …')"
  for ref in "${dir}references/"*.md; do
    [ -e "$ref" ] || continue
    rl=$(wc -l < "$ref" | tr -d ' ')
    [ "$rl" -le 120 ] || err "$ref is $rl lines (budget 120)"
  done
done

# Contract: the Flow table is 2-column with the skill name in column 2.
tmpl="skills/craftsman-mode/references/AGENTS.template.md"
flow_skills=$(awk -F'|' '/^## Flow[[:space:]]*$/{f=1;next} /^## /{f=0} f && NF==4 {n=$3; gsub(/[[:space:]]/,"",n); if (n ~ /^[a-z][a-z-]*$/) print n}' "$tmpl" | sort -u)
[ -n "$flow_skills" ] || err "no skill names extracted from the Flow table in $tmpl"
for sk in $flow_skills; do
  [ -d "skills/$sk" ] || err "Flow table names '$sk' but skills/$sk is missing"
done

[ "$fail" -eq 0 ] && echo "check: all green" || exit 1
