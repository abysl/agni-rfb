# Standalone source sync review

## Scope

Synchronized the reviewed Riftbound source changes from Agni revision `29476af` into standalone `agni-rfb` on `worktree/playtest-standalone`.

## Changed paths

- `games/riftbound-turns/src/cards/keeper_of_masks.rs`
- `games/riftbound-turns/src/cards/leblanc_deceiver.rs`
- `games/riftbound-turns/src/cards/mirror_image.rs`
- `games/riftbound-turns/src/cards/mod.rs`
- `games/riftbound-turns/src/cards/mournful_witness.rs`
- `games/riftbound-turns/src/engine/cleanup.rs`
- `games/riftbound-turns/src/engine/ctx.rs`
- `games/riftbound-turns/src/engine/triggers.rs`
- `games/riftbound/rules/README.md`
- `plugins/riftbound/Cargo.toml`
- `plugins/riftbound/src/lib.rs`
- `plugins/riftbound/tests/projection.rs`

## Review notes

- Plugin version bumped from `0.8.1` to `0.9.0`.
- Standalone Git dependency boundaries were preserved in all Cargo manifests.
- `Cargo.lock` was intentionally not updated; the new public Agni revision is not published yet.
- `plugins/riftbound/build.rs` and rules data files required no source changes.
- No cold build was run. `git diff --check` passed.

## Follow-up

Await the final Rune source revision and the published Agni revision before the second synchronization. Update the lock pin only after that revision is available.

## Public lock update

The standalone lockfile now pins the Agni Git dependencies to public revision `7105f788852d8c7678a1865e65576ba2087c17ae`, and the locked plugin package is `0.9.0`.

Verification passed with `CARGO_BUILD_JOBS=3`, `CARGO_PROFILE_DEV_DEBUG=0`, and `CARGO_INCREMENTAL=0`: 4563 tests passed, 172 were ignored, and the all-targets check passed. `treefmt` was attempted but could not initialize because `taplo` is not installed. No build cleanup was performed.
