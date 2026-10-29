# Section "Channel backups off-box, and a watchtower" of https://bitvps.com/guides/run-a-lightning-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# Add a tower (ask a friend who runs one, or use one published by a node you trust):
sudo -u lnd lncli --lnddir=/var/lib/lnd wtclient add TOWER_PUBKEY@TOWER_ONION_ADDRESS.onion:9911
sudo -u lnd lncli --lnddir=/var/lib/lnd wtclient towers
