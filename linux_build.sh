#!/bin/bash

# linux
docker run --rm --cpus="0.5"  -v "$(pwd)":/workdir rust-cross cargo build --release --verbose