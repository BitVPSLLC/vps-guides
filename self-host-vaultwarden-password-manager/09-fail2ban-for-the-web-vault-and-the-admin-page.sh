# Section "fail2ban for the web vault and the admin page" of https://bitvps.com/guides/self-host-vaultwarden-password-manager
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y fail2ban

cat > /etc/fail2ban/filter.d/vaultwarden.local <<'EOF'
[INCLUDES]
before = common.conf
[Definition]
failregex = ^.*?Username or password is incorrect\. Try again\. IP: <ADDR>\. Username:.*$
ignoreregex =
EOF

cat > /etc/fail2ban/filter.d/vaultwarden-admin.local <<'EOF'
[INCLUDES]
before = common.conf
[Definition]
failregex = ^.*?Invalid admin token\. IP: <ADDR>.*$
ignoreregex =
EOF

cat > /etc/fail2ban/jail.d/vaultwarden.local <<'EOF'
[vaultwarden]
enabled  = true
port     = http,https
filter   = vaultwarden
logpath  = /opt/vaultwarden/data/vaultwarden.log
maxretry = 5
bantime  = 14400
findtime = 14400

[vaultwarden-admin]
enabled  = true
port     = http,https
filter   = vaultwarden-admin
logpath  = /opt/vaultwarden/data/vaultwarden.log
maxretry = 3
bantime  = 14400
findtime = 14400
EOF

systemctl enable --now fail2ban
systemctl restart fail2ban
fail2ban-client status vaultwarden
