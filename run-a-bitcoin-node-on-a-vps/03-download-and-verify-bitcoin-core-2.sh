# Section "Download and verify Bitcoin Core" of https://bitvps.com/guides/run-a-bitcoin-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

tar xzf bitcoin-$VER-$ARCH-linux-gnu.tar.gz
install -m 0755 -o root -g root -t /usr/local/bin bitcoin-$VER/bin/bitcoind bitcoin-$VER/bin/bitcoin-cli
bitcoind --version | head -1
