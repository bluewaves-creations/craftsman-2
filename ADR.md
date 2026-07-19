# Decisions — Craftsman 2

Read before re-litigating anything. Newest first.

## 2026-07-19 — Two-tier composable rules
Context: fundamental rules (idiomatic-modern, DRY, YAGNI, clean comments)
needed a home that guarantees they always bind without bloating every skill.
Decision: two complementary locations that compose. Perpetual rules live in
AGENTS.md Rules (read every turn, never compacted): a universal seed plus
stack-specific perpetual rules that craftsman-mode derives from official docs
at init and re-validates on refresh. Activity-specific rules live only in the
skill whose phase they bind (test-first in implement, evidence language in
verify). A rule appears in exactly one tier.
Rejected: all rules in skills (perpetual rules would vanish whenever no skill
is active); all rules in AGENTS.md (burns the 100-line budget on phase detail
that only matters when the phase runs).

## 2026-07-19 — Verify per task, review per batch
Context: cadence of quality checks had to balance speed against drift.
Decision: verify (gates + evidence) closes every task; a systematic fresh-eyes
review closes every batch; extended reviews run only on demand and are never
a gate.
Rejected: review-on-demand-only (both ancestor flows converged on systematic
boundary review — the context that wrote the code can't see its own blind
spots); review-per-task (too much ceremony, kills flow speed).

## 2026-07-19 — Verdicts stay mechanical, without a bespoke CLI
Context: Craftsman 1's founding datum — LLM-as-judge recognizes correct code
only 52–78% of the time — still holds for self-assessment of fresh code.
Decision: gates are the project's own toolchain commands declared in AGENTS.md;
green means exit 0 with pasted output. No custom CLI in the loop.
Rejected: trusting model self-assessment (the one irreplaceable Craftsman 1
insight); rebuilding a CLI (22k lines of enforcement for what declared
commands already give).

## 2026-07-19 — Guide and show over tell and control
Context: Craftsman 1 controls via machine, Superpowers via engineered
persuasion (iron laws, rationalization tables). Both are heavy in their way.
Decision: lean constitution (AGENTS.md ≤100 lines, read every turn, never
compacted) + eight sharp skills (≤70 lines) built on one example per
convention. Budgets enforced by `scripts/check.sh`.
Rejected: heavy behavioral skills (token cost, ceremony on small tasks);
trailer-based ledgers (without a single-writer CLI a commit trailer is prose,
not evidence — tests are the evidence, commits are the narrative).
