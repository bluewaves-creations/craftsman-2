# Evidence

What counts as proof, per claim. The shape is always: the command, the
output tail, the exit code — run after the last change.

## Claims and their proof

| Claim | Requires | Never sufficient |
|---|---|---|
| Tests pass | test command, fresh: 0 failures, exit 0 | a previous run, "should pass" |
| Lint clean | linter output: 0 errors | partial paths, extrapolation |
| Types clean | checker output: 0 errors | "the linter passed" |
| Build succeeds | build command: exit 0 | lint + types green, "logs look good" |
| Bug fixed | the original symptom re-tested: passes | code changed, assumed fixed |
| Regression test works | red-green re-proof (below) | the test passing once |
| Criterion met | done-line demonstrated + gates green | tests passing alone |
| Subagent finished | its diff read and gates re-run | the subagent's own report |

## Regression red-green re-proof

A regression test that has only ever passed proves nothing — it may pass
against the bug too:

1. Test passes with the fix in place.
2. Revert the fix (stash) — the test must fail.
3. Restore — the test passes again.

Two minutes, and the test is now evidence instead of decoration.

## Failure classes and budgets

Classify before fixing — the class sets the budget and the stance:

- **New-code failure** (the code this task added): 3 attempts, root-cause
  discipline from implement.
- **Regression** (a previously green test broke): 2 attempts — the old
  behavior wins; protect it first, even at the cost of this task's
  approach. A regression traded away silently is the worst outcome.
- **Environment / tooling** (gate can't run, missing tool, flaky infra):
  1 attempt, then report — never paper over with a skip.

Budget spent → stop; attempts and best hypothesis to ADR.md; the human
decides. Fixes amend the task's feat commit — the ledger shows one task,
not a fix trail.

## Gap-pass questions

Walk the criterion and the done-line word by word, then ask:

- Which words does no gate check? ("ranked" — is order asserted?
  "under 300 ms" — is the bound measured?)
- Error paths: does a test force each documented failure?
- Edges from the criterion: empty, duplicate, unauthorized, offline —
  present in the suite or only in the spec?
- Anything demonstrated by hand that a test could pin?

Every uncovered claim: an emergent test now, or a PLAN.md Gaps entry —
visible either way, never silent.

## Excuse → reality

| Excuse | Reality |
|---|---|
| "Should work now" | run it |
| "I'm confident" | confidence isn't evidence |
| "The linter passed" | the linter doesn't compile or test |
| "It passed earlier" | earlier is before the last change |
| "The subagent said success" | read its diff, re-run the gates |
| "Partial check is enough" | partial proves nothing |
