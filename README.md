# Craftsman 2

> Guide and show, don't tell and control — a lean development flow for frontier coding agents.

Craftsman 2 bets that a modern model given a lean constitution, sharp examples,
and clear phase boundaries produces craftsman-grade software without a bespoke
CLI and without heavyweight behavioral skills.

## Three principles

1. **AGENTS.md is the constitution.** Read every turn, never compacted, ≤100
   lines. It carries the vision, the stack, the conventions (one example each,
   not prose rules), and the gate commands. `CLAUDE.md` is a symlink to it.
2. **Verdicts are exit codes.** The model never judges whether its own code
   works — gates do. Gates are ordinary project commands (test, lint, types,
   build) declared in AGENTS.md. Green means exit 0 with pasted evidence.
3. **Skills are sharp, not heavy.** Each phase is a small skill (≤70 lines)
   that shows the shape of good work with one example, then stops.

## The flow

| Skill | When | Purpose |
|---|---|---|
| `craftsman-mode` | once | Init — greenfield or brownfield |
| `brainstorm` | on demand | What should this be? |
| `specify` | per feature | What must it do? Frozen at approval |
| `plan` | per feature + each batch | How do we get there? Adapts; spec doesn't |
| `implement` | per task | Docs → failing test → minimal green → refactor |
| `verify` | end of every task | All gates, pasted evidence, gap pass |
| `review` | end of every batch | Fresh-eyes checklist + improvement loop |
| `finish` | ship | Full QA, ADR consolidation, docs |

Extended reviews (whole-codebase architecture, security, performance) run on
demand, never as a gate.

## Artifacts

- **AGENTS.md** — constitution (human-owned, ≤100 lines)
- **SPEC.md** — acceptance criteria with edge cases; frozen once approved —
  only the human edits words, verify ticks boxes
- **PLAN.md** — batched tasks, each citing its official doc; re-planned every batch
- **ADR.md** — decision ledger, including three-attempt dead ends
- **git log** — one task, one commit; the implementation narrative
- **Official docs** — via MCPs (Context7, Cloudflare Docs, Xcode…) or a `docs/`
  folder; the agent never guesses an API it hasn't read

## Lineage

Two ancestors, one lesson each:

- **Craftsman** (machine-enforced): its irreplaceable insight is that LLM
  self-assessment is unreliable — verdicts must be exit codes. Kept, minus the
  22k-line CLI: the project's own toolchain is the verdict machine.
- **Superpowers** (behavior-engineered): its insight is progressive disclosure —
  keep almost nothing always-resident. Kept, minus the ceremony: examples over
  iron laws, trust over rationalization tables.

The bet on top of both: frontier models follow shape better than rules.
Show one good example and they generalize; write ten paragraphs of prohibition
and they rationalize.
