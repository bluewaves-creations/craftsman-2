# Emergent Tests — extending the QA harness

Acceptance criteria (SPEC.md) are the human's contract; verify is their
judge. This file governs everything beneath them: the unit, integration,
and property tests that emerge from implementation. Write them for
assertion quality, never volume — test count has no effect on outcomes;
what a test can catch does.

## What earns a unit test

- **Non-trivial logic** — an algorithm, calculation, policy decision.
- **Branches** — every conditional path no criterion forces, especially
  the sad ones.
- **Transformations** — parsing, mapping, formatting; assert shape and
  values.
- **Error paths** — each distinct failure raises the documented error,
  not a generic one.
- **Boundaries** — empty, one, many; zero, negative, max; off-by-one
  edges of every range handled.

`parse_duration("1h30m")` earns tests for "90m", "0s", "", "garbage",
overflow — five behaviors one happy-path criterion never exercises.

## What never earns a unit test

Getters and pure delegation; framework wiring and generated code;
behavior a criterion already exercises with no extra logic. A test on
trivial code is negative value: it pins the implementation and catches
nothing a plausible bug would break.

## The right-level rule

Behavior covered by a criterion → never duplicate it below; the criterion
is the verdict. Internal complexity the criterion can't reach (edge
cases, error branches, invariants) → unit-test exactly those paths.

## Integration tests at real boundaries

Where two modules meet for real: contracts (endpoint + real database,
service + fake-server API), serialization (roundtrip the actual wire
format), transactions (assert the rollback path, not just commit). Use
the real boundary technology — a mock of the boundary tests your
assumptions, not the contract.

## Mocks — the distilled anti-patterns

- **Never assert on a mock's behavior** — a test that verifies the mock
  was called tests the mock, not the code. Assert observable outcomes.
- **No test-only methods in production code** — test seams live in tests.
- **Mock only what you understand** — an incomplete mock of a real API
  encodes your misreading of it; prefer the real thing in-process.
- **Prefer real code** — mock at most the process boundary (network,
  clock, randomness), never your own modules.

## Property-based tests — invariant-heavy code only

Pays on parsing, encoding, stateful cores, algebraic logic; never on glue
or CRUD. Three patterns earn a property: **roundtrip**
(`decode(encode(x)) == x`), **invariant** (`isSorted(sort(xs))`),
**oracle** (fast implementation agrees with the obviously-correct slow
one). A shrunk counterexample is your next failing-first test case.

## Quality rules — write tests that survive mutation

- Before keeping a test, name the mutation it kills (flipped comparison,
  off-by-one, dropped branch, swapped argument). Can't name one → delete
  or strengthen.
- No print-debugging dressed as a test: "did not throw" asserts nothing.
- Assert what the caller observes — outputs, state changes, errors —
  never call order or private structure. A behavior-preserving refactor
  must leave every test green; that is what refactor-while-green means.
- One behavior per test, named for the behavior:
  `test_rejects_expired_token`, not `test_token_2`. The name is the
  diagnosis when it fails weeks later.

Coverage is a floor, never a target — executed lines asserting nothing is
the exact gaming pattern these rules exist to catch.
