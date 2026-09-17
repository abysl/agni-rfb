# Standalone playtest release review

Audience: contributors reviewing the plugin release and its compatibility.

The Riftbound source matches Agni revision `76ac903833c986038be6e56616633cc6d86bb1c2`.
Standalone Cargo manifests retain their public Git dependencies instead of
assuming an adjacent Agni workspace. Cargo.lock pins those dependencies to
`7105f788852d8c7678a1865e65576ba2087c17ae`.

Plugin 0.9.0 adds copied Reflection faces and abilities, Mournful Witness's
combat-ended Empower trigger, explicit rune choices for pending payments,
and consistent numbered yes/no choices. It requires an engine and host that
support engine ABI 4 and plugin ABI 1.

Some immediate payment paths still choose runes automatically. Non-token
copying, including Shady Spectacles, remains unsupported; it must restore the
original printed face when a real card changes zones. Existing ignored tests
remain limitations, not verified behavior.

Verification:

- Rules suite: 4,563 passed, 172 ignored, no failures.
- Standalone all-targets check passed.
- The pinned Nix formatting environment's `treefmt --ci` passed.
- Source comparison against the integrated Agni rules and plugin passed.
- `git diff --check` passed.

No artwork, generated modules, credentials, or deployment configuration was
added. The standalone rules documentation and navigation were preserved.
