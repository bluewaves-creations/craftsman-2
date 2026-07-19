---
name: plan
description: >
  Turn a frozen spec into a living, batched PLAN.md and keep it true as
  batches complete. Use when a spec is approved ("plan the batches", "break
  this down", "what's next", "where were we"), when a batch boundary closes
  (re-plan), or to check coverage ("are we still covered?"). Not for writing
  criteria (specify), not for executing tasks (implement), and not for
  judging the batch (review).
license: MIT
compatibility: Best with official-docs access (MCP servers or docs/) for pattern grounding.
metadata:
  version: "0.2.0"
---

# Plan

PLAN.md is the dynamic roadmap from unticked C-ids to green. The spec never
moves; the plan always does. Good plan test: each task executable without
re-reading the whole plan, each done-line mechanical.

## Modes

| Signal | Mode |
|---|---|
| No PLAN.md, or newly approved criteria | Initial (default) |
| A batch boundary closes (from review) | Re-plan |
| "Are we still covered?", boundary step | Gap check |

## Initial

1. **Ground.** For every capability the criteria lean on: official docs
   first (AGENTS.md Documentation) — current idiomatic patterns, not
   remembered ones. Sketch the architecture: goal, approach in 2–3
   sentences, file map with one responsibility per file. Consequential
   choices (pattern, boundary, dependency) → ADR.md with the rejected
   alternative. Deep rationale lives there, not in PLAN.md.
2. **Slice** into batches of 2–4 tasks. Batch 1 is the walking skeleton —
   thinnest end-to-end slice through the whole stack. Order the rest by
   dependency, then learning value: the batch that teaches most about the
   architecture goes first.
3. **Write tasks** per `references/plan-authoring.md`: C-id, doc, files,
   interfaces, done-line. Detail only the next 2 batches — beyond that, a
   C-id list per batch; detail decays.
4. **Self-review** — the three checks in the reference; fix inline.
5. Announce: "→ implement, task 1.1".

## Re-plan — closes every batch boundary

1. Fold what the batch taught: consolidate what got simpler, split what
   grew, re-order if invalidated — consequential re-orderings noted in the
   boundary commit.
2. **Gap check** (also standalone): every unticked C-id in exactly one
   remaining batch; surface approaches the batch invalidated — every gap
   is a plan change, never silent.
3. **Extract** into PLAN.md `## State`: decisions made and why, approaches
   that failed and the reason, open questions for the human. Only what
   disk and git cannot re-derive — nothing re-obtainable.
4. **Report and suggest compaction** — every boundary, not just long
   sessions: the extract just made everything durable; a fresh context
   re-enters through the Flow's fresh-session row. Then wait for the human.

## Never

- Edit SPEC.md — spec gaps route to specify.
- Write code or architecture essays in PLAN.md — structure only; code
  lives in implement, rationale in ADR.md.
- Leave a task without C-id, doc, and mechanical done-line.
- Mark a batch done — verify ticks tasks, review closes batches.
- Start the next batch after a boundary without the human's go.
