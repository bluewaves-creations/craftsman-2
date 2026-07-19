---
name: review
description: >
  Judge whether the work is good — architecture, design, code quality —
  after verify proved it works. Use when a batch's tasks are all verified
  (systematic batch review), or when the human asks for a review, critique,
  or feedback ("review this", "is this good", extended architecture /
  security / performance passes). Not for proving correctness (verify),
  fixing outside the loop (implement), or re-planning (plan).
license: MIT
compatibility: Benefits from a subagent-capable harness for fresh-context review; requires git.
metadata:
  version: "0.2.0"
---

# Review

Verify proves it works; review asks if it's good — the one verdict that
legitimately belongs to an agent. Picky is the job: a finding too small to
mention is still a finding. The bar is AGENTS.md — apply it, never invent
it; propose bar changes to the human instead. Name what is *good* too —
praise that's accurate teaches taste.

## Batch review — closes every batch

1. **Dispatch fresh eyes** — a read-only subagent on the batch range
   (base..head) with: the batch's criteria and tasks, the AGENTS.md bar,
   the checklist below, severity calibration (not everything is critical),
   and the evidence rule — every finding cites file:line plus a failure
   scenario or concrete counterexample. No subagent available → self-review
   after re-reading spec and bar, same rules.
2. **Checklist** — spec compliance (the diff does what the criteria say,
   nothing else — and if the plan itself is wrong, say so) · architecture
   & design (`references/architecture.md`) · code quality
   (`references/code-quality.md`) · tests (meaningful assertions — would
   the mutation die?) · conventions (match the AGENTS.md examples).
3. **Receive with rigor** — verify each finding against the code before
   acting; no performative agreement. Unconfirmable → mark plausible, the
   human decides. Any finding unclear → clarify before fixing *any*;
   findings interrelate. Wrong finding → push back with reasoning.
4. **Improvement loop** — fixes follow implement's rules (fix/refactor
   commits) → verify (fresh evidence) → re-review the fixes. Loop until
   no critical or important findings remain; minors: fix now or log to
   PLAN.md Gaps with a reason — never silently dropped.
5. **Report** — strengths, findings with outcomes, what went to Gaps.
   Then "→ plan" (re-plan) closes the boundary.

## Extended review — on demand, advisory, never a gate

The human names the scope (whole codebase, a subsystem, a concern). Load
the lenses that fit: `references/architecture.md`,
`references/code-quality.md`, `references/security-performance.md`.
Output: ranked findings (critical / important / minor, evidence rule
applies) and a proposed improvement batch for PLAN.md — the human approves
before anything is implemented. This mode changes no code.

## Never

- Skip batch review because the batch "was simple".
- Re-litigate or contradict a gate's verdict — gate output is settled fact.
- Fix a finding you haven't confirmed against the code.
- Land review fixes without going back through verify.
- Let an extended review block a commit, a batch, or a ship.
