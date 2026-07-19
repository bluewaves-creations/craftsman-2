# Craftsman 2

> Guide and show, don't tell and control — the flow itself.

## Vision
A lean development flow for frontier coding agents: a ≤100-line AGENTS.md
constitution, eight sharp skills, verdicts by exit code. Better results than
CLI-enforced or behavior-heavy flows, at a fraction of the tokens.

## Stack
- Markdown + Claude Code skills (readable by any AGENTS.md-aware harness)
- Bash for gates. No CLI, no dependencies.

## Documentation
- Skill authoring: https://code.claude.com/docs/en/skills
- Lineage and philosophy: README.md

## Rules
Perpetual — bind on every edit. Activity rules live in the skills.
- **Modern first** — skill and harness behavior verified against current
  Claude Code docs, not memory.
- **YAGNI** — the flow gains a feature when a real project needed it.
- **DRY on proof** — extract shared skill text at the third occurrence.
- **Show, don't tell** — one example beats a paragraph of rules; cut prose
  before cutting examples.

## Conventions
Skill descriptions carry capability, triggers, and boundaries — never process:

```yaml
description: >
  Initialize the Craftsman flow in a project. Use when "init craftsman" or
  AGENTS.md is missing at the start of work. Not for feature work (Flow table).
```

Budgets: AGENTS.md ≤ 100 lines · SKILL.md ≤ 70 · reference file ≤ 120.

## Gates
Green means exit 0, evidence pasted.
- Check: `scripts/check.sh` (structure, frontmatter, budgets, Flow↔skills)

## Flow
This repo is its own product — edits route through the same state table as
any project (see skills/craftsman-mode/references/AGENTS.template.md).
Announce the active skill. Batches of 2–4 tasks · verify each task ·
review each batch · three failed attempts → stop, ADR.md, ask me.

## Ledgers
| Artifact | Records | Written by |
|---|---|---|
| PLAN.md | batches, gaps | plan/review; verify ticks tasks |
| ADR.md | decisions and dead ends | any skill, append-only |
| git log | implementation narrative | one task, one commit |

No SPEC.md yet — goals live in README until the flow stabilizes.
