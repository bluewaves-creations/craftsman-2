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

## Batch 3 — brainstorm best-in-class
- [x] 3.1 Rework brainstorm SKILL.md: open-spec frontmatter (triggers:
      inception, complex/fuzzy/ambiguous work, on request; non-triggers),
      bold personality, dream-big → ground → converge arc with docs-grounded
      feasibility, riskiest-assumption kill test, timeboxed spikes, explicit
      exits table (inception / feature / mid-flight fog). Sources:
      superpowers brainstorming (one question at a time, decompose-first,
      approaches + recommendation), double diamond & continuous discovery,
      Apple think-different filters.
- [x] 3.2 references/techniques.md: reframing, divergence, taste-filter, and
      grounding toolkit — micro-example each, loaded on demand.
- [x] 3.3 Align the brainstorm trigger language in AGENTS.template.md Flow
      table; gate + open-spec validator green.

## Batch 4 — specify best-in-class
- [x] 4.1 Rework specify SKILL.md: open-spec frontmatter; librarian stance
      (docs at spec time — no source, no criterion); intake from brainstorm
      brief (seamless seam) or direct ask; example-mapping interview with
      stop conditions; self-review pass (placeholders, consistency,
      two-readings ambiguity, scope); approval freezes; post-freeze deltas
      as ADDED/MODIFIED/REMOVED with human-approved exact wording; numbered
      stable criteria IDs (C1…) for the plan handover.
- [x] 4.2 references/example-mapping.md (v1 adaptation, map → criteria) and
      references/criteria-authoring.md (anatomy, declarative-not-mechanics,
      concrete values, edge-case taxonomy, anti-pattern table with good/bad
      examples).
- [x] 4.3 Align templates.md SPEC skeleton (C-ids, Deferred — open questions
      section) and PLAN done-line citation; gate + validator green.

## Batch 5 — plan best-in-class
- [x] 5.1 Rework plan SKILL.md: three modes (initial / re-plan at boundary /
      gap check); architecture grounding (docs → idiomatic patterns → file
      map; consequential choices → ADR.md with rejected alternatives);
      2-batch detail horizon (detail decays); boundary protocol borrowed
      from v1: fold learnings → gap pass → extract State → suggest
      compaction unconditionally → wait.
- [x] 5.2 references/plan-authoring.md: plan header (goal, architecture,
      constraints), file map, task anatomy (C-id · doc · files · interfaces
      · done-line), right-sizing, batch shapes, no-placeholder list,
      self-review, State-section format (extract only the non-derivable).
- [x] 5.3 templates.md PLAN skeleton (header + State section), review→plan
      handoff line, ADR entry "plans carry structure, not code";
      gate + validator green.

## Batch 6 — implement best-in-class
- [x] 6.1 Rework implement SKILL.md: task loop (ground with Rules/Conventions
      re-read + deprecation check → red with watch-it-fail + stale-plan
      detection → green minimal → root-cause-not-patches → refactor →
      QA-extend → commit → "→ verify"); zero tolerance rules (implementation
      gap, guideline drift, architecture hacks); discovery routes (spec
      contradiction → specify, architecture blocks → plan, found bug →
      Gaps); commit discipline (feat + separate refactor commits, [C-id]).
- [x] 6.2 references/testing.md: emergent-tests doctrine from v1 (what
      earns/never earns a test, right-level rule vs criteria, integration at
      real boundaries, property patterns, mutation-minded quality rules) +
      superpowers mock anti-patterns distilled.
- [x] 6.3 references/clean-code.md: refactoring-is-not-a-crime (rule of
      three, dead code deleted on sight, no overdesign), dirty-patch
      bad→good table, refactor-commit boundaries; ADR note on commit
      discipline; gate + validator green.

## Batch 7 — verify best-in-class
- [x] 7.1 Rework verify SKILL.md: open-spec frontmatter; fresh-evidence
      doctrine (output that didn't run after the last change doesn't
      exist); method — all gates full scope → done-line demonstration →
      evidence pasted → red fix loop with failure classes and budgets
      (new-code 3, regression 2, environment 1) + amend path → gap pass →
      tick C-box and task box → route ("→ implement" next task or
      "→ review" when the batch is fully ticked).
- [x] 7.2 references/evidence.md: evidence anatomy, claims→required-proof
      table, regression red-green re-verification, subagent diff-not-report
      rule, failure classification, gap-pass question set, excuse→reality
      table.
- [x] 7.3 Seam sweep (Flow row, Gates wording, implement handoff) +
      gate + validator green.

