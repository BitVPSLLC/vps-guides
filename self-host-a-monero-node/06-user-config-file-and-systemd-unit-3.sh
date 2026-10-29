# Section "User, config file and systemd unit" of https://bitvps.com/guides/self-host-a-monero-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

systemctl daemon-reload
systemctl enable --now monerod
ufw allow 18080/tcp    # P2P
ufw allow 18089/tcp    # restricted RPC for wallets
tail -f /var/log/monero/monerod.log
