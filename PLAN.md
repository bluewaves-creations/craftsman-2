# Plan — Craftsman 2

Adapts at every batch boundary. The spec never moves: SPEC.md C1–C18
(approved 2026-07-19), replacing the founding-brief proxy.

## State
- In flight: nothing — batch 18 done; C14/C16/C17 ticked. Next: batch 19
  (README, CONTRIBUTING, v2.0.0) on human go, then → finish.
- Release ritual: after skill edits land here, re-run
  `scripts/install.sh` to re-sync `~/.agents/skills` (batch 18 made it
  one command; no skill files changed in 18, so no sync owed).
- Review 18 disposition: 7 findings fixed (symlink triage, license-drift
  gate red-proven, edge FAILs, relative project link, structural usage,
  nullglob, CI loop reports all); declined SHA-pinning actions — YAGNI,
  tags on official actions, setup-uv releases immutable.
- Pilot outcome: shipped 16/16 on PI, M3→GLM 5.2, $7.07, zero process
  steering — full report: docs/pilot-2026-07-19.md.
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
- [x] 17.1 Seed the flow by hand — the manual steps become the install
      script's discovery input. Done: nine skills installed at user
      level, diff -r identical ×9, validator green ×9; pilot folder
      left empty (constitution and ledgers are craftsman-mode's job).
      Discovery for 18.2: default install is user level for all agents —
      copy nine dirs into `~/.agents/skills/` (open-standard store) +
      ensure symlink `~/.claude/skills → ~/.agents/skills` (docs: only
      .claude paths are native discovery; symlinks followed — verified
      on this machine). Project level (`.agents/skills/` + local
      symlink) is the flag, same shape. Installer never touches
      AGENTS.md or ledgers (C16 edge by construction). Idempotent by
      re-copy; an existing real `.claude/skills` dir → copy into it,
      never symlink over. Verify = diff -r; validator optional (uvx).
- [x] 17.2 Run the flow end to end — auto-routing only. Done: human-run
      on PI + MiniMax M3→GLM 5.2; shipped 16/16 criteria, 44 commits,
      5 reviewed batches; gates re-verified independently (53/53 tests,
      lint, typecheck, build green); zero process steering in 12 human
      messages; per-message usage captured in PI session log.
- [x] 17.3 Pilot report: docs/pilot-2026-07-19.md — measurements
      ($7.07, 407 turns, per-phase table), what held, two friction
      findings → batch 17b. Done: C13 ticked.

## Batch 17b — pilot findings (approved 2026-07-19)
- [x] 17b.1 Constitution budget gate. Done: check.sh pins template ≤100;
      craftsman-mode Never commits an oversize AGENTS.md, `wc -l` named.
      Red→green evidence (rerun post-review): `FAIL: …AGENTS.template.md
      is 104 lines…` exit=1 → restored → `check: all green` exit=0.
      (a3d15a8)
- [x] 17b.2 plan Initial mode validation stop. Done: step 5 "Present
      the plan — wait for the go", announce moved behind the yes.
- [x] 17b.3 boundary go skip-resistant. Done: Re-plan step 4 is now
      "Boundary report — the only exit", go asked explicitly.
- [x] 17b.4 compaction offer mandatory. Done: part of the boundary
      report's fixed shape, "isn't skippable even when the go is
      instant". (17b.2–4: 74cb672, one commit — three tasks share the
      one file and its golf; SKILL.md held at 70/70.)
- Struck: fix-skill ledger-defect-first — evidence withdrawn (white
  screen was a human-side mistake; the interruption/branch was manual,
  not thread loss; fix routed and diagnosed correctly).

## Batch 18 — release foundation
- [x] 18.1 LICENSE: MIT at root, matching skill frontmatter (C14).
      Done: `head -1 LICENSE` = "MIT License", Copyright (c) 2026
      Bluewaves (human-corrected mid-task); 9/9 skills declare
      `license: MIT`. (a9d66c9)
- [x] 18.2 scripts/install.sh: one command, project or user level, bash
      only, idempotent; never overwrites an existing AGENTS.md (defers
      to craftsman-mode refresh); uninstall documented (C16).
      Done: scratch-sandbox evidence — fresh user-level install
      "install: all green" + symlink created; re-run exit=0 with
      `diff -r` identical ×9; real `.claude/skills` dir copied into
      (never symlinked over), neighbour skill preserved; --project
      installs locally, AGENTS.md md5 unchanged; documented uninstall
      loop leaves store empty; bad flag prints usage, exit=2. (2bf2c06)
- [x] 18.3 CI: GitHub Actions runs check.sh + open-spec validator on
      push/PR (C17); AGENTS.md Gates names it — CI red blocks finish
      from here on. Done: `gates` workflow, checkout@v7 +
      setup-uv@v8.3.2 pinned (modern-first, immutable releases);
      `gh run watch --exit-status` exit=0, "success @ 7ad3e06" on
      origin/main. (43dc2c6 + 7ad3e06 cache-warning fix)

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
- ~~check.sh doesn't pin the template ≤100 as rendered constitution~~ —
  closed by 17b.1 (red→green proven at 104 lines).
- Template's merged "Lint / Types" gate slot trades a granularity cue
  for the ≤100 budget — accepted (review 16 minor): greenfield.md's
  gate table carries the multi-command rows an init actually writes.
- ~~No route for defects~~ — closed by batch 10 (fix skill).
- ~~No mechanical link between template promises and skills~~ — closed
  by 1.4 (forward) + 12.4 (reverse binding, readlink, validator).
- ~~No trivial-change policy~~ — closed: Quick Path (ADR 2026-07-19).
- ~~Extended review has no on-demand lenses~~ — closed by batch 8.
