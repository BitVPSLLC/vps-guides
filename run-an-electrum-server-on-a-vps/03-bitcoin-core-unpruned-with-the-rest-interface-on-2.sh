# Section "Bitcoin Core: unpruned, with the REST interface on" of https://bitvps.com/guides/run-an-electrum-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

systemctl restart bitcoind
# Wait for verificationprogress to reach 1.0 before starting electrs.
watch -n 60 "sudo -u bitcoin bitcoin-cli -conf=/etc/bitcoin/bitcoin.conf -datadir=/var/lib/bitcoind getblockchaininfo | grep -E '\"(blocks|headers|verificationprogress|size_on_disk)\"'"
