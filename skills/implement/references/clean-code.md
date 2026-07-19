# Refactoring Is Not a Crime

Models under pressure patch dirtily and hoard dead code. In this flow the
opposite holds: while the suite is green, reshaping the code is a duty —
and green is the only time it's allowed.

## While green, always

- **Rename to intent** — the name says what it means now, not what it
  meant two tasks ago.
- **Extract on the third occurrence** — rule of three; the first
  duplication is cheaper than the wrong abstraction.
- **Delete dead code on sight** — unused functions, commented-out blocks,
  unreferenced flags. Git remembers; the codebase shouldn't.
- **Inline needless indirection** — a wrapper that adds no decision is
  noise.
- Re-run the suite after each move; still green or the move reverts.

## No overdesign — YAGNI applies to structure

No speculative abstraction, no interface with one implementation, no
config for one caller, no pattern without a second concrete use, no
"we might need it later". The next task exists; so does the next refactor.

## Dirty patch → root cause

| Dirty patch | Root-cause move |
|---|---|
| `if (input == "renoir") return cached;` | fix the ranking for all inputs |
| `catch (e) { /* ignore */ }` | handle the documented failure, or let it surface |
| `value: any` to silence the checker | model the actual type |
| `sleep(500)` before the assert | wait on the condition, not the clock |
| copy the function and edit one line | extract the variation point |
| delete the failing test | the test is the message — read it |

The pattern behind all six: making the symptom invisible instead of making
the behavior correct. If a fix doesn't explain *why* the failure happened,
it's a patch.

## Boundaries of a refactor

- Behavior unchanged means **tests untouched and green** — a refactor
  that needs test edits is a behavior change in disguise: stop, that's a
  task or a spec conversation.
- Refactors ride their own `refactor(scope):` commits — never mixed with
  behavior, so the narrative ledger stays diagnosable.
- The file map and dependency direction from PLAN.md are the design.
  Reshaping *within* it is yours; moving a boundary is plan's — propose,
  don't drift.

## The smell test before commit

Would a craftsman sign this file? No dead code, no duplication past the
rule of three, names that read as intent, the diff no larger than the
task needed — and nothing clever where clear would do.
