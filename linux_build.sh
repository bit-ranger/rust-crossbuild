#!/bin/bash

set -e
# linux
docker run --rm --cpus="0.5"  -v "$(pwd)":/workdir rust-cross /usr/local/cargo/bin/cargo build --release --verbose