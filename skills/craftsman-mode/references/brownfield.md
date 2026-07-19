# Brownfield — existing codebase

Outcome: code you did not write is observed, its truth recorded, its debt
explicit — then it is a normal Craftsman project.

## Sequence

1. **Observe — read-only.** No changes yet. Map entry points; find and run
   every build/test/lint command the repo advertises (README, package
   scripts, CI config) — executed, not inferred. Label every finding:
   verified (you ran it), inferred (your reading), gap (unknown). Large or
   unfamiliar tree → dispatch explore subagents and keep only conclusions.

2. **Scope.** List the files to create or modify. Existing AGENTS.md or
   CLAUDE.md content → show the diff, never silently overwrite. Confirm
   before writing.

3. **Write the constitution** from `AGENTS.template.md`:
   - Verified material and human attestations only. Inferred claims go to
     ADR.md, labeled inferred — never into AGENTS.md.
   - Conventions: sample real files — the code's dominant style wins over
     ideal style. A departure from that style becomes a rule only if the
     human wants the code moved there.
   - Seed Rules: the universal four (the comments rule adapts to the
     project's medium), then 2–4 stack rules from official docs, checked
     against what the code actually does. Apple/Xcode project → export
     Apple's skills and record the delegation (greenfield step 2).
   - A slot you cannot fill without guessing → the brainstorm handoff in
     the skill's shared rules.

4. **Gates from reality.** Declare only commands that ran:
   - Green today → declare it.
   - Red on legacy code → never declare it green or narrow it silently.
     Record the failure in PLAN.md Gaps and let the human dispose of it:
     remediate (the default — a plan batch) or accept for now (ADR entry
     with reason and scope).
   - No tests at all → wire the stack's minimal harness now; its first test
     comes in step 6.

5. **Ledgers.** SPEC.md starts empty — recovered behavior enters through
   specify when an area is touched. PLAN.md opens with the debt disposal
   from step 4. First ADR entry: state of the system at adoption —
   verified facts, known debt, inferred notes.

6. **Prove the loop.** One test through the declared gates, red → green. If
   the tree had none: a characterization test pinning the current behavior
   of one real seam.

7. **First commit** — on a branch if the tree is shared:
   `chore: bring codebase under craftsman`. Announce the handoff:
   "→ specify" for the first change the human wants.

## Never
- Change code or fix bugs while observing — record, don't touch.
- Declare a gate green you didn't run, or narrow one to force green.
- Let an inferred claim into AGENTS.md.
