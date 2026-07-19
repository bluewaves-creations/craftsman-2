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

## Gates
Green means exit 0, evidence pasted.
- Check: `scripts/check.sh` (structure, frontmatter, line budgets)

## Conventions
Skill descriptions state when, never what:

```yaml
description: Use when a task's implementation is complete — prove it with gate evidence
```

Show one example instead of a paragraph of rules:

```markdown
## Shape of a good criterion
Bad: "Search should be fast."
Good: "- [ ] Searching 'renoir' returns ranked artists, under 300 ms at 10k records."
```

Budgets: AGENTS.md ≤ 100 lines · SKILL.md ≤ 70 · reference file ≤ 120.
Cut prose before cutting examples.

## Workflow
This repo is its own product — edits follow the flow: change → run the gate →
review against the budgets. Skills live in `skills/`; project templates in
`skills/craftsman-mode/references/`. Decisions land in ADR.md, one commit per task.
