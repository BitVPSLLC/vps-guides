# Section "Build and run electrs" of https://bitvps.com/guides/run-an-electrum-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y build-essential libclang-dev git
useradd --system --home-dir /var/lib/electrs --shell /usr/sbin/nologin electrs
install -d -m 0750 -o electrs -g electrs /var/lib/electrs
usermod -aG bitcoin electrs

# Build as an unprivileged user with its own Rust toolchain.
useradd -m build
su - build -c 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y'
su - build -c 'git clone https://github.com/romanz/electrs && cd electrs && git checkout v0.12.0 && git verify-tag v0.12.0 || true'
su - build -c 'cd electrs && ~/.cargo/bin/cargo build --locked --release'
install -m 0755 -o root -g root /home/build/electrs/target/release/electrs /usr/local/bin/electrs
electrs --version
