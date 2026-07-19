---
name: finish
description: >
  Close out a completed batch series as one finished, delivered piece of
  work. Use when every criterion in SPEC.md is ticked and the last batch
  review is closed ("finish", "wrap up", "ship it", "are we done?"). Not
  for closing a batch (review → plan), not for proving a task (verify),
  and never while a criterion is unticked.
license: MIT
compatibility: Requires the gate commands from AGENTS.md and git.
metadata:
  version: "1.0.0"
---

# Finish

Finishing is not stopping — it is the pass that turns a working batch
series into a finished piece of work. Nothing new gets built here;
everything built gets proven, consolidated, documented, delivered.

**Preflight guard**: any criterion unticked, batch unreviewed, or no
boundary commit since the last review → not finish; name what's open,
route back. Every "Deferred — open questions" entry in SPEC.md: resolved
via specify's post-freeze delta, or explicitly carried by the human.

## Method

1. **Gaps triage** — every PLAN.md Gaps entry disposed, none silent:
   fix now (implement → verify loop), defer (ADR.md entry with the
   reason), or the human accepts it as-is.
2. **Full QA** — every gate, full scope, fresh, on the final tree —
   verify's evidence rules and per-failure budgets apply. Walk SPEC.md:
   each C-id's demonstration re-confirmed. Budget spent → stop, report.
3. **Improvement pass** — offer an extended review (advisory). Accepted
   findings become one final improvement batch (plan adds it), returning
   here through the normal implement → verify → review → plan loop.
4. **Consolidate ADR.md** — propose merges of related entries, compress
   tried-and-failed history to terse lines — never delete it. Stale
   detection: a decision the code has moved past → "confirm or
   supersede?", the human rules on each. Every consolidation
   human-approved. Details: `references/completion.md`.
5. **Documentation, true on a clean machine** — README quickstart
   commands actually run, not skimmed; AGENTS.md accuracy pass (stack,
   gates, conventions, rules still observed facts — propose minimal
   corrections). No invented doc obligations: only what AGENTS.md says
   the project keeps.
6. **Close and deliver** — final State entry in PLAN.md (shipped,
   deferred with ADR refs, suggested next spec); final commit; delivery
   menu — merge · push + PR · tag a release · keep as-is — the human
   picks; discard requires the human to type "discard". Finish is a
   boundary: suggest compaction; everything durable is on disk.

## Never

- Finish with a criterion unticked, a Gap undisposed, or a red gate.
- Consolidate or delete ADR history without human approval.
- Ship documentation you didn't re-verify against the tree.
- Execute a destructive delivery without its typed confirmation.
- Build new behavior here — new wants route to specify.
