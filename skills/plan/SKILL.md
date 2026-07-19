---
name: plan
description: Use when an approved spec needs an implementation path, or at a batch boundary when the plan must adapt to what the batch taught
---

# Plan

Write PLAN.md: batches of 2–4 tasks that turn spec criteria green. The plan is
a living document — re-planned after every batch. The spec never moves.

## Method
1. Read the official docs for anything unfamiliar (Documentation section of
   AGENTS.md — MCP or docs/). Docs first, memory second: training data is
   stale and full of other people's habits.
2. Slice the spec into batches. Batch 1 is the walking skeleton: the thinnest
   end-to-end slice that exercises the whole stack.
3. Each task lists the criterion it serves, the doc that informed it, and its
   done-line.
4. After each batch review, fold what you learned into the remaining batches.

## Shape of a good task
Bad: "Implement search backend."
Good:
```markdown
- [ ] 2.1 Rank search results (criterion 3). Doc: Postgres full-text search,
      ts_rank. Done: `bun test search` green; "renoir" returns ranked artists
      from the fixture catalog.
```

## Never
- Plan a task on a half-remembered API — cite the doc or read it now.
- Batch more than 4 tasks — boundaries are where quality gets checked.
- Touch SPEC.md — spec changes go through the human.
