# Section "monerod: pruned, restricted RPC on localhost, broadcasts over Tor" of https://bitvps.com/guides/run-a-monero-wallet-rpc-and-remote-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

useradd --system --home-dir /var/lib/monero --shell /usr/sbin/nologin monero
install -d -m 0750 -o monero -g monero /var/lib/monero /var/log/monero /etc/monero
apt install -y tor

cat > /etc/monero/monerod.conf <<'EOF'
data-dir=/var/lib/monero
log-file=/var/log/monero/monerod.log
log-level=0
max-log-files=5

prune-blockchain=1
sync-pruned-blocks=1

p2p-bind-ip=0.0.0.0
p2p-bind-port=18080
out-peers=16
in-peers=32
limit-rate-up=2048
limit-rate-down=8192

# Unrestricted RPC for monero-wallet-rpc on this machine only.
rpc-bind-ip=127.0.0.1
rpc-bind-port=18081

# Restricted RPC for your wallets. Localhost only; Tor publishes it as an onion.
rpc-restricted-bind-ip=127.0.0.1
rpc-restricted-bind-port=18089

# Your own transaction broadcasts go out through Tor.
tx-proxy=tor,127.0.0.1:9050,16
no-zmq=1
EOF
chown monero:monero /etc/monero/monerod.conf

cat > /etc/systemd/system/monerod.service <<'EOF'
[Unit]
Description=Monero daemon
After=network-online.target tor.service
Wants=network-online.target

[Service]
Type=simple
User=monero
Group=monero
ExecStart=/usr/local/bin/monerod --config-file /etc/monero/monerod.conf --non-interactive
Restart=always
RestartSec=10
TimeoutStopSec=120
PrivateTmp=true
ProtectSystem=full
ProtectHome=true
NoNewPrivileges=true
PrivateDevices=true

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable --now monerod
ufw allow 18080/tcp        # P2P only. 18081 and 18089 stay closed.
tail -f /var/log/monero/monerod.log
