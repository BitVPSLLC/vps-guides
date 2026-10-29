# Section "Monitor and maintain" of https://bitvps.com/guides/run-a-bitcoin-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

alias btc='sudo -u bitcoin bitcoin-cli -conf=/etc/bitcoin/bitcoin.conf -datadir=/var/lib/bitcoind'
btc getblockchaininfo
btc getnetworkinfo | grep -E '"connections|"version'
btc getpeerinfo | grep -c '"inbound": true'
df -h /var/lib/bitcoind
journalctl -u bitcoind --since "1 hour ago" | grep -i -E 'error|warn'
