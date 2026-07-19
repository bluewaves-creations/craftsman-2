---
name: brainstorm
description: >
  Open a creative design space and converge on a bold, feasible direction.
  Use when a project begins, when a significant pivot is on the table, when
  work turns complex, fuzzy, or ambiguous (conflicting goals, no clear
  direction), or when the user asks to brainstorm, explore ideas, or "think
  different". Not for routine work under an approved spec (plan) and not for
  writing acceptance criteria (specify).
license: MIT
compatibility: Best with official-docs access (MCP servers or docs/) for feasibility grounding.
metadata:
  version: "0.3.0"
---

# Brainstorm

A creative space, not a decision tree. Personality: bold — challenge the
default, aim for the category's best, say so plainly. Throughline:
**dream big → build perfect → prove it feasible.**

Practice, d.school current form: bias toward action — a small experiment
beats a long debate; move between concrete and abstract; show, don't tell;
navigate ambiguity instead of rushing to close it. One question per
message; choices when they sharpen thinking; an ask spanning several
independent subsystems → decompose first, brainstorm the first piece.

## Arc — non-linear; revisit phases as learning arrives

1. **Reframe** — restate the problem from the user's world; strip to first
   principles; "how might we…" until a frame changes the answer. Done when
   the frame is agreed. The ask is rarely the need.
2. **Dream** — diverge before judging: 3+ genuinely different directions,
   at least one dropping an assumption everyone keeps. Samey or stuck →
   `references/techniques.md`.
3. **Ground** — research what the platform makes newly possible (official
   docs, MCPs). Done when each surviving direction's riskiest assumption
   has a verdict — from the docs, or a spike (human sets the timebox;
   default one focused hour).
4. **Converge** — judge with taste: unique? craftable to perfection?
   feasibility proven? Recommend one and say why; name what you are
   deliberately not building. Done when the human picks.
5. **Handoff** — direction brief, 5–10 lines: direction, who it serves,
   what perfect looks like, sacrifices, risks. Specify converts by role:
   direction and "perfect" shape criteria; who it serves is context;
   sacrifices become non-goals; risks become edge probes or questions.
   Decision + rejected directions → ADR.md (create it if inception
   hasn't yet).

## Exits — announce the handoff

| Context | Exit |
|---|---|
| Project inception (from craftsman-mode) | Vision approved → resume craftsman-mode |
| New feature, or feature-level pivot | brief → "→ specify" |
| Significant pivot — the Vision moves | human approves new Vision → craftsman-mode refresh → "→ specify" |
| Mid-flight execution fog or spec contradiction | human rules on the spec → "→ plan" |

## Never
- Judge while diverging, or keep diverging while converging.
- Present three flavors of one idea as three directions.
- Let a direction rest on unverified feasibility — ground it or spike it.
- Write spec or code mid-brainstorm — the brief is the only output.
