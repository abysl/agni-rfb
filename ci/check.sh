set -euo pipefail

cargo test --locked --workspace --lib
cargo check --locked --workspace --all-targets
