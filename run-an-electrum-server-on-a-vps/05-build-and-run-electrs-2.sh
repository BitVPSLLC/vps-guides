# Section "Build and run electrs" of https://bitvps.com/guides/run-an-electrum-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cat > /etc/electrs.toml <<'EOF'
network = "bitcoin"
daemon_dir = "/var/lib/bitcoind"
daemon_rpc_addr = "127.0.0.1:8332"
cookie_file = "/var/lib/bitcoind/.cookie"
db_dir = "/var/lib/electrs/db"
electrum_rpc_addr = "127.0.0.1:50001"
monitoring_addr = "127.0.0.1:4224"
log_filters = "INFO"
EOF
chown root:electrs /etc/electrs.toml && chmod 0640 /etc/electrs.toml

cat > /etc/systemd/system/electrs.service <<'EOF'
[Unit]
Description=electrs Electrum server
Requires=bitcoind.service
After=bitcoind.service

[Service]
Type=simple
User=electrs
Group=electrs
ExecStart=/usr/local/bin/electrs --conf /etc/electrs.toml
Restart=on-failure
RestartSec=30
TimeoutStopSec=600
LimitNOFILE=65536
PrivateTmp=true
ProtectSystem=full
ProtectHome=true
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable --now electrs
journalctl -u electrs -f     # "indexed N blocks" lines until it reaches the tip
