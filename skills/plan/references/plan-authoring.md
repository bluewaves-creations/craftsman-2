# Plan Authoring

PLAN.md carries structure — what, where, in what order, proven how. Never
code, never rationale essays (ADR.md), never criteria words (SPEC.md).

## Header

```markdown
# Plan — {Project}

Adapts at every batch boundary. The spec never moves.
Goal: {one sentence}
Architecture: {2–3 sentences — approach, key boundaries}
Constraints: {project-wide requirements from the spec, exact values, one line each}
```

## File map — before any task

Lock decomposition first: every file the plan touches, one responsibility
each, files that change together live together. In existing codebases the
established pattern wins; a file grown unwieldy may earn a split task.

```markdown
Files:
- src/search/rank.ts — scoring only, no IO
- src/search/store.ts — catalog access, owns the DB handle
```

## Task anatomy

```markdown
- [ ] 2.1 Rank search results (C3). Doc: Postgres FTS §12.3, ts_rank.
      Files: create src/search/rank.ts; modify src/search/store.ts.
      Interfaces: produces rank(q: string): Artist[]; consumes
      store.fetchIndexed() from 1.2.
      Done: `bun test search` green; "renoir" returns ranked artists
      from the fixture catalog.
```

Every field earns its place: **C-id** ties work to the spec; **Doc** is the
official source with section, read before coding; **Files** are exact
paths; **Interfaces** are the cross-task contract — exact names and types
a neighboring task relies on; **Done** is mechanical — a gate command plus
an observable demonstration.

## Right-sizing

A task is the smallest unit that carries its own test cycle — split only
where a reviewer could reject one task while approving its neighbor. Fold
setup, config, and docs steps into the task whose deliverable needs them.

## Batch shapes

- **Walking skeleton first** — end-to-end through every layer, however
  thin; it flushes integration risk while the plan is cheapest to change.
- **Vertical slices** — batch by behavior (a C-id cluster), not by
  technical layer; a batch that ships only models proves nothing.
- **Related tasks** — shared module, shared model, or shared risk; 2–4
  per batch, boundaries are where quality gets checked.

## No placeholders

Plan failures — never write them:
- "TBD", "TODO", "flesh out later"
- "add appropriate error handling / validation / edge cases"
- "similar to task N" — state it fully; tasks are read alone
- an interface consumed that no earlier task produces
- a done-line that isn't a command plus an observable result

## Self-review — before presenting

1. **Coverage** — every unticked C-id in exactly one batch; every batch
   task tied to a C-id. List gaps, fix now.
2. **Placeholder scan** — the list above, plus vague done-lines.
3. **Interface consistency** — names and types produced in one task match
   what later tasks consume, exactly.

## The State section

Written by re-plan at every boundary — the post-compaction briefing:

```markdown
## State
Batch 2 closed 2026-07-19. Next: batch 3 (C7–C9).
- Decided: rank in SQL, not app code — 40ms vs 300ms on fixture (ADR).
- Failed: pg_trgm for ranking — no phrase support; don't retry.
- Open: is 10k-record fixture representative? (human)
```

Only what disk and git cannot re-derive: decisions with their why, failed
approaches with their reason, open questions. Never file contents, tool
output, or anything a fresh `git log` / file read reproduces.
