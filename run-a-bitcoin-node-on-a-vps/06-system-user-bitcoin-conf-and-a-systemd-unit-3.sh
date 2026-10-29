# Section "System user, bitcoin.conf and a systemd unit" of https://bitvps.com/guides/run-a-bitcoin-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

systemctl daemon-reload
systemctl enable --now bitcoind
journalctl -u bitcoind -f    # watch it find peers and start downloading headers
