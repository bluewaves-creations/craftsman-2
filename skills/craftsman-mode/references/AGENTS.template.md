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

## Rules
Perpetual — bind on every line, every phase. Activity rules live in the skills.
- **Modern first** — the stack's latest official idioms. When memory and the
  Documentation sources disagree, the docs win; training data is stale.
- **YAGNI** — build what the spec asks. The next task exists.
- **DRY on proof** — extract at the third occurrence, not the first.
- **Comments say why, never what**:
  ✗ `// increment retry counter`
  ✓ `// idempotency keys expire after 24h — refresh before retry`
- {Stack rule — seeded at init from official docs, e.g. "Swift: actors over
  locks; async/await, never completion handlers"}
- {Stack rule}

## Conventions
One example each — match the shape. {grows as the code teaches}

{Convention name}:
```{lang}
{minimal example of the right way}
```

{Convention name}:
```{lang}
{minimal example of the right way}
```

## Gates
Green means exit 0, evidence pasted. All gates, end of every task.
- Test: `{command}`
- Lint: `{command}`
- Types: `{command}`
- Build: `{command}`

## Flow
Announce the active skill ("→ implement, task 2.1"). Route by state:

| State | Skill |
|---|---|
| New project, significant pivot, or direction unclear / conflicting goals | brainstorm |
| Work described, no acceptance criteria | specify |
| Spec approved, or batch boundary passed | plan |
| Next task open in PLAN.md | implement |
| Task code complete | verify |
| Batch tasks all verified | review |
| Every criterion ticked | finish |

Fresh session: read SPEC.md, PLAN.md (State section + current batch),
ADR.md, `git log -5` — then route by state.

Standing contract: spec frozen at approval — the agent drafts and refines,
validation is always mine, no spec alteration without it (verify ticks
boxes) · plan adapts each batch, 2–4 tasks per batch · attempt budget
spent (3 default; verify classifies) → stop, ADR.md, ask me · extended
review on demand, advisory only.

## Ledgers
| Artifact | Records | Written by |
|---|---|---|
| SPEC.md | what must be true | agent drafts, I validate; verify ticks boxes |
| PLAN.md | path, batches, gaps | plan/review; implement+verify log gaps; verify ticks |
| ADR.md | decisions and dead ends | any skill, append-only |
| git log | implementation narrative | implement per task; plan per boundary; verify/review fixes |
