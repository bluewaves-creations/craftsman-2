# Completion Protocol

Loaded by finish. The order matters: triage before QA (fixes change the
tree), QA before docs (docs describe the final tree), docs before
delivery.

## Gaps triage — three dispositions

| Disposition | When | Trace |
|---|---|---|
| Fix now | cheap, or quality-bearing | implement → verify; Gap line ticked |
| Defer | real but not now | ADR.md entry: reason + revisit trigger |
| Accept | cost exceeds value, human agrees | Gap line annotated "accepted: {why}" |

A Gap with no disposition blocks finish. "We'll remember it" is not a
disposition.

## ADR consolidation

- **Group** related entries ("these three are all data-layer") and
  propose one merged decision; the tried-and-failed lines survive
  compressed, never deleted — they are why the decision holds.
- **Stale check** — for each decision: does the code still reflect it?
  Moved past → ask "confirm or supersede?"; superseding writes a new
  entry pointing at the old one. Never silently rewrite a record.
- The human approves every merge and every supersede.

## Documentation verification

- **README quickstart** — run each command on the final tree exactly as
  written (fresh clone semantics where possible). A command you didn't
  run is a command you didn't verify.
- **AGENTS.md accuracy** — section by section: Stack versions still
  right? Every Gate command still exits 0? Conventions examples still
  match the dominant style? Rules still enforced by the code that
  exists? Propose minimal corrections, observed facts only, budget
  intact.
- **Other docs** — only those AGENTS.md names (CHANGELOG, API docs…);
  no invented obligations.

## Delivery menu

| Option | Does | Cleanup |
|---|---|---|
| Merge locally | merge to base, delete work branch | yes |
| Push + PR | push branch, open PR | keep branch |
| Tag a release | tag + notes per project habit | keep |
| Keep as-is | nothing; work stays on branch | none |
| Discard | delete the work | the human types "discard" once; never re-prompted |

Present all that apply; the human picks. Never merge, push, tag, or
delete on your own initiative.

## Final report — the shape

```
Shipped: {one line} — criteria C1–C12 green (evidence above).
Gates: test · lint · types · build — all exit 0, full scope.
Deferred: offline mode (Gap, accepted: single-venue usage); perf
hardening past 50k records (ADR 2026-07-19).
Consolidated: 3 ADR merges approved; 1 superseded.
Docs: README quickstart re-run clean; AGENTS.md corrected (gate command).
Suggested next spec: {the natural follow-on, one line}.
```

## Boundary close

Finish ends like every boundary: the State section carries the closing
entry, the report suggests compaction, and everything worth keeping is on
disk before the context is allowed to disappear.
