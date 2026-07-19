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

case "${1:-}" in
  "")        store="$HOME/.agents/skills"; claude="$HOME/.claude/skills" ;;
  --project) store="$PWD/.agents/skills";  claude="$PWD/.claude/skills" ;;
  *) sed -n '2,15p' "$0"; exit 2 ;;
esac

fail=0
install_into() {  # $1 = destination store
  mkdir -p "$1"
  for dir in "$src"/*/; do
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
  echo "Symlink kept: $claude -> $(readlink "$claude")"
elif [ -d "$claude" ]; then
  echo "$claude is a real directory — copying into it:"
  install_into "$claude"
else
  mkdir -p "$(dirname "$claude")"
  ln -s "$store" "$claude"
  echo "Symlink created: $claude -> $store"
fi

[ "$fail" -eq 0 ] && echo "install: all green" || { echo "install: FAILED"; exit 1; }
