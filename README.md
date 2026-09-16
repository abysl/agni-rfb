# agni-rfb

agni-rfb implements Riftbound game rules as a plugin for
[Agni](https://github.com/abysl/agni), a framework for digital card games.
The plugin checks requested actions and describes the next choices available
to a player.

It is a library and a portable game module, not a playable application.
For a graphical card table, see [Kai](https://github.com/abysl/kai).

## What is in this repository?

- Deck types and deck-construction checks.
- Turn, priority, combat, and card-effect logic.
- A WebAssembly plugin that exposes that logic to Agni.

**WebAssembly** is a portable executable format. Agni runs the compiled plugin
and gives its result to an application such as Kai.

The implementation is under active development. It is unofficial, may contain
rule errors, and is not a substitute for the game's official rules.

## Get started

To work on the source, install a current Rust toolchain and Git:

```sh
git clone https://github.com/abysl/agni-rfb.git
cd agni-rfb
cargo test --locked -p agni-riftbound-turns --lib
```

The [development guide](wiki/development.md) explains the complete checks,
plugin build, and debugging workflow.
[Contributing](CONTRIBUTING.md) explains how to submit a change.

## Repository boundaries

This is an Agni plugin, not a Kai plugin. It is kept separately so its
game-specific code and release decisions can be managed independently.

The source was extracted from Agni, but Agni still contains copies used by
existing clients. Publishing a change here does not automatically switch Kai
or Agni to that revision. See [architecture](wiki/architecture.md) before
planning an integration change.

## Documentation and license

Use the [documentation index](wiki/README.md) to choose a guide for your task.

Project code is licensed under [GNU GPL version 3](LICENSE). Riftbound names,
rules publications, artwork, and other third-party material are not
automatically licensed by this repository. This project is not endorsed by
the game's publisher. Do not add card scans or downloaded catalogs to a
contribution.
