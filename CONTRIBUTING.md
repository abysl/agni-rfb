# Contributing to agni-rfb

`agni-rfb` contains the Riftbound-specific Agni plugin, its zone and deck
shapes, and its turn implementation. It is intentionally separate from the
neutral engine.

## Development

The workspace depends on the public Agni repository for the engine SDK and
simulation crates:

```text
direnv allow
cargo test --workspace
cargo build -p agni-riftbound-plugin
```

Read the relevant Agni design documents before changing the plugin ABI,
manifest, zones, or serialized game state. Keep plugin decisions deterministic
and preserve compatibility with the pinned Agni wire and engine interfaces.

## Pull requests

Use a focused branch and describe any change to card behavior, serialized
state, plugin manifests, or module compatibility. Run the full workspace test
suite before opening a pull request.
