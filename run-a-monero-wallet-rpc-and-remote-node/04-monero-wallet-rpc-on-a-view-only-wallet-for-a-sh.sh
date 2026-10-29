# Section "monero-wallet-rpc on a view-only wallet for a shop" of https://bitvps.com/guides/run-a-monero-wallet-rpc-and-remote-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

useradd --system --home-dir /var/lib/monero-wallet --shell /usr/sbin/nologin walletrpc
install -d -m 0750 -o walletrpc -g walletrpc /var/lib/monero-wallet /var/log/monero-wallet /etc/monero-wallet

# Create the view-only wallet on the server. Prompts: primary address, private view key,
# a wallet password, and a restore height (the block height when the shop wallet was created).
sudo -u walletrpc monero-wallet-cli --generate-from-view-key /var/lib/monero-wallet/shop-view \
  --daemon-address 127.0.0.1:18081 --trusted-daemon
# Type "exit" once it has created the wallet and started refreshing.

printf '%s' 'THE-WALLET-PASSWORD' > /etc/monero-wallet/password
openssl rand -hex 24 > /etc/monero-wallet/rpc-password
cat > /etc/monero-wallet/wallet-rpc.conf <<EOF
wallet-file=/var/lib/monero-wallet/shop-view
password-file=/etc/monero-wallet/password
daemon-address=127.0.0.1:18081
trusted-daemon=1
rpc-bind-ip=127.0.0.1
rpc-bind-port=18083
rpc-login=shop:$(cat /etc/monero-wallet/rpc-password)
log-file=/var/log/monero-wallet/wallet-rpc.log
log-level=0
EOF
chown -R walletrpc:walletrpc /etc/monero-wallet && chmod 0600 /etc/monero-wallet/*

cat > /etc/systemd/system/monero-wallet-rpc.service <<'EOF'
[Unit]
Description=Monero wallet RPC (view-only shop wallet)
Requires=monerod.service
After=monerod.service

[Service]
Type=simple
User=walletrpc
Group=walletrpc
ExecStart=/usr/local/bin/monero-wallet-rpc --config-file /etc/monero-wallet/wallet-rpc.conf
Restart=always
RestartSec=10
PrivateTmp=true
ProtectSystem=full
ProtectHome=true
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable --now monero-wallet-rpc
