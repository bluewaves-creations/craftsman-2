# Project File Templates

Copy the skeletons below when initializing a project.

## SPEC.md

```markdown
# Spec — {Project}

Status: draft | approved {date}
Frozen at approval. Only the human edits words; verify ticks boxes.

## {Feature}
- [ ] {Actor} {action} → {visible outcome}{, bound if it matters}.
- [ ] Edge: {empty | duplicate | concurrent | unauthorized | too-big | offline}.
```

## PLAN.md

```markdown
# Plan — {Project}

Adapts at every batch boundary. The spec never moves.

## Batch 1 — walking skeleton
- [ ] 1.1 {Task} (criterion {n}). Doc: {source}. Done: {gate + demonstration}.
- [ ] 1.2 {Task} (criterion {n}). Doc: {source}. Done: {gate + demonstration}.

## Gaps
- {claim no gate checks yet}
```

## ADR.md

```markdown
# Decisions — {Project}

Read before re-litigating anything. Newest first.

## {date} — {Decision title}
Context: {why it came up}
Decision: {what, and why}
Rejected: {alternatives and why — including three-attempt dead ends}
```
