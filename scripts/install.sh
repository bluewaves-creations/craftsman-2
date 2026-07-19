#!/usr/bin/env bash
# Craftsman installer — copies the nine skills into the open-standard
# skill store and makes sure the harness symlink sees them.
#
#   scripts/install.sh             user level:    ~/.agents/skills
#   scripts/install.sh --project   project level: ./.agents/skills (cwd)
#
# Touches only the skill dirs it ships — never AGENTS.md, ledgers, or
# neighbouring skills. Idempotent: re-run to update (each shipped skill
# dir is replaced whole).
#
# Uninstall: remove the nine skill dirs from the store, e.g.
#   for s in brainstorm craftsman-mode finish fix implement plan review \
#            specify verify; do rm -rf ~/.agents/skills/$s; done
# The .claude/skills symlink is shared with other skills — leave it.
set -euo pipefail

src="$(cd "$(dirname "$0")/.." && pwd)/skills"
[ -d "$src" ] || { echo "FAIL: $src not found (run from a craftsman clone)"; exit 1; }

# link_to: relative in project mode so the checkout survives a move/clone
case "${1:-}" in
  "")        store="$HOME/.agents/skills"; claude="$HOME/.claude/skills"; link_to="$store" ;;
  --project) store="$PWD/.agents/skills";  claude="$PWD/.claude/skills";  link_to="../.agents/skills" ;;
  *) sed -n '2,/^set -euo/p' "$0" | sed '$d'; exit 2 ;;
esac

fail=0
install_into() {  # $1 = destination store
  mkdir -p "$1"
  for dir in "$src"/*/; do
    [ -d "$dir" ] || continue
    name=$(basename "$dir")
    rm -rf "${1:?}/$name"
    cp -R "$dir" "$1/$name"
    diff -r "$dir" "$1/$name" >/dev/null \
      && echo "  $name -> $1/$name" \
      || { echo "FAIL: $name differs after copy"; fail=1; }
  done
}

echo "Installing skills:"
install_into "$store"

# Harness discovery: .claude/skills must reach the store. Never symlink
# over a real directory — copy into it instead.
if [ -L "$claude" ]; then
  if [ "$(cd -P "$claude" 2>/dev/null && pwd)" = "$(cd -P "$store" && pwd)" ]; then
    echo "Symlink kept: $claude -> $(readlink "$claude")"
  elif [ -e "$claude" ]; then
    echo "WARN: $claude -> $(readlink "$claude") — not the store; .claude harnesses won't see this install (left untouched)"
  else
    echo "FAIL: $claude is a dangling symlink -> $(readlink "$claude")"; fail=1
  fi
elif [ -d "$claude" ]; then
  echo "$claude is a real directory — copying into it:"
  install_into "$claude"
elif [ -e "$claude" ]; then
  echo "FAIL: $claude exists but is neither a directory nor a symlink"; fail=1
else
  mkdir -p "$(dirname "$claude")" \
    || { echo "FAIL: cannot create $(dirname "$claude") — is a parent a regular file?"; exit 1; }
  ln -s "$link_to" "$claude"
  echo "Symlink created: $claude -> $link_to"
fi

[ "$fail" -eq 0 ] && echo "install: all green" || { echo "install: FAILED"; exit 1; }
