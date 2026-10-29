# Section "Operate: upgrades, monitoring, firewall, and the expiry date" of https://bitvps.com/guides/run-a-lightning-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

alias lncli='sudo -u lnd lncli --lnddir=/var/lib/lnd'
lncli getinfo | grep -E '"(synced_to_chain|synced_to_graph|num_active_channels|num_peers|block_height)"'
lncli state
lncli walletbalance && lncli channelbalance
df -h /var/lib/lnd /var/lib/bitcoind
journalctl -u lnd --since "1 hour ago" | grep -iE 'error|warn'
