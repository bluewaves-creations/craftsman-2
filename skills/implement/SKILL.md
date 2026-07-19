---
name: implement
description: Use when executing a planned task — writing the code that turns a spec criterion green
---

# Implement

One task at a time, test first, docs open.

## Method
1. **Ground** — read the doc the plan cites, plus anything official you need.
   Never guess an API you haven't read. Honor the task's declared
   Interfaces — neighboring tasks consume exactly those names and types.
2. **Red** — write the failing test that expresses the task's done-line.
   Run it; watch it fail for the right reason.
3. **Green** — the minimum that passes. Resist scope; the next task exists.
4. **Refactor** — while green: naming, duplication, structure. Enrich the test
   suite where the code revealed a seam worth pinning.
5. **Commit** — one task, one commit:
```
feat(search): rank results by relevance [C3]

Postgres ts_rank over title+bio. Empty query short-circuits
to recents per spec edge case.
```
6. Hand to verify.

## Stuck rule
Three failed attempts at the same problem: stop. Write the attempts and your
best hypothesis to ADR.md, and bring it to the human. A fourth attempt in the
same context wastes what a fresh look or a human answer solves in minutes.

## Never
- Code before the failing test exists.
- Weaken or delete a test to make it pass — that's a spec conversation.
- Mix a fix and a refactor in one commit.
