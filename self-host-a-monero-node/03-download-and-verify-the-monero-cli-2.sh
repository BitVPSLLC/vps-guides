# Section "Download and verify the Monero CLI" of https://bitvps.com/guides/self-host-a-monero-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

tar xjf monero.tar.bz2
install -m 0755 -o root -g root -t /usr/local/bin monero-*/monerod monero-*/monero-wallet-cli monero-*/monero-wallet-rpc
monerod --version
