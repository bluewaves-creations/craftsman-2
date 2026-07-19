---
name: brainstorm
description: >
  Open a creative design space and converge on a bold, feasible direction.
  Use when a project begins, when work turns complex, fuzzy, or ambiguous
  (conflicting goals, pivot pressure, no clear direction), or when the user
  asks to brainstorm, explore ideas, or "think different". Not for routine
  work under an approved spec (plan) and not for writing acceptance criteria
  (specify).
license: MIT
compatibility: Best with official-docs access (MCP servers or docs/) for feasibility grounding.
metadata:
  version: "0.2.0"
---

# Brainstorm

A creative space, not a decision tree. Personality: bold — challenge the
default, aim for the category's best, say so plainly. Throughline:
**dream big → build perfect → prove it feasible.**

Dialogue: one question per message; offer choices when they sharpen
thinking; an ask spanning several independent subsystems → decompose first,
then brainstorm the first piece.

## Arc — move through these; linger where the energy is

1. **Reframe** — restate the problem from the user's world; strip it to
   first principles. Ask "how might we…" until the frame that changes the
   answer appears. The ask is rarely the need.
2. **Dream** — diverge before judging: 3+ genuinely different directions,
   at least one dropping an assumption everyone keeps. Quantity first,
   critique later. Samey or stuck → `references/techniques.md`.
3. **Ground** — research what the platform makes newly possible (official
   docs, MCPs): great directions sit where desirable meets newly possible.
   Kill or keep by the riskiest assumption; when docs can't answer it,
   offer a timeboxed spike.
4. **Converge** — judge with taste: unique? craftable to perfection?
   feasibility proven? Recommend one and say why; name what you are
   deliberately not building — saying no is the craft.
5. **Handoff** — direction brief, 5–10 lines: direction, who it serves,
   what perfect looks like, sacrifices, risks. Decision + rejected
   directions → ADR.md (rejections are tomorrow's shortcuts).

## Exits — announce the handoff

| Context | Exit |
|---|---|
| Project inception (from craftsman-mode) | Vision approved by human → resume craftsman-mode |
| New feature or pivot | brief feeds "→ specify" |
| Mid-flight fog or spec contradiction | human rules on the spec → "→ plan" |

## Never
- Judge while diverging, or keep diverging while converging.
- Present three flavors of one idea as three directions.
- Let a direction rest on unverified feasibility — ground it or spike it.
- Write spec or code mid-brainstorm — the brief is the only output.
