# Example Mapping

A brisk structured conversation that surfaces rules, examples, and unknowns
before any criterion is written. Conversation moves, not index cards.

## The four cards

- **Story** — the behavior being specified. One per session.
- **Rule** — a constraint the behavior must always honor.
- **Example** — one concrete case illustrating one rule, real values.
- **Question** — an unknown neither of you can resolve now.

Keep a running map in the conversation: story on top, each rule with its
examples beneath, questions parked at the bottom.

## How to drive it

1. **State the story back** in one sentence, your words; get a yes before
   proceeding. A wrong story makes every card below it wrong.
2. **Elicit rules one at a time** — "what must always hold?", "what is
   never allowed?". One declarative sentence each. A rule still fuzzy →
   sharpen it or demote it to a question; never move on with fog.
3. **Demand one concrete example per rule** — actual values, actual
   outcome. "Idle 31 minutes → any request redirects to login", not "old
   sessions expire". A rule nobody can exemplify is not understood.
4. **Probe the edges yourself** — offer one boundary case per rule ("what
   about exactly 30 minutes?"). The answer becomes an example or a new
   rule.
5. **Park unknowns immediately.** Hesitation → question card. Never
   resolve a question by guessing; never let it stall the session.

Rhythm: one rule, one or two examples, next rule. A rule accumulating five
examples is probably two rules.

## A finished map

```
Story: Sessions expire after inactivity

Rule: An idle session expires after 30 minutes
  Example: idle 31 min → any authenticated request redirects to login
  Example: idle 29 min → request succeeds, timer resets
Rule: Expiry preserves where the user was going
  Example: idle 31 min requesting /invoices/42 → after re-login, lands there
Question: Does "remember me" change the window?
```

## Stop conditions — read the map before drafting

- A rule without an example is not ready: extract one now or demote it.
- Questions outnumber rules, or any question blocks the core flow → stop,
  report the questions, wait. Drafting over open questions is guessing.
- A story that split mid-session is two sessions; finish the smaller half
  first.

## From map to criteria

Rule → one criterion (or a criterion per example when values differ in
kind). Example → the criterion's concrete values. Question → the
"Deferred — open questions" section, each with what it blocks — the human
sees the full list; nothing silently disappears.
