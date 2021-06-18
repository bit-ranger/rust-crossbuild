#!/bin/bash

set -e

# macos
docker run --rm -u "$(id -u)":"$(id -g)" -v "$(pwd)":/workdir -e RUSTFLAGS="-C linker=/workdir/macos_linker.sh" -e CROSS_TRIPLE=x86_64-apple-darwin rust-crossbuild /usr/local/cargo/bin/cargo build --target=x86_64-apple-darwin  --release --verbose

