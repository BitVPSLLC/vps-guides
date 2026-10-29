# Section "Channel backups off-box, and a watchtower" of https://bitvps.com/guides/run-a-lightning-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# On your laptop or home server, every hour from cron:
scp -q root@NODE_IP:/var/lib/lnd/data/chain/bitcoin/mainnet/channel.backup \
    ~/lnd-backups/channel-$(date +%F-%H).backup

# Or, on the node, export a fresh copy on demand:
sudo -u lnd lncli --lnddir=/var/lib/lnd exportchanbackup --all --output_file /var/lib/lnd/channel-export.backup
