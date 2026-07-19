---
name: implement
description: >
  Execute one planned task to production grade — docs-grounded TDD that
  turns its C-id green. Use when a task is open in PLAN.md ("implement",
  "continue", "next task", "task 2.1"), after plan hands off, or when
  resuming mid-batch. Not for batching (plan), proving done (verify),
  judging the batch (review), or changing criteria (specify).
license: MIT
compatibility: Best with official-docs access (MCP servers or docs/); requires git.
metadata:
  version: "0.2.0"
---

# Implement

One task at a time, test first, docs open. Zero implementation gap: done
means the done-line demonstrably true — no stubs, no TODOs, no "good
enough for now". Production grade is the only grade.

## Task loop

1. **Ground** — read the doc the task cites; re-read AGENTS.md Rules and
   Conventions before the first line (drift starts at line one). The doc
   marks an API deprecated or legacy → don't use it, however familiar.
   Work within the task's declared Files; honor its Interfaces —
   neighbors consume exactly those names.
2. **Red** — write the failing test that expresses the done-line; run it;
   watch it fail for the right reason. Target already green → the plan is
   stale: stop, "→ plan".
3. **Green** — the minimum that passes. Resist scope; the next task exists.
4. **Still red? Root cause, never patches.** Read the error, form one
   hypothesis, test it with the smallest experiment. Forbidden patches:
   special-casing the failing input, catch-and-swallow, widening types,
   suppression comments, sleep/retry, weakening the test. Three failed
   attempts → stop, write attempts + hypothesis to ADR.md, ask the human.
5. **Extend the QA harness** — emergent tests where the code has logic:
   `references/testing.md`.
6. **Commit the behavior** — code + its tests, one feat commit:

   feat(search): rank results by relevance [C3]

7. **Refactor while green** — not a crime, a duty: `references/clean-code.md`.
   Each reshaping lands in its own commit, e.g.
   refactor(search): extract scoring, delete legacy ranker [C3]

8. Announce: "→ verify".

## Discovery routes — never absorb, always route

| Found mid-task | Route |
|---|---|
| Spec contradicts reality | stop → propose via specify, human rules |
| Architecture blocks the task | stop → "→ plan"; never hack around it |
| A bug blocks this task | stop → "→ fix"; resume the task after green |
| A regression this task caused | yours — root-cause it now (step 4) |
| Pre-existing unrelated bug | log to PLAN.md Gaps; no drive-by fixes |

## Never

- Code before the failing test exists, or against an API you haven't
  grounded in current docs this session.
- Cross an architecture boundary "just this once" — the file map and
  dependency direction are the design; hacks route to plan.
- Leave a stub, TODO, or partial path behind a flag.
- Weaken or delete a test to make it pass — that's a spec conversation.
- Mix behavior and refactor in one commit.
