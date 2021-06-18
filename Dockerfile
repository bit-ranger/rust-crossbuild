# 基础镜像
FROM rust:1.53.0

# 作者及联系方式
MAINTAINER bitranger sincerebravefight@gmail.com

WORKDIR /workdir

RUN sh -s -- -y \
    && apt install clang gcc g++ cmake patch libssl-devel lzma-devel zlib1g-dev libmpc-dev libmpfr-dev libgmp-dev libxml2-dev

RUN rustup target add x86_64-apple-darwin
    && cd /usr/local
    && git clone https://github.com/tpoechtrager/osxcross
    && cd osxcross
    && sudo tools/get_dependencies.sh
    && wget -nc https://github.com/phracker/MacOSX-SDKs/releases/download/11.3/MacOSX11.3.sdk.tar.xz
    && mv MacOSX11.3.sdk.tar.xz tarballs/
    && UNATTENDED=1 ./build.sh

ENV PATH="/usr/local/osxcross/target/bin:${PATH}"
ENV CC=o64-clang
ENV CXX=o64-clang++
ENV LIBZ_SYS_STATIC=1

COPY cargo/config /usr/local/cargo
