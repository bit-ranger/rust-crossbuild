#!/bin/bash

# macos
docker run --rm  --cpus="0.5" -v "$(pwd)":/workdir rust-cross cargo build --target=x86_64-apple-darwin  --release --verbose

