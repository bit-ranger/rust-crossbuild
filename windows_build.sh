#!/bin/bash

set -e


# windows
docker run --rm  --cpus="0.5" -v "$(pwd)":/workdir -e CROSS_TRIPLE=x86_64-w64-mingw32 rust-crossbuild /usr/local/cargo/bin/cargo build --target=x86_64-pc-windows-gnu  --release --verbose

