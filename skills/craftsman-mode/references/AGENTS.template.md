# {Project}

> {One line — what this is.}

## Vision
{3–5 lines: what, for whom, why now, what good looks like. Moves on pivots only.}

## Stack
- {Language + version}
- {Framework + version}
- Constraint: {hard constraint, e.g. "offline-first — no network in core paths"}

## Documentation
Read before coding — official sources only.
- {Framework}: {MCP server or docs/ path}
- {Library}: {MCP server or docs/ path}

## Gates
Green means exit 0, evidence pasted. Run by verify at the end of every task.
- Test: `{command}`
- Lint: `{command}`
- Types: `{command}`
- Build: `{command}`

## Conventions
One example each — match the shape.

{Convention name}:
```{lang}
{minimal example of the right way}
```

{Convention name}:
```{lang}
{minimal example of the right way}
```

## Workflow
Artifacts: SPEC.md (frozen — only I edit words; verify ticks boxes) ·
PLAN.md (adapts each batch) · ADR.md (decision ledger) · git log (one task,
one commit).

- **brainstorm** — on demand: new direction or pivot, not routine batches.
- **specify** — acceptance criteria with edge cases; frozen at approval.
- **plan** — batches of 2–4 tasks, each citing its official doc.
- **implement** — ground in docs → failing test → minimal green → refactor →
  commit. Three failed attempts: stop, ADR.md, ask me.
- **verify** — end of every task: all gates, pasted evidence, gap pass.
- **review** — end of every batch: fresh-eyes checklist + improvement loop.
  Extended review on demand.
- **finish** — full QA, ADR consolidation, docs, ship.
