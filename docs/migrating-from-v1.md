# Migrating from Craftsman v1

v2 keeps v1's founding insight — LLM self-assessment is unreliable, so
verdicts must be exit codes — and removes the machinery around it.
Nothing from v1 is required at runtime; migration is uninstall + install.

## What replaces what

| Craftsman v1 | Craftsman 2 |
|---|---|
| ~22k-line CLI enforcing the loop | No CLI. Nine markdown skills + your project's own toolchain |
| CLI-owned config | `AGENTS.md` constitution (≤100 lines, human-owned), written by `craftsman-mode` init from observed commands |
| Commit-blocking hooks on red gates | Guide-and-show: gates + pasted evidence; the hook question is deliberately open (see ADR.md, "commit-hook backstop") |
| CLI-managed state and trailers | Plain markdown ledgers — SPEC.md (frozen criteria), PLAN.md (living batches), ADR.md (decisions) — plus typed git commits |
| Fixed phase machine | Flow table in AGENTS.md routes to skills by state; no skill named by hand |
| Boundary ritual (extract + compact) | Kept — plan's boundary report: evidence, moves, compaction offer, human go |
| v1 install (CLI + hooks) | `scripts/install.sh` — nine skills into `~/.agents/skills` (open standard), one command, idempotent |

## Migration steps

1. Remove v1's CLI and hooks from the project (whatever `craftsman
   uninstall` or your hook config installed).
2. Install v2: `scripts/install.sh` from a clone of this repo.
3. In each project, say **"init craftsman"** — brownfield init observes
   your real toolchain and writes a fresh constitution; it never invents
   claims and never overwrites an existing AGENTS.md without showing the
   diff.
4. Your git history, tests, and toolchain carry over untouched — v2 has
   no state of its own beyond the three markdown ledgers it creates.
