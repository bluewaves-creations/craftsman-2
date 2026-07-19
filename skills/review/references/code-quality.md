# Code Quality Lens

Evidence rule: file:line plus failure scenario or concrete counterexample.
Picky is correct — smallness is not a defense; severity calibration is.

## Naming

- Names say intent at the call site: `retryWithBackoff(op)`, not
  `handleOp(op, true, 3)`.
- Lying names — a `get` that mutates, a `check` that throws, a plural
  that holds one.
- Domain terms match the spec's vocabulary — a criterion says "catalog",
  the code says "inventory": pick one, everywhere.

## Shape

- Functions read top-to-bottom at one level of abstraction; a reader
  shouldn't hold three nesting levels to follow the happy path.
- Guard clauses over arrow-shaped nesting.
- File and function budgets honored (AGENTS.md); size earned, not
  accreted.

## Duplication & dead weight

- Third occurrence unextracted — finding. First abstraction over one
  occurrence — also a finding.
- Dead code: unreferenced exports, commented-out blocks, unreachable
  branches, feature flags nothing reads. Git remembers; delete.
- Imports, deps, fixtures added this batch that nothing uses.

## Errors

- Every failure path decided, not defaulted: handled where action is
  possible, propagated where not — never swallowed.
- Error messages carry what the operator needs (what failed, with which
  input, what to do), not stack noise or vagueness.
- The documented error, not a generic one — callers branch on it.

## Comments & types

- Comments say why (constraint, tradeoff, spec reference), never narrate
  the code. Narration is a finding; so is a missing why on a surprise.
- No `any` / untyped escape hatches where the domain is known; no
  suppression comments standing in for fixes.

## Tests (meaningfulness, not count)

- Every new test: name the mutation it kills. None nameable → it's
  decoration.
- Assertions on observable behavior, not mocks or internals.
- The batch's edge cases (from criteria) present, not just happy paths.
- Test names read as behavior statements; a failure two weeks from now
  should diagnose itself.
