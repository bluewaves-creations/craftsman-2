---
name: specify
description: Use when new work needs acceptance criteria — after a brainstorm, or when the human describes a feature to build or change
---

# Specify

Write SPEC.md: plain-language acceptance criteria a non-programmer could check.
The spec is frozen once approved — only the human edits words after that.

## Method
1. Draft criteria from the brainstorm handoff or the ask.
2. For each criterion, hunt edge cases: empty, duplicate, concurrent,
   unauthorized, too big, offline. Keep the ones that apply.
3. Walk the spec with the human. Approval freezes it.

## Shape of a good criterion
Bad: "Search should be fast and handle errors gracefully."
Good:
```markdown
- [ ] Searching "renoir" returns matching artists ranked by relevance,
      under 300 ms for a 10k-record catalog.
- [ ] Edge: empty query shows recent searches, not an error.
- [ ] Edge: zero results offers the closest spelling match.
```
Each criterion is checkable — a specific action, a visible outcome, a bound
where it matters. Checkbox ticks are the one agent write allowed in SPEC.md
(done by verify, with evidence) — the words never move.

## During implementation
The spec doesn't adapt; the plan does. If reality contradicts the spec, stop
and bring it to the human — propose the change, never apply it.

## Never
- Edit the words of an approved SPEC.md.
- Write a criterion you can't demonstrate with a test or a hands-on check.
