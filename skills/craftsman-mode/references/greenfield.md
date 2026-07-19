# Greenfield — new project

Outcome: an empty repo becomes a Craftsman project where specify can start
immediately.

## Sequence

1. **Scope.** List the files to create: AGENTS.md, CLAUDE.md (symlink),
   SPEC.md, PLAN.md, ADR.md, toolchain scaffold. Confirm. `git init` first
   if needed.

2. **Interview** — one topic at a time, short questions:
   - Vision: what, for whom, why now, what good looks like.
   - Stack: languages, frameworks, versions; the commands that build/test/run.
   - Constraints: the non-negotiables. For each, ask: can a gate enforce it?
     If yes, it becomes a gate or linter config and AGENTS.md just points
     there.
   - Conventions: what good code looks like here — capture one example each.
   - Documentation: the official source per framework and library (MCP
     server, docs/ folder, llms.txt). A library not listed later → stop and
     ask before coding against it.

   Cannot fill Vision or Stack without guessing, or answers conflict →
   brainstorm skill, converge, resume at the unfilled slot.

3. **Write the constitution** from `AGENTS.template.md`:
   - Every section from attested answers only.
   - Seed Rules: the universal four verbatim, then 2–4 stack rules read from
     the official docs — current idioms, one line each. Shape:
     - Swift: actors over locks; async/await, never completion handlers.
     - React: server components by default; client only at interaction.
     - Python data: vectorize with polars/pandas; no row loops over frames.
   - `ln -s AGENTS.md CLAUDE.md`

4. **Scaffold the toolchain** with the stack's official generator where one
   exists (`npm create vite`, `cargo new`, `uv init`, Xcode template…).
   Declare gates only after running each once:

   | Project type | Typical gates |
   |---|---|
   | Web frontend | vitest/jest · eslint · tsc · production build |
   | Backend / API | stack test runner · linter · types · container build |
   | Native app | XCTest / gradle test · swiftlint / ktlint · release build |
   | Data / ML | pytest · ruff · mypy · dbt test / pipeline dry-run |
   | CLI / library | cargo test+clippy · go test+vet · stack equivalent |

5. **Ledgers.** SPEC.md, PLAN.md, ADR.md from `templates.md`. First ADR
   entry: stack choice and the rules seeded, citing their doc sources.

6. **Prove the loop.** One trivial failing test → watch it fail for the
   right reason → make it pass → run every declared gate → paste the
   evidence.

7. **First commit.** `chore: bring project under craftsman`, listing the
   created files. Announce the handoff: "→ specify" — or "→ brainstorm" if
   the product direction is still open.

## Never
- Fill a section the human didn't answer.
- Scaffold over existing files without listing them first.
