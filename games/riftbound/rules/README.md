# Rule references and pool data

Audience: contributors changing the plugin's rules or test inputs.
This is not an official rulebook or a player guide.

Use the publisher's [rules hub](https://playriftbound.com/en-us/rules-hub/)
for official rules, and cite the edition/date with a rule number. Historical
copies do not establish the latest ruling.

The extracted rule-text files are third-party reference material, not
project-authored GPL code. Do not assume their inclusion grants redistribution
rights or add further complete publications to a release bundle.

## Markdown that is also data

Files under `pool/` are read by the card registry's coverage tests and by
existing downstream consumers. They contain deck sections and card rows in
a defined delimiter-based grammar.

A documentation rewrite must not reflow or paraphrase those rows. Inspect
`games/riftbound-turns/src/cards/mod.rs` and the relevant consumer before
changing the format. Coaching prose at the end must remain distinguishable
from card rows.

Prefer synthetic fixtures for new behavior tests. New card text, art, or
catalog data requires its own provenance and redistribution review.

For code changes, return to the [development guide](../../../wiki/development.md).
