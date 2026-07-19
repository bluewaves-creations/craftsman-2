# Plan — Craftsman 2

Adapts at every batch boundary. Spec proxy until SPEC.md exists: the three
core goals — quality, speed, token efficiency (README).

## Batch 1 — AGENTS.md template v2
- [ ] 1.1 Add **Rules** section — perpetual tier only: universal seed
      (modern-first with docs-beat-memory, YAGNI, DRY-on-proof,
      comments-say-why with bad→good micro-example) + placeholder slots for
      stack-specific perpetual rules filled at init. Header states the split:
      perpetual here, activity rules in the skills.
      Done: rule set approved by human; template within budget.
- [ ] 1.2 Rework **Workflow → Flow**: state→skill routing table for exact
      triggering, announce-the-active-skill convention, fresh-session
      re-entry row (read SPEC, PLAN batch, ADR, git log — then route).
      Doc: code.claude.com/docs skills triggering. Done: every row names an
      existing skill in skills/.
- [ ] 1.3 Add **Ledgers** table (artifact · what it records · who writes) and
      compress the standing contract (spec freeze + checkbox carve-out,
      plan adapts, 3-attempts rule, extended review advisory) to 3–4 lines.
      Done: all four artifacts referenced with explicit write rules.
- [ ] 1.4 Mirror v2 structure into this repo's own AGENTS.md; extend
      scripts/check.sh to cross-check Flow-table skill names against
      skills/ directories. Done: `scripts/check.sh` green, batch review pass.

## Batch 2 (draft) — skill alignment
- craftsman-mode: seed Rules at init — universal four verbatim, then 2–4
  stack-specific perpetual rules derived from official docs (one line each);
  refresh path re-validates stack rules against current docs.
- Audit each skill: keep only activity-specific rules; strip anything the
  perpetual tier already covers (composition, not duplication).
- Align each SKILL.md description with the Flow-table state language.
- Decide the defect route (fix skill or Flow row — see Gaps).

## Batch 3 (draft) — validation
- Greenfield pilot: "build a todo app" must auto-route to brainstorm;
  walk one full cycle; measure real token overhead per phase.

## Gaps
- No route for defects: the flow only moves forward; a bug found mid-flight
  has no diagnose-first path (Craftsman 1 had one).
- No mechanical link yet between template promises and skills that exist
  (1.4 closes part of it).
- No trivial-change policy: does a typo fix pay the full flow?
- Extended review has no on-demand lenses (architecture/security/perf
  reference files).
