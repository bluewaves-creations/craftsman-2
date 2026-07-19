# Plan — Craftsman 2

Adapts at every batch boundary. The spec never moves: SPEC.md C1–C18
(approved 2026-07-19), replacing the founding-brief proxy.

## State
- In flight: nothing — next: batch 17 (pilot) on human go.
- Standing decisions: pilot (C13) runs before public release so README
  claims cite measured numbers (human-approved); commit-hook backstop
  deferred until pilot evidence (ADR 2026-07-19).
- Remote: git@github.com:bluewaves-creations/craftsman-2.git (main).

## Done — batches 1–15 (detail lives in git log)
- [x] 1 — AGENTS.md template v2: Rules tiers, Flow table, Ledgers (5591254)
- [x] 2 — craftsman-mode rework + open-spec gate checks (c5831e1)
- [x] 3 — brainstorm: bold creative space, exits table (d338f93)
- [x] 4 — specify: librarian stance, example mapping, freeze + C-ids (0241b96)
- [x] 5 — plan: modes, boundary ritual, authoring reference (23dafae)
- [x] 6 — implement: zero-gap task loop, testing + clean-code refs (5ef4211)
- [x] 7 — verify: fresh-evidence doctrine, failure-class budgets (0525182)
- [x] 8 — review: picky batch review + three extended lenses (692ad10)
- [x] 9 — finish: preflight, triage, human-gated consolidation (8d11a24)
- [x] 10 — fix, the ninth skill: diagnose-first (f6d992d)
- [x] — Quick Path standing-contract clause (d7b4099)
- [x] 11 — holistic extended review, six dimensions (8b0e9f5)
- [x] 12–14 — correctness · Apple/Xcode 27 composition · boundary
      policies; review fixes 304e771 (53a1548)
- [x] 15 — ancestor gap closure: red flags, dep vetting, decision-time
      guards, docs-are-data (cb1f231)

## Batch 16 — spec seating + ledger hygiene
- [x] 16.1 Verify pass over C1–C12: fresh evidence per criterion — tick
      each box in SPEC.md. Done: check.sh + validator green ×9; template
      golfed 110→99 (C1 red caught); always-on ≈1849 tokens ≤ 2k (C10).
      (75e3e0b)
- [x] 16.2 PLAN fold: batches 1–15 compressed to one line each (title +
      closing commit); stale Gaps/draft entries struck with citations;
      `## State` section added (fresh-session row must always land).
      Done: nothing non-derivable lost — git log carries the detail.

## Batch 17 — greenfield pilot (C13) — human plays product owner
Runs in ~/Developer/craftsman-pilot (empty, confirmed).
- [x] 17.1 Seed the flow into the pilot by hand — the manual steps become
      the install script's discovery input. Done: nine skills copied to
      pilot .claude/skills/, diff -r identical, validator green ×9.
      Discovery for 18.2: install = mkdir -p .claude/skills + copy nine
      dirs (user level: ~/.claude/skills) — nothing else; AGENTS.md and
      ledgers belong to craftsman-mode init, so the installer never
      touches them (C16 edge satisfied by construction). Idempotent by
      re-copy. Verify = diff -r; validator optional (needs uvx).
- [ ] 17.2 Run the flow end to end — auto-routing only, no skill named
      manually; record per-phase token overhead as it runs.
- [ ] 17.3 Pilot report: measurements, friction → proposed improvement
      batch; numbers feed the README (C15). Done: C13 ticked.

## Batch 18 — release foundation
- [ ] 18.1 LICENSE: MIT at root, matching skill frontmatter (C14).
      Done: file present; consistency checked.
- [ ] 18.2 scripts/install.sh: one command, project or user level, bash
      only, idempotent; never overwrites an existing AGENTS.md (defers
      to craftsman-mode refresh); uninstall documented (C16).
      Done: install + uninstall evidenced in a scratch dir.
- [ ] 18.3 CI: GitHub Actions runs check.sh + open-spec validator on
      push/PR (C17); AGENTS.md Gates names it — CI red blocks finish
      from here on. Done: green run on origin/main.

## Batch 19 — front door, then ship
- [ ] 19.1 README rewrite (C15): hero + promise, badges (license, CI,
      release), install command, 60-second quickstart, flow table, nine
      skills at a glance, lineage with measured pilot numbers,
      contributing + license sections. Done: newcomer routes a first
      task from the README alone.
- [ ] 19.2 CONTRIBUTING.md (contributions route through the flow) + v1
      migration note + tagged v2.0.0 release with changelog (C18).
      Done: release live on GitHub.

Then → finish: every criterion ticked, full QA, delivery.

## Gaps
- check.sh caps the template at 120 (reference budget) but nothing
  mechanically holds it ≤100 as a *rendered constitution* (C1) — caught
  by hand in verify 16.1 at 110 lines; a check.sh line would pin it.
- Template's merged "Lint / Types" gate slot trades a granularity cue
  for the ≤100 budget — accepted (review 16 minor): greenfield.md's
  gate table carries the multi-command rows an init actually writes.
- ~~No route for defects~~ — closed by batch 10 (fix skill).
- ~~No mechanical link between template promises and skills~~ — closed
  by 1.4 (forward) + 12.4 (reverse binding, readlink, validator).
- ~~No trivial-change policy~~ — closed: Quick Path (ADR 2026-07-19).
- ~~Extended review has no on-demand lenses~~ — closed by batch 8.
