---
name: brainstorm
description: Use when the shape of the thing is unclear — new project, major pivot, or a feature with several plausible directions; not for routine batches
---

# Brainstorm

Design thinking before any spec. The output is a direction, not a document pile.

## Method
1. **Reframe** — restate the problem from the user's world, not the
   implementation. Ask the questions that would change the answer, one at a time.
2. **Diverge** — sketch 3 genuinely different directions. At least one should
   think different: drop an assumption everyone else keeps.
3. **Converge** — recommend one, with the tradeoff that made you choose.
   Name what you're deliberately not building.
4. **Handoff** — 5–10 lines: chosen direction, who it serves, what good looks
   like, known risks. Feeds specify. Update the AGENTS.md Vision if it moved.

## Shape of a good direction
Bad: "Build a dashboard with charts for the metrics."
Good: "Operators want to know *what changed since yesterday*, not to browse
metrics — one diff-view screen, alerts as the primary surface, charts only on
drill-down."

## Never
- Start speccing or coding mid-brainstorm — converge first.
- Present three variants of the same idea as divergence.
