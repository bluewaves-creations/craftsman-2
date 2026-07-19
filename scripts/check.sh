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
  grep -q '^name: ' "$s" || err "$s frontmatter missing name"
  grep -q '^description: Use when' "$s" || err "$s description must start 'Use when'"
  for ref in "${dir}references/"*.md; do
    [ -e "$ref" ] || continue
    rl=$(wc -l < "$ref" | tr -d ' ')
    [ "$rl" -le 120 ] || err "$ref is $rl lines (budget 120)"
  done
done

[ "$fail" -eq 0 ] && echo "check: all green" || exit 1
