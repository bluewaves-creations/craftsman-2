# Diagnosis Toolkit

Loaded when reproduction is elusive or the cause hides across layers.
One variable at a time, always — two changes per experiment means the
result proves nothing.

## Boundary instrumentation — multi-component failures

Before proposing anything in a system of layers (CI → build → sign,
API → service → DB): log what enters and exits each boundary, run once,
read where the data goes wrong — then investigate that layer only.

```
=== layer 1 (workflow): IDENTITY: SET
=== layer 2 (build env): IDENTITY not in environment   ← breaks here
```

The point: evidence says *where* before anyone argues about *why*.

## Introducing-commit hunt

For regressions, the introducing commit is half the diagnosis:

```
git bisect start; git bisect bad HEAD; git bisect good <last-known-good>
git bisect run <the reproduce command>
```

The commit's diff narrows the cause to lines; its message and C-id tell
you what the change *meant* to do — the fix must preserve that intent.
Bisect only with a deterministic repro — a flaky command lands on the
wrong commit.

## Differential debugging

Works there, fails here → enumerate every difference before touching
anything: version, config, data shape, timing, environment, order of
operations. The cause is in the list; strike entries by experiment,
cheapest first.

## Minimal-repro shrinking

Halve the failing input/scenario repeatedly; keep the half that still
fails. Stop when removing anything makes it pass — what remains is the
cause's silhouette, and usually names it.

## Hypothesis log — the running record

Keep it in the conversation; it becomes the report (and the ADR entry if
you stop at three dead):

```
H1: stale cache serves old ranking.
    Experiment: bypass cache flag. Predicted: correct order. Observed:
    still wrong. DEAD.
H2: tie-break unstable when scores equal.
    Experiment: force two equal scores. Predicted: order flips between
    runs. Observed: flips. ROOT CAUSE.
```

Predicted-before-observed is the discipline: a prediction written after
the result is a story, not an experiment.

## When reproduction won't come

- Log at the failure's boundary and wait for the next occurrence —
  instrumented waiting beats blind patching.
- Check clock, locale, timezone, concurrency, and data-volume
  differences from your environment — the classic "only in prod" causes.
- Still nothing → report what was instrumented and observed; never ship
  a speculative fix for an unreproduced defect.
