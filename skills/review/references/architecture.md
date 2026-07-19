# Architecture & Design Lens

Evidence rule: every finding cites file:line plus a failure scenario or a
concrete counterexample. "The design feels off" is not a finding.

## Dependency direction

- Do imports point the way the file map says? A lower layer importing a
  higher one is a finding even when it works today.
- Any cycle, however small — two modules importing each other is a merged
  module wearing two names.
- Reach-through: `a.b.c.d` chains mean the boundary leaks its internals.

## Boundaries & coupling

- Could you rewrite this module's internals without touching its
  consumers? If not, name what leaks (types, ordering assumptions,
  side-channel state).
- Shared mutable state across boundaries — who else writes what this
  reads?
- The change-together test: files that always change in the same commit
  but live in different modules are one unit, mis-split.

## Cohesion & responsibility

- One sentence per file: "this file does X." Needs an "and"? Finding.
- A function taking flags that select behaviors is two functions.
- Utility drawers (`utils.ts`, `helpers.py`) growing this batch — what in
  them belongs to a real module?

## Abstraction health

- Interfaces with one implementation, layers that only delegate,
  config for a single caller — overdesign; YAGNI applies to structure.
- The inverse: a third duplication that should have become an
  abstraction and didn't.
- Wrong-level abstraction: business rules inside IO code, IO inside pure
  logic.

## Design fit

- Does the shape match the spec's shape? A one-screen diff-view spec
  implemented as a dashboard framework is architecture drift, however
  clean.
- Did this batch bend the design to ship faster — a boundary crossed
  "just this once", a special case where the model should have moved?
- Pattern consistency: same problem, same solution as elsewhere in the
  codebase? A second pattern for an existing problem needs an ADR, not a
  precedent.

## Concurrency & state

- Check-then-act on shared state: is the read-modify-write atomic, or is
  there a window (TOCTOU, lost update)?
- Await/lock ordering consistent across call sites; anything unawaited
  that the caller assumes finished?
- Reentrancy: can this handler fire again before its first run completes,
  and does the state survive that?
- Shared caches and singletons written from more than one path — who
  invalidates, and when?

## Scale & integration seams

- What breaks first at 10x data / users / calls? Name the seam, not a
  rewrite.
- New external surface (endpoint, schema, event): versioned? Backward
  compatible? Migration stated?
