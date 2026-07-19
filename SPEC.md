# Spec — Craftsman 2

Status: approved 2026-07-19
Frozen at approval. The agent drafts and refines; every alteration needs
human validation. Verify ticks the boxes.

## Constitution
- [x] C1. A project adopting the flow gets an AGENTS.md ≤100 lines —
      Vision, Stack, Documentation, Rules, Conventions, Gates, Flow,
      Red flags, Ledgers — sufficient to route any turn without another
      always-on file.
- [x] C2. Rules live in exactly two composable tiers: perpetual in
      AGENTS.md (universal seed + stack rules at init), activity rules in
      the owning skill — no rule duplicated across tiers.

## Skills
- [x] C3. Nine skills cover the lifecycle (craftsman-mode, brainstorm,
      specify, plan, implement, verify, fix, review, finish): each
      SKILL.md ≤70 lines, references ≤120, Agent Skills open-spec valid.
      - Edge: no subagent-capable harness → every skill still executes
        (degraded forms declared in-skill).
- [x] C4. Flow table ↔ skills bind both ways: every row names an existing
      skill, every skill is reachable from a row — mechanically checked.
- [x] C5. Every description carries capability + triggers + boundaries,
      never process, with a literal "Use when" — mechanically checked.

## Verdicts
- [x] C6. Green means exit 0 with pasted evidence, fresh after the last
      change; no claim of done/fixed/passing rests on self-assessment.
- [x] C7. Spec sovereignty: the agent drafts and refines, validation is
      always human; frozen at approval; changes land as human-approved
      ADDED / MODIFIED / REMOVED deltas with stable C-ids.
- [x] C8. Every red loop is budget-bounded (3 default; verify classifies
      — regression 2, environment 1; fix carries diagnose 3 + repair 3);
      a spent budget stops work → ADR.md entry + human decision.
- [x] C9. Work survives compaction: boundaries extract non-derivable
      State to PLAN.md; a fresh session re-enters via SPEC + PLAN State +
      ADR + git log and lands at the interrupted spot.
      - Edge: uncommitted changes → the failing test names the spot.

## Efficiency
- [x] C10. Always-on context (constitution + nine skill descriptions)
      stays ≤ 2k tokens, measured — under half of Craftsman v1's.
- [x] C11. A change with no observable behavior takes the quick path:
      full gates + one typed commit, no plan or review ceremony.
      - Edge: dependency/toolchain bumps never qualify → Maintenance.

## Composition
- [x] C12. Vendor skills compose with declared precedence: on Apple
      projects, init exports Xcode's skills and records that they own
      platform idiom over generic guidance.

## Pilot — evidence layer
- [x] C13. A greenfield "build a todo app" auto-routes through the flow
      end to end — no skill named manually — with per-phase token
      overhead measured and reported.

## Open source release — replaces Craftsman v1
- [x] C14. LICENSE at the repo root matches the MIT declared in every
      skill's frontmatter.
- [ ] C15. README is the front door: hero + one-line promise, badges
      (license, gate CI, release), what-and-why, install command,
      60-second quickstart, the flow table, the nine skills at a glance,
      lineage (v1 and superpowers — what changed and why), contributing
      and license sections. A newcomer routes their first task within
      5 minutes of reading only the README.
- [x] C16. One command installs the flow (nine skills + template) at
      project or user level — bash only, no dependencies, idempotent;
      uninstall documented.
      - Edge: an existing AGENTS.md is never overwritten — install
        defers to craftsman-mode refresh.
- [x] C17. Public CI runs `scripts/check.sh` + the open-spec validator
      on every push and PR; the README badge reflects it. Once named,
      CI red blocks finish (the flow's own CI gate row, activated).
- [ ] C18. Contributor docs: CONTRIBUTING.md routes contributions
      through the flow itself (spec delta → batch → gates); releases
      carry a changelog; a migration note tells a v1 user exactly what
      replaces what.

## Deferred — open questions
- Commit-hook backstop (guarantee vs. guide) — blocks nothing; revisit
  after C13 measures rationalization in the wild (ADR 2026-07-19).
