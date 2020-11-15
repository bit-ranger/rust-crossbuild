FROM multiarch/crossbuild

ENV CARGO_HOME=/usr/local/rust
ENV RUSTUP_HOME=/usr/local/rustup

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
  && /usr/local/rust/bin/rustup install stable \
  && /usr/local/rust/bin/rustup default stable \
  && /usr/local/rust/bin/rustup target install x86_64-apple-darwin \
  && /usr/local/rust/bin/rustup target install x86_64-pc-windows-gnu

RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list \
 && sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list \
 && apt-get -o Acquire::Check-Valid-Until=false update \
 && apt-get install openssl -y \
 && apt-get install libssl-dev -y