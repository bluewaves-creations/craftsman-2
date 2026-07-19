---
name: fix
description: >
  Diagnose and repair a defect at its root cause — never the symptom.
  Use when something is broken outside the current task loop: "fix this bug",
  "it crashes", "tests are failing", "why does X happen", a regression
  surfaces outside any task loop, or implement hands off a blocking bug.
  Not for a task's own red test (implement), verify's in-loop red gates,
  new behavior (specify), or improvement without a defect (review).
license: MIT
compatibility: Requires the gate commands from AGENTS.md and git.
metadata:
  version: "0.1.0"
---

# Fix

Root causes, not symptoms — the codebase left healthier than found.
Diagnose runs first, always; no path to a fix skips it.

## Diagnose — mandatory first

1. **Reproduce mechanically** — one command that triggers the failure.
   Can't reproduce → gather evidence (`references/diagnosis.md`), never
   guess: a diagnosis without reproduction is a hypothesis in a costume.
2. **Read everything, then isolate** — the whole error, the whole stack;
   recent changes (`git log`, `git bisect` for regressions); compare the
   working path against the broken one and list every difference.
3. **Pre-action gate** — search ADR.md and `git log --grep` for the
   area: the proposed fix may already be a recorded dead end.
4. **One hypothesis at a time** — smallest experiment that proves it.
   Three dead → stop, hypothesis log to ADR.md, report, human.
5. **Spec check** — violates a ticked criterion → true defect, continue.
   Behavior never specified, or the spec is what's wrong → that is
   specify's post-freeze delta; the human rules.
6. **Report before fixing** — root cause, introducing commit, scope,
   approach. Routine → proceed; surprising → wait for the human.

## Repair

1. **Pin** — a regression test at the root cause, not the symptom; red
   observed, red-green re-proof per verify's evidence rules.
2. **Minimal fix** — the root cause only. No while-I'm-here improvements,
   no drive-by renames; implement's dirty-patch table applies.
3. **Verify** — full gates, fresh evidence. Repair's own budget of 3
   (diagnosis's separate), shared per failure with implement + verify.
4. **Commit** — one commit: `fix(scope): {symptom} — {root cause}`,
   carrying the fix and its regression test together.

## Improve — optional, only after green

The fix degraded the area's health → refactor per implement's clean-code
rules, separate `refactor(scope)` commit; if it breaks, it reverts alone
— the fix stays.

## Route back

| Entered from | After green |
|---|---|
| implement's blocked-by-bug route | resume "→ implement, task N" |
| mid-batch discovery | resume the interrupted skill's announce |
| finish QA or review finding | resume the caller's loop |
| standalone report | report; revealed spec holes → Gaps or specify |

## Never

- Write fix code before a reproduced, reported diagnosis.
- Cover a symptom to get green, or leave a fixed bug without its
  root-cause regression test.
- Mix fix and refactor in one commit, or smuggle in new behavior.
