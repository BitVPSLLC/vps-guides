# Section "Download and verify Bitcoin Core" of https://bitvps.com/guides/run-a-bitcoin-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

VER=30.0   # check https://bitcoincore.org/en/download/ for the current release
ARCH=$(uname -m)   # x86_64 on the BVX plans, aarch64 on the Arm BVA plans
cd /tmp
curl -LO https://bitcoincore.org/bin/bitcoin-core-$VER/bitcoin-$VER-$ARCH-linux-gnu.tar.gz
curl -LO https://bitcoincore.org/bin/bitcoin-core-$VER/SHA256SUMS
curl -LO https://bitcoincore.org/bin/bitcoin-core-$VER/SHA256SUMS.asc

# Import the builder keys and check the signatures over SHA256SUMS.
apt install -y git
git clone --depth 1 https://github.com/bitcoin-core/guix.sigs
gpg --import guix.sigs/builder-keys/*.gpg
gpg --verify SHA256SUMS.asc SHA256SUMS

# Then check the tarball against the signed hash list.
sha256sum --ignore-missing --check SHA256SUMS
