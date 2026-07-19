---
name: craftsman-mode
description: >
  Initialize the Craftsman flow in a project or refresh its constitution —
  greenfield or brownfield, any stack: web, native apps, data, CLI. Use when
  the user says "init craftsman",
  "set up craftsman", "craftsman mode", "adopt / bring this codebase under
  craftsman", or when Craftsman work starts and AGENTS.md is missing or
  stale. Not for feature work in an initialized project (route by the Flow
  table in AGENTS.md) and not for writing acceptance criteria (specify).
license: MIT
compatibility: Requires git and a harness that always loads AGENTS.md or CLAUDE.md.
metadata:
  version: "1.0.0"
---

# Craftsman Mode — Init

Outcome: constitution (AGENTS.md + CLAUDE.md symlink), ledgers (SPEC.md,
PLAN.md, ADR.md), gates that actually run, one red→green proof. Ends by
routing into the Flow table.

## Route — no default path; if the signal is unclear, ask

| Signal | Path | Load |
|---|---|---|
| No source you would build or test | Greenfield | `references/greenfield.md` |
| Existing code, no Craftsman constitution (a foreign AGENTS.md counts as none) | Brownfield | `references/brownfield.md` |
| A Craftsman AGENTS.md exists, stale or wrong | Refresh | below |

Refresh: re-observe (run the gates, sample the code), diff observed truth
against AGENTS.md, propose the diff — never silently overwrite. Re-validate
the seeded stack rules against current official docs. Done when the approved
diff is applied and committed.

## Shared rules

- **Observed, not inferred.** Every AGENTS.md line is a command you executed
  successfully or a fact the human attested. A missing section beats an
  invented one.
- **Brainstorm on ambiguity.** If any constitution slot (Vision, Stack,
  Constraint) cannot be filled without guessing, or answers conflict, invoke
  the brainstorm skill, converge, then resume here at the unfilled slot.
  This rule is the single source for the handoff — the references defer to it.
- **Confirm before writing.** List every file you will create or modify and
  get a yes. Not a git repo → offer `git init` first; the ledgers need git.
- **Gates are the stack's own toolchain** — test, lint, types, build, or
  their stack equivalents. Declare only commands you ran; the loaded
  reference has a per-project-type table.
- **Close the loop.** Greenfield and brownfield are done when one trivial
  test went red → green through the declared gates. A bootstrap that never
  saw red proved nothing. (Refresh's done-line is above.)

## Never
- Let an inferred claim into AGENTS.md.
- Commit an AGENTS.md over 100 lines — `wc -l AGENTS.md` before every
  constitution commit; golf it, don't waive it (the pilot shipped 161
  silently — the budget is the always-on token bound).
- Declare a gate you haven't run on this machine.
- Finish greenfield or brownfield without the red→green proof and a first
  commit.
