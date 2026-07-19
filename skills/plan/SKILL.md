---
name: plan
description: >
  Turn a frozen spec into a living, batched PLAN.md and keep it true as
  work completes. Use when a spec is approved ("plan the batches", "break
  this down"), when a batch boundary closes, when a mid-flight change
  needs seating (spec delta, architecture block, stale plan), or to check
  coverage ("are we still covered?"). Not for criteria (specify), tasks
  (implement), batch judgment (review), or direction-finding (brainstorm).
license: MIT
compatibility: Best with official-docs access (MCP servers or docs/) for pattern grounding.
metadata:
  version: "1.0.0"
---

# Plan

PLAN.md is the dynamic roadmap from unticked C-ids to green. The spec never
moves; the plan does. Each task must execute without re-reading the plan.

## Modes

| Signal | Mode |
|---|---|
| No PLAN.md, or newly approved criteria | Initial (default) |
| A batch boundary closes (from review) | Re-plan |
| Mid-flight handoff: spec delta, architecture block, stale plan, fog | Intake |
| "Are we still covered?" | Gap check |

## Initial

1. **Ground.** Official docs first for every capability — current
   idiomatic patterns, not memory. Check ADR.md dead ends before
   proposing an approach; a match is cited to the human before retry.
   Sketch: goal, 2–3-sentence approach, file map (one responsibility
   per file). Consequential choices → ADR.md, rejected alternative in.
2. **Slice** into batches of 2–4 tasks; batch 1 is the walking skeleton.
   Order by dependency, then learning value — most architecture-teaching
   first.
3. **Write tasks** per `references/plan-authoring.md`: C-id, doc, files,
   interfaces, done-line. Detail the next 2 batches only — detail decays.
4. **Self-review** — the three checks in the reference; fix inline.
   Announce: "→ implement, task 1.1".

## Re-plan — closes every batch boundary

1. **Fold** what the batch taught: consolidate, split, re-order; detail
   the batch entering the 2-batch horizon. Commit — the boundary commit
   notes consequential re-orderings.
2. **Gap check**: every unticked C-id in exactly one remaining batch —
   none left → suggest "→ finish"; every gap a plan change, never silent.
3. **Extract** into PLAN.md `## State`: decisions and why, failed
   approaches, open questions, in-flight attempt tallies. Only what disk
   and git cannot re-derive.
4. **Report + suggest compaction** — every boundary: the extract is
   durable, fresh context re-enters via the fresh-session row. Wait.

## Intake — mid-flight, no boundary

Seat spec deltas or structural learnings into current and remaining
batches; re-slice if tasks changed meaning; tell the human what moved.
No State, no compaction, no ticks. Then "→ implement" at the adjusted
task. Standalone gap check: coverage + gap fixes only.

## Never

- Edit SPEC.md — spec gaps route to specify.
- Code or architecture essays in PLAN.md (code: implement; rationale: ADR).
- A task without C-id, doc, and mechanical done-line.
- Mark a batch done or start the next without the human's go.
