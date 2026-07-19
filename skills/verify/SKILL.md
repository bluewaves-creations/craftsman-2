---
name: verify
description: Use when a task's implementation is complete — prove it with gate evidence before moving to the next task
---

# Verify

The model doesn't judge whether code works; gates do. Green means exit 0, shown.

## Method
1. Run every gate declared in AGENTS.md (test, lint, types, build…).
2. Paste the evidence — the final lines of real output, not a summary of belief:
```
$ bun test
42 pass, 0 fail (117 expect() calls) — exit 0
```
3. Only now tick the criterion's checkbox in SPEC.md and the task's box in
   PLAN.md.
4. Red gate → fix loop: smallest change, re-run, repeat. The stuck rule from
   implement applies (3 attempts → ADR.md + human).
5. **Gap pass** — one honest question: what does this task claim that no gate
   actually checks? Cover it with a test now, or log it under Gaps in PLAN.md.

## Language
"Should work", "looks correct", "I'm confident" — these are not verification.
If you can't paste the passing output, the task isn't done.

## Never
- Declare done with any gate unrun or red.
- Narrow a gate's scope to dodge a failure (skip-tag, exclude, --changed).
- Tick a checkbox ahead of evidence.
