# Decisions — Craftsman 2

Read before re-litigating anything. Newest first.

## 2026-07-19 — Trivial changes: the Quick Path
Context: the flow needed a policy for tiny changes — does a typo fix pay
the full spec→plan→implement→verify→review cycle?
Decision: route by observable behavior, never by size. No observable
behavior change (typo, comment, docs, mechanical rename) → quick path:
skips plan and review, never the gates — full gates, fresh evidence, one
typed commit. Behavior the spec covers → specify's post-freeze delta (no
size exemption to the freeze). Uncovered behavior → specify. Broken →
fix. Tripwires: test assertions must stay untouched (else it wasn't
trivial), and the moment a quick change grows behavior it enters the
flow — no "while I'm here". Lives as a standing-contract clause, not a
skill: a routing rule must be always-resident, and the Flow table's rows
are mechanically bound to skills/.
Rejected: full ceremony for everything (superpowers' stance — kills
speed); a tenth quick skill (a routing rule behind a trigger is
circular); size-based judgment (self-assessment of "smallness" is
exactly what we don't trust — behavior-based routing is checkable).

## 2026-07-19 — Commit discipline: feat + separate refactor commits per task
Context: v0 said "one task, one commit", but refactor-while-green is a
duty and mixing it with behavior makes the ledger undiagnosable.
Decision: a task lands as one feat commit (the behavior, [C-id] tagged)
plus zero or more refactor(scope) commits — never mixed. The Ledgers row
stays "implement per task; plan per boundary".
Rejected: single squashed commit per task (hides which change moved
behavior); free-form commits (loses the task↔C-id narrative).

## 2026-07-19 — Plans carry structure, not code
Context: superpowers writes complete code into every plan step, targeting a
zero-context executor with "questionable taste"; that model buys certainty
at heavy token cost and the embedded code goes stale the moment execution
deviates.
Decision: PLAN.md locks what and where — C-ids, official doc per task,
exact file paths, cross-task interface contracts, mechanical done-lines —
never how. Code is written once, in implement, docs open. Boundary ritual
borrowed from Craftsman v1: extract to a State section (only what disk and
git cannot re-derive) and suggest compaction unconditionally at every
boundary (v1 dogfood: the conditional suggestion never fired).
Rejected: full code-in-plan (stale + token-heavy for a frontier executor
with docs access); architecture essays in PLAN.md (rationale belongs in
ADR.md, structure in the plan).

## 2026-07-19 — Skill descriptions: triggers and boundaries, never process
Context: skills must be Agent Skills open-spec compliant (agentskills.io) and
trigger precisely — no false positives, no skipped bodies.
Decision: descriptions state the capability in one clause, then triggering
contexts ("Use when …" with the phrases users actually say), then explicit
non-triggers ("Not for … (use X)"). Never a summary of the skill's process —
superpowers testing showed agents follow a process-bearing description as a
shortcut and skip the skill body. Frontmatter uses only spec fields (name
matching the directory, description ≤1024 chars, license, compatibility,
metadata); the gate enforces name==dir and the presence of "Use when".
Validation via `uvx --from skills-ref agentskills validate`.
Rejected: when-only descriptions (the open spec expects what+when; capability
naming is safe — it's process summaries that cause body-skipping); vendor
frontmatter fields (breaks portability across harnesses).

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
compacted) + a set of sharp skills (≤70 lines) built on one example per
convention. Budgets enforced by `scripts/check.sh`.
Rejected: heavy behavioral skills (token cost, ceremony on small tasks);
trailer-based ledgers (without a single-writer CLI a commit trailer is prose,
not evidence — tests are the evidence, commits are the narrative).
