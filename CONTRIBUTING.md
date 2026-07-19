# Contributing

This repo is its own product: every change routes through the Craftsman
flow it ships. There is no other door.

## The loop

1. **Open an issue** describing the observable behavior you want changed
   — a missing capability, a skill that misroutes, a gate that lies.
   Bug in flow behavior? That's a defect → the `fix` skill's territory.
2. **Spec delta.** Changes to what the flow promises are criteria first:
   propose the delta; a maintainer validates and freezes it (SPEC.md is
   human-frozen — PRs never edit it directly).
3. **Batch.** Work lands as planned tasks with typed commits
   (`feat:`/`fix:`/`refactor:`/`plan:`/`verify:` + `[C-id]` tags), each
   task verified, each batch reviewed.
4. **Gates green.** CI runs the same gates you can run locally:

   ```bash
   scripts/check.sh                 # structure, budgets, Flow↔skills, licenses
   uvx --from skills-ref agentskills validate skills/<name>   # open-spec, per skill
   ```

   Green means exit 0 with evidence pasted in the PR. Red is red — there
   is no "basically green".

## Hard budgets

`scripts/check.sh` enforces them; PRs that breach them don't merge:

- `AGENTS.template.md` (and any rendered AGENTS.md) ≤ 100 lines
- `SKILL.md` ≤ 70 lines · reference file ≤ 120 lines
- Skill descriptions: capability + triggers + boundaries, never process
- Every skill MIT-licensed, matching the root LICENSE

## Writing style for skills

Guide and show, don't tell and control: one example beats a paragraph of
rules; cut prose before cutting examples. A feature enters the flow when
a real project needed it (YAGNI) — link the need in your issue.

## Coming from Craftsman v1?

See [docs/migrating-from-v1.md](docs/migrating-from-v1.md) for exactly
what replaces what.
