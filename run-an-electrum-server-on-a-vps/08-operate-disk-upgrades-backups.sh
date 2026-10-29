# Section "Operate: disk, upgrades, backups" of https://bitvps.com/guides/run-an-electrum-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

df -h /var/lib/bitcoind /var/lib/electrs
curl -s http://127.0.0.1:4224/metrics | grep -v '^#' | head -40   # Prometheus metrics
journalctl -u electrs --since "1 hour ago" | grep -iE 'error|warn'
sudo -u bitcoin bitcoin-cli -conf=/etc/bitcoin/bitcoin.conf -datadir=/var/lib/bitcoind getblockchaininfo | grep size_on_disk
