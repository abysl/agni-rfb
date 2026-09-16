# agni-rfb

The Riftbound game plugin for [Agni](https://github.com/abysl/agni).

This repository contains the game-specific plugin, zone and deck model, and
turn implementation. It produces the plugin module that an Agni client loads
at runtime. The neutral engine and SDK remain in Agni; the generic content and
blob mesh remains in [Spirit Library](https://github.com/abysl/spirit-library).

## Layout

| Path | Purpose |
| --- | --- |
| `plugins/riftbound/` | plugin manifest, decider, presenter, and ABI tests |
| `games/riftbound/` | Riftbound zones, deck shapes, and table options |
| `games/riftbound-turns/` | deterministic turn and card behavior |
| `rules/` | rules references and local test pools |

## Build

```text
cargo test --workspace
cargo build -p agni-riftbound-plugin
```

The plugin is loaded by identity and pinned by the table genesis. A client and
host must use compatible Agni wire and engine versions.
