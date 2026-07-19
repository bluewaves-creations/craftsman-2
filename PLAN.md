# Plan — Craftsman 2

Adapts at every batch boundary. Spec proxy until SPEC.md exists: the three
core goals — quality, speed, token efficiency (README).

## Batch 1 — AGENTS.md template v2
- [x] 1.1 Add **Rules** section — perpetual tier only: universal seed
      (modern-first with docs-beat-memory, YAGNI, DRY-on-proof,
      comments-say-why with bad→good micro-example) + placeholder slots for
      stack-specific perpetual rules filled at init. Header states the split:
      perpetual here, activity rules in the skills.
      Done: rule set approved by human; template within budget.
- [x] 1.2 Rework **Workflow → Flow**: state→skill routing table for exact
      triggering, announce-the-active-skill convention, fresh-session
      re-entry row (read SPEC, PLAN batch, ADR, git log — then route).
      Doc: code.claude.com/docs skills triggering. Done: every row names an
      existing skill in skills/.
- [x] 1.3 Add **Ledgers** table (artifact · what it records · who writes) and
      compress the standing contract (spec freeze + checkbox carve-out,
      plan adapts, 3-attempts rule, extended review advisory) to 3–4 lines.
      Done: all four artifacts referenced with explicit write rules.
- [x] 1.4 Mirror v2 structure into this repo's own AGENTS.md; extend
      scripts/check.sh to cross-check Flow-table skill names against
      skills/ directories. Done: `scripts/check.sh` green, batch review pass.

## Batch 2 — craftsman-mode best-in-class
Skill-by-skill rework begins: open-spec compliant, composable, zero ambiguity.
- [x] 2.1 Gate first: check.sh validates name matches directory and
      description contains "Use when" anywhere in frontmatter (open-spec
      folded descriptions). Done: green on current skills, red on violation.
- [x] 2.2 Rework craftsman-mode: open-spec frontmatter (folded description
      with triggers + non-triggers, license, compatibility), route table
      (greenfield / brownfield / refresh, no default), brainstorm-on-ambiguity
      handoff, stack-agnostic gate discovery (web, apps, data, CLI), rules
      seeding, red→green loop proof. references/greenfield.md +
      brownfield.md. Sources: skill-shaper, Craftsman v1 init, superpowers
      SDO. Done: gate green; open-spec validator passes if available.
- [x] 2.3 Record the description-format decision (triggers and boundaries,
      never process) in ADR.md; update the AGENTS.md convention example.

## Later batches (draft)
- One batch per remaining skill: brainstorm, specify, plan, implement,
  verify, review, finish — same treatment; strip rules the perpetual tier
  covers; align descriptions to Flow-table states.
- Decide the defect route (fix skill or Flow row — see Gaps).
- Greenfield pilot: "build a todo app" must auto-route through the flow;
  measure real token overhead per phase.

## Gaps
- No route for defects: the flow only moves forward; a bug found mid-flight
  has no diagnose-first path (Craftsman 1 had one).
- No mechanical link yet between template promises and skills that exist
  (1.4 closes part of it).
- No trivial-change policy: does a typo fix pay the full flow?
- Extended review has no on-demand lenses (architecture/security/perf
  reference files).
