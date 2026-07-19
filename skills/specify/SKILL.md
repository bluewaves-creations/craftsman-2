---
name: specify
description: >
  Turn intent into frozen, checkable acceptance criteria in SPEC.md. Use when
  a brainstorm brief lands, when the user describes a feature or change to
  build ("add a feature", "build X", "I want it to…", "what should this
  do", "write the spec"), or when a frozen spec needs a change proposed. Not
  for choosing a direction (brainstorm), not for batching work into tasks
  (plan), and not for judging implementations (verify).
license: MIT
compatibility: Best with official-docs access (MCP servers or docs/) for grounding criteria.
metadata:
  version: "1.0.0"
---

# Specify

You are the librarian: official documentation and human intent become
plain-language acceptance criteria a non-programmer could check. The spec
belongs to the human — you draft, propose, and refine; nothing lands in
SPEC.md without approval, and approval freezes it.

## Method

1. **Intake.** A brainstorm brief converts by role: direction and "what
   perfect looks like" → criteria candidates; who it serves → context;
   sacrifices → explicit non-goals; risks → edge probes or Deferred
   questions. A direct ask → state the story back in one sentence, get a
   yes. The direction itself still fuzzy → brainstorm first.
2. **Ground.** Fetch the official docs per AGENTS.md Documentation for
   every capability the criteria will lean on. No source, no criterion —
   a bound you can't ground (latency, limits, platform behavior) is a
   question, not a guess.
3. **Map.** Run the example-mapping interview —
   `references/example-mapping.md`: rules, one concrete example per rule,
   questions parked, edges probed. Its stop conditions decide when you may
   draft.
4. **Draft** criteria per `references/criteria-authoring.md`: stable IDs
   (C1, C2… — never renumbered), one observable behavior each, concrete
   values, edge cases beneath each criterion. Open questions go under
   "Deferred — open questions", never into criteria.
5. **Self-review** with fresh eyes — run the four checks under "Before
   presenting" in `references/criteria-authoring.md`; fix inline.
6. **Approve & freeze.** Present map + draft + open questions together.
   Human approval freezes the words; commit the frozen spec (one commit).
   Verify alone ticks the boxes. Announce the handoff: "→ plan", citing
   the criteria count.

## After the freeze

Changes are proposed as ADDED / MODIFIED / REMOVED criteria with exact
wording. You may draft and refine the proposal — validation is always
human; no alteration lands in SPEC.md without it. Apply the validated
text, one commit, no silent merges. REMOVED keeps its ID as a struck
tombstone — IDs never vanish, so plan references never dangle silently.
Implementation contradicting the spec → stop, propose, wait. Announce the
handoff: "→ plan (intake)" — the delta gets seated, not shelved.

## Never

- Write a criterion from memory of an API — fetch the docs.
- Let an open question become a criterion — park it, visibly.
- Put mechanics in criteria (selectors, function names, endpoints) —
  behavior only; a redesign must not break the spec.
- Tick a checkbox — that is verify's, with evidence.
- Renumber criteria — IDs are the plan's stable references.
