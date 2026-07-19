---
name: review
description: Use when a batch completes (systematic fresh-eyes pass) or when the human asks for an extended architecture and code review
---

# Review

Verify proves it works; review asks if it's good. Systematic at every batch
boundary; extended only when the human asks.

## Batch review (systematic)
Fresh eyes on the whole batch diff — dispatch a subagent with clean context
when available: the context that wrote the code can't see its own blind spots.

Checklist:
- **Spec compliance** — the diff does what the criteria say, and nothing else.
- **Architecture** — dependencies point the right way; no layer skipped; the
  batch didn't bend the design to ship faster.
- **Clean code** — naming says intent; no duplication; dead code deleted;
  functions small enough to read.
- **Tests** — assert behavior, not implementation; spec edge cases present;
  would a mutation actually fail one?
- **Conventions** — matches the AGENTS.md examples, not just their letter.

Findings become an improvement loop: fix → verify → re-review until clean.
Then re-plan the remaining batches and report to the human.

## Extended review (on demand)
Wider lens across the whole codebase: pattern consistency, coupling trends,
abstraction health, performance and security posture. Output: findings ranked
by severity, written into PLAN.md as an improvement batch — human approves
before implementation. Advisory, never a gate.

## Never
- Skip batch review because the batch "was simple."
- Land review fixes without going back through verify.
