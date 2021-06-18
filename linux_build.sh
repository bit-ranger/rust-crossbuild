#!/bin/bash

set -e
# linux
docker run --rm --cpus="0.5"  -v "$(pwd)":/workdir rust-crossbuild /usr/local/cargo/bin/cargo build --release --verbose