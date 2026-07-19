---
name: craftsman-mode
description: Use when bringing a project under the Craftsman flow — greenfield init, brownfield adoption, or refreshing a stale AGENTS.md
---

# Craftsman Mode — Init

Bring a project under the flow. Output: AGENTS.md (+ CLAUDE.md symlink),
SPEC.md, PLAN.md, ADR.md, and gates that actually run.

## Route

| Situation | Path |
|---|---|
| Empty or near-empty repo | Greenfield |
| Existing code | Brownfield |
| AGENTS.md exists but wrong | Refresh — show a diff, never silently overwrite |

## Greenfield
1. Interview briefly: vision (what, who, why), stack, hard constraints.
   Short questions, one at a time.
2. Write AGENTS.md from `references/AGENTS.template.md`.
   Symlink: `ln -s AGENTS.md CLAUDE.md`.
3. Scaffold the stack's standard toolchain; declare its gates in AGENTS.md.
4. Create SPEC.md, PLAN.md, ADR.md from `references/templates.md`.
5. Prove the loop closes: one trivial failing test → make it pass → run every
   gate → first commit.

## Brownfield
1. Observe, don't infer: read real files, run the existing commands.
   Conventions come from what the code does, not what its docs claim.
2. Follow greenfield steps 2–4, with conventions sampled from the actual code.
3. Run every declared gate once. A gate that doesn't run today is not declared —
   record it in ADR.md as a gap instead.

## Never
- Declare a gate you haven't personally seen exit 0 or fail honestly.
- Overwrite an existing AGENTS.md without showing the diff first.
- Pad AGENTS.md past 100 lines — cut conventions before cutting gates.
