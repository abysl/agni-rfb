# Contributing to agni-rfb

Audience: programmers new to this codebase. Familiarity with Riftbound helps
with rules work, but the [architecture guide](wiki/architecture.md) explains
how a request becomes a game decision.

## Fix a rule with a reproducible example

1. Follow the [development guide](wiki/development.md) and run the focused tests.
2. Identify the smallest game state and action that demonstrate the problem.
3. Add a regression test near the relevant rule or card implementation.
4. Change the decision logic and verify both the accepted and refused cases.
5. Open a GitHub pull request explaining the expected behavior, the relevant
   rule source, and the commands you ran.

Describe the rule in your own words and link to the source. Do not paste
entire rules publications or copyrighted card text into a report or fixture.

## Preserve reproducibility and hidden information

Rule decisions must depend only on the supplied state and action. Do not use
clocks, network calls, environment variables, or unseeded randomness. Do not
let unordered iteration choose an outcome.

Test from each affected player's point of view. A refused action must not
leak a hidden card or partially apply its cost. Prompts must expose enough
information for the intended player to answer, not private information to
every player.

## Review checklist

Run treefmt and the [fast checks](wiki/development.md#checks). For a plugin
change, also compile the WebAssembly target. Call out changes to the saved
state format or the plugin interface; these need compatibility review.

Keep code free of comment lines. Put explanations in the wiki and the reason
for a change in the commit message. Do not commit credentials, internal
deployment details, compiled modules, or game artwork.

Changes to the framework belong in Agni. Changes to drawing, menus, or input
belong in Kai. A change spanning repositories should link the corresponding
pull requests and state the compatible revisions.
