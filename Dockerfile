FROM multiarch/crossbuild

COPY ./macos_linker.sh /usr/local/macos/macos_linker.sh

ENV CARGO_HOME=/usr/local/cargo
ENV RUSTUP_HOME=/usr/local/rustup

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
  && /usr/local/cargo/bin/rustup install stable \
  && /usr/local/cargo/bin/rustup default stable \
  && /usr/local/cargo/bin/rustup target install x86_64-apple-darwin \
  && /usr/local/cargo/bin/rustup target install x86_64-pc-windows-gnu
