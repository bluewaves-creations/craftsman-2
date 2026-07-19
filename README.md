# Craftsman 2

> Guide and show, don't tell and control — a lean development flow for
> frontier coding agents.

[![license: MIT](https://img.shields.io/github/license/bluewaves-creations/craftsman-2)](LICENSE)
[![gates](https://github.com/bluewaves-creations/craftsman-2/actions/workflows/gates.yml/badge.svg)](https://github.com/bluewaves-creations/craftsman-2/actions/workflows/gates.yml)
[![release](https://img.shields.io/github/v/release/bluewaves-creations/craftsman-2)](https://github.com/bluewaves-creations/craftsman-2/releases)

A ≤100-line `AGENTS.md` constitution, nine sharp skills, verdicts by exit
code. No CLI, no dependencies, no behavioral ceremony — the bet is that a
frontier model given a lean constitution, one good example per convention,
and mechanical gates produces craftsman-grade software on its own.

**Measured, not promised** — one greenfield pilot, one prompt ("build a
todo app"), on a *non-Claude* harness (PI) and mid-tier models
(MiniMax M3 → GLM 5.2):
16/16 spec criteria shipped, 53/53 tests, 44 typed commits, 5 reviewed
batches, **$7.07**. Twelve human messages — product decisions, one
(withdrawn) defect report, two bare continues; no skill named, zero
process steering. Full data:
[docs/pilot-2026-07-19.md](docs/pilot-2026-07-19.md).

## Three principles

1. **AGENTS.md is the constitution.** Read every turn, never compacted,
   ≤100 lines. Vision, stack, conventions (one example each), gate
   commands. `CLAUDE.md` is a symlink to it.
2. **Verdicts are exit codes.** The model never judges whether its own
   code works — gates do. Gates are the project's own commands (test,
   lint, types, build). Green means exit 0 with pasted evidence.
3. **Skills are sharp, not heavy.** Each phase is a small skill
   (≤70 lines) that shows the shape of good work, then stops.

## Install

```bash
git clone https://github.com/bluewaves-creations/craftsman-2.git
craftsman-2/scripts/install.sh
```

One command, bash only, idempotent. Default is user level — the nine
skills land in `~/.agents/skills` (the [Agent Skills](https://agentskills.io)
open-standard store) and `~/.claude/skills` is linked to it (or, if
that's already a real directory, copied into), so Claude Code and any
open-standard harness discover them. Run with `--project`
from a project root to install for that project only. It never touches
your `AGENTS.md` or ledgers; uninstall is documented in the script header.

## Quickstart — your first task in 60 seconds

1. Install (above), then open your agent in any project — new or existing.
2. Say **"init craftsman"**. The flow observes your codebase, writes the
   constitution from commands it actually ran, declares your own
   toolchain as the gates, and proves them with one red→green test.
3. Say what you want built. The flow routes itself: criteria are drafted
   for **your** approval and frozen (SPEC.md) → a batched plan waits for
   **your** go (PLAN.md) → tasks are implemented test-first, every task
   verified by the gates, every batch reviewed by fresh eyes → each
   boundary reports back and waits for you.
4. That's the whole job: you make the product decisions; exit codes judge
   the code.

## The flow

Work moves through phase skills routed by a state table in AGENTS.md —
no skill is ever named by hand. The spec freezes at approval; the plan
adapts at every batch boundary; a quick path lets changes with no
observable behavior skip ceremony but never the gates.

| Skill | When | Purpose |
|---|---|---|
| `craftsman-mode` | init / refresh | Constitution — greenfield or brownfield |
| `brainstorm` | on demand | What should this be? |
| `specify` | per feature | What must it do? Frozen at approval |
| `plan` | per feature + each batch | How do we get there? Adapts; spec doesn't |
| `implement` | per task | Docs → failing test → minimal green → refactor |
| `verify` | end of every task | All gates, pasted evidence, gap pass |
| `fix` | on defect | Diagnose first; repair at the root cause |
| `review` | end of every batch | Fresh-eyes checklist + improvement loop |
| `finish` | ship | Full QA, ADR consolidation, docs |

Extended reviews (architecture, security, performance) run on demand,
never as a gate.

## Artifacts

- **AGENTS.md** — constitution (human-owned, ≤100 lines)
- **SPEC.md** — acceptance criteria with edge cases; frozen once
  approved — only the human edits words, verify ticks boxes
- **PLAN.md** — batched tasks, each citing its official doc; re-planned
  every batch
- **ADR.md** — decision ledger, including three-attempt dead ends
- **git log** — a feat commit per task plus separate refactor commits;
  the implementation narrative

## Lineage

Two ancestors, one lesson each:

- **Craftsman v1** (machine-enforced): its irreplaceable insight is that
  LLM self-assessment is unreliable — verdicts must be exit codes. Kept,
  minus the 22k-line CLI: the project's own toolchain is the verdict
  machine. Coming from v1? [What replaces what](docs/migrating-from-v1.md).
- **Superpowers** (behavior-engineered): its insight is progressive
  disclosure — keep almost nothing always-resident. Kept, minus the
  ceremony: examples over iron laws, trust over rationalization tables.

The bet on top of both: frontier models follow shape better than rules.
Show one good example and they generalize; write ten paragraphs of
prohibition and they rationalize. The pilot puts a price on the flow's
ceremony: ≈53% of turns (everything except implement) bought 5
review passes with every finding fixed, 4 ADR entries with rejected
alternatives, and a git log auditable commit by commit — on a mid-tier
model.

## Contributing

Contributions route through the flow itself — spec delta → batch →
gates. See [CONTRIBUTING.md](CONTRIBUTING.md); this repo is its own
product and every PR runs the same [gates](.github/workflows/gates.yml)
you just installed.

## License

[MIT](LICENSE) © 2026 Bluewaves.
