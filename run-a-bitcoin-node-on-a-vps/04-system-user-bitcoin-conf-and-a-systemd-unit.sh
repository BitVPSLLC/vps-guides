# Section "System user, bitcoin.conf and a systemd unit" of https://bitvps.com/guides/run-a-bitcoin-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

useradd --system --home-dir /var/lib/bitcoind --shell /usr/sbin/nologin bitcoin
install -d -m 0710 -o bitcoin -g bitcoin /var/lib/bitcoind
install -d -m 0750 -o bitcoin -g bitcoin /etc/bitcoin

cat > /etc/bitcoin/bitcoin.conf <<'EOF'
server=1
txindex=0
prune=10000
dbcache=1000
maxconnections=40

# RPC only on localhost, cookie auth (the default) for local clients.
rpcbind=127.0.0.1
rpcallowip=127.0.0.1

# Accept inbound connections.
listen=1
EOF
chown bitcoin:bitcoin /etc/bitcoin/bitcoin.conf
chmod 0640 /etc/bitcoin/bitcoin.conf
