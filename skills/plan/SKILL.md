---
name: plan
description: >
  Turn a frozen spec into a living, batched PLAN.md and keep it true as
  batches complete. Use when a spec is approved ("plan the batches", "break
  this down", "what's next", "where were we"), when a batch boundary closes
  (re-plan), or to check coverage ("are we still covered?"). Not for
  criteria (specify), tasks (implement), batch judgment (review), or
  direction-finding (brainstorm).
license: MIT
compatibility: Best with official-docs access (MCP servers or docs/) for pattern grounding.
metadata:
  version: "0.2.0"
---

# Plan

PLAN.md is the dynamic roadmap from unticked C-ids to green. The spec never
moves; the plan does. Each task must execute without re-reading the plan.

## Modes

| Signal | Mode |
|---|---|
| No PLAN.md, or newly approved criteria | Initial (default) |
| A batch boundary closes (from review) | Re-plan |
| "Are we still covered?" | Gap check |

## Initial

1. **Ground.** Official docs first for every capability the criteria lean
   on — current idiomatic patterns, not remembered ones. Sketch: goal,
   approach in 2–3 sentences, file map with one responsibility per file.
   Consequential choices → ADR.md with the rejected alternative; rationale
   lives there, not in PLAN.md.
2. **Slice** into batches of 2–4 tasks. Batch 1 is the walking skeleton —
   the thinnest end-to-end slice. Order the rest by dependency, then
   learning value: the most architecture-teaching batch first.
3. **Write tasks** per `references/plan-authoring.md`: C-id, doc, files,
   interfaces, done-line. Detail only the next 2 batches — beyond that, a
   C-id list per batch; detail decays.
4. **Self-review** — the three checks in the reference; fix inline.
5. Announce: "→ implement, task 1.1".

## Re-plan — closes every batch boundary

1. **Fold** what the batch taught: consolidate, split, re-order; detail
   the batch entering the 2-batch horizon to full anatomy. Commit the
   re-planned PLAN.md — the boundary commit, noting consequential
   re-orderings.
2. **Gap check**: every unticked C-id in exactly one remaining batch —
   none left → suggest "→ finish". Surface invalidated approaches —
   every gap is a plan change, never silent.
3. **Extract** into PLAN.md `## State`: decisions and why, failed
   approaches and reasons, open questions. Only what disk and git cannot
   re-derive.
4. **Report + suggest compaction** — at every boundary: the extract is
   durable; a fresh context re-enters via the Flow's fresh-session row.
   Wait for the human.

Standalone gap check: coverage + gap fixes only — no State, no compaction.

## Never

- Edit SPEC.md — spec gaps route to specify.
- Write code or architecture essays in PLAN.md — structure only (code:
  implement; rationale: ADR.md).
- Leave a task without C-id, doc, and mechanical done-line.
- Mark a batch done or start the next without the human's go — verify
  ticks tasks, review closes batches.
