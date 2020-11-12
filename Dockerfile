FROM multiarch/crossbuild

ENV CARGO_HOME=/usr/local/rust
ENV RUSTUP_HOME=/usr/local/rustup
ENV OPENSSL_INCLUDE_DIR=/usr/include/openssl
ENV OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
  && /usr/local/rust/bin/rustup install stable \
  && /usr/local/rust/bin/rustup default stable \
  && /usr/local/rust/bin/rustup target install x86_64-apple-darwin \
  && /usr/local/rust/bin/rustup target install x86_64-pc-windows-gnu
