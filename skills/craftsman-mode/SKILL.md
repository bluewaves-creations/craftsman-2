---
name: craftsman-mode
description: >
  Initialize the Craftsman flow in a project — greenfield or brownfield, any
  stack: web, native apps, data, CLI. Use when the user says "init craftsman",
  "set up craftsman", "craftsman mode", "adopt / bring this codebase under
  craftsman", or when Craftsman work starts and AGENTS.md is missing or
  stale. Not for feature work in an initialized project (route by the Flow
  table in AGENTS.md) and not for writing acceptance criteria (specify).
license: MIT
compatibility: Requires git and a harness that always loads AGENTS.md or CLAUDE.md.
metadata:
  version: "0.2.0"
---

# Craftsman Mode — Init

Outcome: constitution (AGENTS.md + CLAUDE.md symlink), ledgers (SPEC.md,
PLAN.md, ADR.md), gates that actually run, one red→green proof. Ends by
routing into the Flow table.

## Route — no default path; if the signal is unclear, ask

| Signal | Path | Load |
|---|---|---|
| Empty or near-empty repo | Greenfield | `references/greenfield.md` |
| Existing code, no Craftsman constitution | Brownfield | `references/brownfield.md` |
| AGENTS.md exists but stale or wrong | Refresh | below |

Refresh: re-observe (run the gates, sample the code), diff observed truth
against AGENTS.md, propose the diff — never silently overwrite. Re-validate
the seeded stack rules against current official docs.

## Shared rules

- **Observed, not inferred.** Every AGENTS.md line is a command you executed
  successfully or a fact the human attested. A missing section beats an
  invented one.
- **Brainstorm on ambiguity.** If a template slot (Vision, Stack, Constraint)
  cannot be filled without guessing, or answers conflict, invoke the
  brainstorm skill, converge, then resume here at the unfilled slot.
- **Confirm before writing.** List every file you will create or modify and
  get a yes. Not a git repo → offer `git init` first; the ledgers need git.
- **Gates are the stack's own toolchain** — test, lint, types, build, or
  their stack equivalents. Declare only commands you ran; the loaded
  reference has a per-project-type table.
- **Close the loop.** Init is done when one trivial test went red → green
  through the declared gates. A bootstrap that never saw red proved nothing.

## Never
- Let an inferred claim into AGENTS.md.
- Declare a gate you haven't run on this machine.
- Finish without the red→green proof and a first commit.
