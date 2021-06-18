#!/bin/bash

set -e
# linux
docker run --rm -u "$(id -u)":"$(id -g)" -v "$(pwd)":/workdir rust-crossbuild /usr/local/cargo/bin/cargo build --release --verbose