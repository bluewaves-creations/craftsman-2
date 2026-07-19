# Security & Performance Lens

Evidence rule: file:line plus a failure scenario ("unauthenticated call
reaches X", "N+1 at 10k records") or a measured number. Speculation
labeled as such.

## Security

- **Input at every boundary** — validate where data enters (API, file,
  queue, env), not deep inside; reject, don't sanitize-and-hope.
- **Injection surfaces** — string-built SQL/shell/HTML near user data;
  parameterize or escape at the boundary, never mid-flow.
- **AuthZ on every path** — each new endpoint/handler: who may call it,
  where is that checked, does the check precede the work? A criterion's
  "unauthorized" edge without a test is a finding.
- **Secrets** — nothing sensitive in code, logs, error messages, or
  fixtures; config comes from the environment.
- **Dependencies** — new deps this batch: maintained? pinned? worth the
  surface? A 10-line utility isn't worth a transitive tree.
- **Failure leaks** — errors to users say what to do, never internals
  (paths, queries, versions).

## Performance

- **Measured, not vibed** — a criterion's bound ("under 300 ms") has a
  measurement in evidence; "feels fast" is not data. Findings without
  numbers are labeled speculative.
- **N+1 and chatty IO** — a query or call inside a loop over unbounded
  data; batch it or join it.
- **Blocking on the hot path** — sync IO, unbounded waits, or heavy
  compute where the platform expects non-blocking.
- **Unbounded growth** — collections, caches, logs, queues with no
  eviction or limit; name what fills them.
- **Indexes & access patterns** — new queries against real volume: what
  supports them? Fixture-scale green proves nothing about 10k.
- **Premature optimization symmetry** — complexity added for speed
  nobody measured is overdesign; flag it like any abstraction without
  proof.

## Calibration

Critical: exploitable or data-losing today. Important: wrong under load,
unauthorized edge untested, secret in the tree. Minor: hardening,
speculative scale seams. Never inflate — a picky reviewer with inflated
severities gets ignored.
