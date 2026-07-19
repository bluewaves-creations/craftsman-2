# Project File Templates

Copy the skeletons below when initializing a project.

## SPEC.md

```markdown
# Spec — {Project}

Status: draft | approved {date}
Frozen at approval. The agent drafts and refines; every alteration needs
human validation. Verify ticks the boxes.

## {Feature}
- [ ] C1. {Actor} {action} → {observable outcome}{, bound if it matters}.
      - Edge: {empty | duplicate | concurrent | unauthorized | too-big | malformed | offline | slow}.

## Deferred — open questions
- {question} — blocks {what}
```

## PLAN.md

```markdown
# Plan — {Project}

Adapts at every batch boundary. The spec never moves.

## Batch 1 — walking skeleton
- [ ] 1.1 {Task} (C{n}). Doc: {source}. Done: {gate + demonstration}.
- [ ] 1.2 {Task} (C{n}). Doc: {source}. Done: {gate + demonstration}.

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
