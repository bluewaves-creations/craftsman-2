---
name: verify
description: >
  Prove a task is done with fresh gate evidence — exit codes, never
  self-assessment. Use when a task's implementation is complete, before any
  claim of done, fixed, or passing, before moving to the next task, or when
  the human asks "does it work?". Not for writing code (implement), judging
  quality (review), or closing the boundary (plan re-plan).
license: MIT
compatibility: Requires the gate commands declared in AGENTS.md; git for the amend path.
metadata:
  version: "0.2.0"
---

# Verify

The model never judges its own work; gates do. Green means exit 0, shown.
Freshness rule: output that didn't run after the last change doesn't exist.

## Method

1. **Run every gate** declared in AGENTS.md — full scope, no narrowing,
   freshly, whatever implement already ran.
2. **Demonstrate the done-line** — the task's demonstration command, its
   observable result seen, not assumed.
3. **Paste the evidence** — per claim: command, output tail, exit code:

   $ bun test
   42 pass, 0 fail (117 expect() calls) — exit 0

   The full claims→proof table: `references/evidence.md`.
4. **Red → classify, then fix.** New-code failure: 3 attempts. Regression
   on untouched behavior: 2 — the old behavior wins; protect it first.
   Environment or tooling: 1, then report. Fixes amend the task's feat
   commit. Budget spent → stop, attempts + hypothesis to ADR.md, human.
5. **Gap pass** — walk the criterion and done-line word by word: what does
   this task claim that no gate actually checks? Cover it now with an
   emergent test, or log it under PLAN.md Gaps — never silently.
6. **Tick** — only now: the C-id's box in SPEC.md, the task's box in
   PLAN.md.
7. **Route** — every batch task ticked → "→ review". Otherwise
   "→ implement, task N".

## Language

"Should work", "probably", "looks correct", "I'm confident", "Done!" ahead
of evidence — none of these are verification. If you can't paste the
passing output, it didn't happen. Claim after evidence, never before.

## Never

- Claim any status without a fresh run in hand.
- Narrow a gate to dodge a failure — skip-tags, excludes, --changed,
  suppression comments.
- Tick a box ahead of evidence, or carry a red gate to the next task.
- Trust a subagent's success report — verify its diff yourself.
