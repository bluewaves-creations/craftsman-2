# Criteria Authoring

Every criterion is simultaneously a requirement the human approves, a
checklist verify ticks with evidence, and a reference the plan cites by ID.
Write nothing that can't survive all three roles.

## Anatomy

```markdown
- [ ] C7. Searching "renoir" returns matching artists ranked by relevance,
      under 300 ms for a 10k-record catalog.
      - Edge: empty query shows recent searches, not an error.
      - Edge: zero results offers the closest spelling match.
```

Stable ID (C-numbers are global across the spec, never reused or
renumbered) · one observable behavior · concrete values · a bound where it
matters · edge cases indented beneath their criterion.

## One criterion, one observable behavior

If checking it requires verifying two unrelated facts, split it. A
criterion that can fail for two different reasons is two criteria.

## Declarative, never mechanics

Behavior, not implementation. No selectors, button labels, function names,
endpoints, or table names — the criterion must survive a rewrite of the
UI, the API, and the storage layer unchanged.

```markdown
# BAD — dies on the first redesign
- [ ] C3. Clicking the "+" button appends an <li> to .todo-list.

# GOOD — behavior only
- [ ] C3. Adding "Buy milk" shows it in the todo list.
```

## Concrete values, not abstractions

"Buy milk", 30 minutes, €10.00 — never "some item", "a valid input", "an
appropriate error". Concrete values make criteria checkable and make
disagreement visible at review. Value-driven variations become one
criterion with a variations table:

```markdown
- [ ] C9. Setting an invalid quantity is rejected and the cart is unchanged.
      | quantity | reason           |
      | 0        | quantity too low |
      | 1000     | exceeds stock    |
```

## Edge-case taxonomy — hunt each, keep what applies

empty · duplicate · concurrent · unauthorized · too big · malformed ·
offline · slow. Probe boundaries explicitly (exactly 30 minutes, exactly
the limit).

## Anti-patterns

| Anti-pattern | Smell | Fix |
|---|---|---|
| Abstract outcome | "an appropriate message is shown" | name the exact message or effect |
| Conjunctive | "logs in and adds an item and checks out" | one action; split |
| Chaining | "after the previous criterion succeeds" | each criterion self-contained |
| Implementation leak | "SessionStore.expire() is called" | assert the observable effect |
| Incidental detail | named user when the name is irrelevant | only values the outcome depends on |
| Unbounded quality | "fast", "gracefully", "robust" | a number, or cut the clause |

## Before presenting

Self-review with fresh eyes: placeholder scan (TBD, vague requirement),
two-readings check (any line interpretable two ways → pick one, make it
explicit), contradiction scan, scope check (one plan's worth, or propose
decomposition). Fix inline, then present.
