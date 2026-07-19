---
name: finish
description: Use when all spec criteria are green and the work is ready to ship — final QA, consolidation, and documentation
---

# Finish

Production finishing. Nothing new gets built here; everything built gets
proven, consolidated, documented.

## Method
1. **Full QA** — every gate, full scope, no narrowing. Walk SPEC.md: every
   criterion ticked, each backed by a test or a recorded hands-on check.
2. **Gap sweep** — hunt what slipped between tasks: error paths, empty states,
   the Gaps list in PLAN.md. Offer an extended review if the surface is large.
3. **Consolidate ADR.md** — collapse dead-end entries into the decisions that
   held; future sessions read this ledger before re-litigating.
4. **Documentation** — README quickstart true on a clean machine; AGENTS.md
   still accurate (stack, gates, conventions). It is the next session's
   constitution — staleness compounds.
5. **Ship** — final commit; tag or release per project habit. Report: what
   shipped, what's deferred (with ADR reference), suggested next spec.

## Never
- Ship with a criterion unticked "because it obviously works."
- Leave AGENTS.md describing a project that no longer exists.
