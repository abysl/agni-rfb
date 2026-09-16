# Developing agni-rfb

Audience: programmers who know basic Git and terminal use but have not worked
on this project. Commands below start at the repository root after checkout.

## Requirements and checkout

Install Git and Rust 1.98.1, including Cargo. If using rustup:

```sh
rustup toolchain install 1.98.1
git clone https://github.com/abysl/agni-rfb.git
cd agni-rfb
rustup override set 1.98.1
```

Cargo fetches the public Agni revision in Cargo.lock. This repository does not
currently provide a devenv environment; plain Cargo is the supported path.

## Checks

```sh
bash ci/check.sh
```

This runs the workspace's library tests and compile-checks all targets. It does
not download card images, launch Kai, or execute a multiplayer match.

For a focused rule test:

```sh
cargo test --locked -p agni-riftbound-turns --lib
```

Use Cargo's test-name filter while iterating. A rule fix should cover an accepted
action, a rejected action, and any prompt or hidden-information effects.

## Build the plugin

```sh
rustup target add wasm32-unknown-unknown
cargo build --locked -p agni-riftbound-plugin --target wasm32-unknown-unknown --release
```

The raw output is
`target/wasm32-unknown-unknown/release/riftbound_plugin.wasm`.
A native build is useful for tests but is not the portable plugin artifact.

Before a host loads the module, use the compatible Agni checkout's
`agni-harden` tool to validate and harden it. Pass the raw input path and a
separate output path. Do not hash or distribute the raw compiler output as if
it were the hardened module.

The [architecture guide](architecture.md) explains which crate owns each part
and why consumers need an explicit dependency update after a change here.

## Formatting

treefmt runs the configured language formatters for this repository. With Nix
installed, the pinned environment supplies treefmt, rustfmt, taplo, and alejandra:

```sh
nix-shell ci/format.nix --run treefmt
nix-shell ci/format.nix --run 'treefmt --ci'
```

The first command applies formatting; the second fails if formatting changes
are needed. You can also install those tools yourself and run `treefmt`
directly. Rust, TOML, and Nix are covered; prose is reviewed for clarity.

## What GitHub checks

The `PR checks` workflow runs on pull requests targeting `main`, pushes to
`main`, and merge-queue events. Its `treefmt` and `fast-check` jobs feed the
single `pr-gate` result.

Rust dependency/build caches are reused; only pushes to `main` save shared
caches. A cold run still needs to fetch and compile dependencies.
The workflow uses read-only repository permissions and does not publish
packages or deploy applications.

Repository administrators must require `pr-gate` in the protection rule or
ruleset for `main` to prevent merging a failed check. A workflow file alone
does not enforce that rule.

## Common failures

If `--locked` refuses to proceed, a manifest and Cargo.lock disagree. Update
the lockfile intentionally, inspect the dependency changes, and commit it.
Do not remove `--locked` from CI to hide the mismatch.

A missing formatter means its executable is not on PATH; use the pinned Nix
environment. A native linker/pkg-config error usually means a required system
library or build tool is missing, not that a Rust test failed.

Run commands from the repository root unless a guide explicitly says otherwise.
