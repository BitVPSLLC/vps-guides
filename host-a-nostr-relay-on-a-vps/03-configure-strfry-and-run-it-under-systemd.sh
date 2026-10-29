# Section "Configure strfry and run it under systemd" of https://bitvps.com/guides/host-a-nostr-relay-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

useradd --system --home-dir /var/lib/strfry --shell /usr/sbin/nologin strfry
install -d -m 0750 -o strfry -g strfry /var/lib/strfry /var/lib/strfry/db /etc/strfry

cat > /etc/strfry.conf <<'EOF'
db = "/var/lib/strfry/db/"

relay {
    bind = "127.0.0.1"
    port = 7777
    nofiles = 524288
    realIpHeader = "x-real-ip"

    info {
        name = "my relay"
        description = "Personal relay. Writes restricted; reads open."
        pubkey = "YOUR_HEX_OR_NPUB_PUBKEY"
        contact = "relay-admin@example.com"
    }

    writePolicy {
        plugin = ""
    }
}
EOF
chown root:strfry /etc/strfry.conf && chmod 0640 /etc/strfry.conf

cat > /etc/systemd/system/strfry.service <<'EOF'
[Unit]
Description=strfry Nostr relay
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=strfry
Group=strfry
ExecStart=/usr/local/bin/strfry --config /etc/strfry.conf relay
Restart=on-failure
RestartSec=5
LimitNOFILE=1000000
PrivateTmp=true
ProtectSystem=full
ProtectHome=true
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable --now strfry

# NIP-11 document, served on the same port when asked for application/nostr+json:
curl -s -H 'Accept: application/nostr+json' http://127.0.0.1:7777/