## Batch 8 — review best-in-class
- [x] 8.1 Rework review SKILL.md: picky stance (bar = AGENTS.md, applied
      never invented; strengths named — praise teaches taste); batch mode —
      fresh-context read-only reviewer on base..head with spec+plan context,
      findings received with rigor (verify before fixing, no performative
      agreement, unclear → clarify before fixing any), improvement loop
      (implement rules → verify → re-review until no critical/important;
      minors fixed or Gaps-logged), exit "→ plan" re-plan; extended mode —
      human-scoped, lens-loaded, output = proposed improvement batch,
      advisory never a gate.
- [x] 8.2 references/architecture.md + code-quality.md lenses: picky
      checklists with micro-examples and the evidence rule (file:line +
      failure scenario or concrete counterexample).
- [x] 8.3 references/security-performance.md lens; close the extended-lens
      Gap; seam sweep (verify→review, review→plan); gate + validator green.

## Batch 9 — finish best-in-class
- [x] 9.1 Rework finish SKILL.md: preflight guard (unticked criterion or
      unreviewed batch → not finish; Deferred questions resolved or
      carried); Gaps triage (fix now / defer with ADR reason / human
      accepts — none silent); full QA per verify's evidence rules with
      bounded loops; improvement pass via extended review (accepted
      findings → final improvement batch); ADR consolidation human-gated +
      stale detection ("confirm or supersede?"); docs true on a clean
      machine; final State entry + delivery menu (merge / PR / tag / keep;
      typed "discard"); finish is a boundary — suggest compaction.
- [x] 9.2 references/completion.md: preflight + triage protocol, ADR
      consolidation method, docs verification checklist, delivery menu
      rules, final report format, boundary close.
- [x] 9.3 Seam sweep: plan gap-check suggests "→ finish" at zero unticked
      C-ids; Flow row check; gate + validator green.

## Batch 10 — fix, the ninth skill
- [x] 10.1 Create skills/fix/SKILL.md: diagnose mandatory-first (reproduce
      mechanically → read the whole error + recent changes/bisect →
      pre-action gate against ADR.md and rejected approaches → one
      hypothesis at a time, 3 dead → stop → spec check: true defect vs
      spec gap (specify delta) → report before fixing, surprising waits
      for human); repair (pin with red-green re-proof → minimal root-cause
      fix → full gates per verify → one fix commit); improve (optional
      post-green refactor, separate commit, reverts alone); route-back
      table (interrupted task / mid-batch / standalone).
- [x] 10.2 references/diagnosis.md: boundary instrumentation, bisect
      protocol, differential debugging, minimal-repro shrinking,
      hypothesis log format, introducing-commit hunt.
- [x] 10.3 Flow integration: template Flow row for defects; implement's
      blocked-by-bug route → "→ fix"; verify non-trigger boundary (its own
      fix loop stays); README flow table row; close the defect-route Gap;
      gate cross-check + validator green.

## Batch 11 — holistic extended review (advisory)
- [ ] 11.1 Dispatch six fresh-context reviewers, one per dimension:
      consistency · flow smoothness (scenario walks) · edge-case coverage ·
      goals/philosophy compliance (incl. token accounting) · skill
      best-in-class audit (triggers, non-triggers, handovers) · Apple
      Xcode 27 native-skills composition (v1 delegation pattern as
      baseline).
- [ ] 11.2 Synthesize: dedupe, verify key findings against the tree,
      rank by severity with the evidence rule.
- [ ] 11.3 Report + proposed improvement batch (human approves before
      anything is implemented — extended review changes no code).

## Later batches (draft)
- One batch per remaining skill: brainstorm, specify, plan, implement,
  verify, review, finish — same treatment; strip rules the perpetual tier
  covers; align descriptions to Flow-table states.
- Decide the defect route (fix skill or Flow row — see Gaps).
- Greenfield pilot: "build a todo app" must auto-route through the flow;
  measure real token overhead per phase.

## Gaps
- ~~No route for defects~~ — closed by batch 10 (fix skill: diagnose-first,
  Flow row, implement blocked-by-bug route).
- No mechanical link yet between template promises and skills that exist
  (1.4 closes part of it).
- ~~No trivial-change policy~~ — closed: the Quick Path (standing-contract
  clause + ADR 2026-07-19); behavior-based routing, gates never skipped.
- ~~Extended review has no on-demand lenses~~ — closed by batch 8
  (architecture, code-quality, security-performance references).
