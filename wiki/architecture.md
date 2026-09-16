# How the Riftbound plugin is organized

Audience: developers who know basic programming but are new to this plugin.
Start with the [development guide](development.md) to run its tests.

## Three crates, three jobs

| Directory | Cargo package | Purpose |
|---|---|---|
| `games/riftbound/` | `agni-riftbound` | Deck shapes, zones, deal plans, and deck legality |
| `games/riftbound-turns/` | `agni-riftbound-turns` | State transitions, prompts, combat, and card scripts |
| `plugins/riftbound/` | `agni-riftbound-plugin` | Agni's portable plugin entry points and manifest |

Agni supplies the game-neutral table, action log, and plugin toolkit.
A renderer such as Kai supplies input and presentation. This repository must
not depend on the renderer.

## Follow a request

Agni passes a table snapshot, plugin state, and requested action into the
plugin. The turn machine checks the request. It can refuse it with a reason
or return updated plugin state and effects for Agni to apply.

An **effect** is a requested framework change, such as moving a card or
updating a counter. A **prompt** asks a particular player to choose an option.
The **view** describes the player's available actions without directly
drawing buttons or cards.

The main state lives in `games/riftbound-turns/src/state.rs`; rule execution
is organized under `engine/`, and individual card behavior under `cards/`.
Inspect the neighboring tests before extending one of these areas.

## Deck rules are separate from play rules

`agni-riftbound` can check whether a deck satisfies construction constraints.
That does not decide whether a particular card can be played at a particular
moment. In-game decisions belong to the turn machine.

Likewise, importing a card's name or image does not implement its effect.

## Build and runtime identity

The plugin compiles to WebAssembly, then Agni's hardening tool validates it and
adds execution limits. Raw compiler output and hardened output are different
artifacts. The host identifies the hardened bytes by their hash and pins them
for a session. Rebuilding a plugin does not update an existing match.

## Extraction status

Agni still includes copies of these crates. Some consumers continue to use
those copies. Until their manifests and build helpers move to this repository,
a fix here requires an explicit integration update elsewhere. Do not make
the same change in both locations without documenting which revision a client
actually uses.
