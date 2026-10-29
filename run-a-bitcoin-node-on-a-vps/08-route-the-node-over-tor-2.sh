# Section "Route the node over Tor" of https://bitvps.com/guides/run-a-bitcoin-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# Only if you want clearnet peers to reach you too:
ufw allow 8333/tcp

# Confirm the onion address was created:
sudo -u bitcoin bitcoin-cli -conf=/etc/bitcoin/bitcoin.conf -datadir=/var/lib/bitcoind getnetworkinfo | grep -A3 localaddresses
