#!/bin/bash

set -e

# macos
docker run --rm  --cpus="0.5" -v "$(pwd)":/workdir -e RUSTFLAGS="-C linker=/usr/local/macos/macos_linker.sh" -e CROSS_TRIPLE=x86_64-apple-darwin rust-cross /usr/local/cargo/bin/cargo build --target=x86_64-apple-darwin  --release --verbose

