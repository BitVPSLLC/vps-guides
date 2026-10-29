# Section "Prepare the server" of https://bitvps.com/guides/run-a-tor-relay-or-bridge-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt update && apt full-upgrade -y
apt install -y ufw unattended-upgrades curl gnupg

# SSH: keys only. Put your public key in /root/.ssh/authorized_keys first and
# confirm you can log in with it before disabling passwords.
cat > /etc/ssh/sshd_config.d/00-keys-only.conf <<'EOF'
PasswordAuthentication no
KbdInteractiveAuthentication no
PermitRootLogin prohibit-password
EOF
sshd -t && systemctl restart ssh

# Firewall: deny everything inbound except SSH for now.
ufw default deny incoming
ufw default allow outgoing
ufw allow OpenSSH
ufw --force enable
