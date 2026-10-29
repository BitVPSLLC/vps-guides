# Section "Give the server an onion address for SSH" of https://bitvps.com/guides/buy-and-manage-a-vps-over-tor
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# Step 1: restrict clearnet SSH to a single address you control (optional half-way house).
ufw delete allow OpenSSH
ufw allow from YOUR.OTHER.IP to any port 22 proto tcp

# Step 2 (onion-only): bind sshd to localhost so only tor can reach it.
# Ubuntu 24.04 starts sshd through ssh.socket, which ignores ListenAddress,
# so switch to the plain service first.
systemctl disable --now ssh.socket
systemctl enable ssh.service
cat > /etc/ssh/sshd_config.d/10-onion-only.conf <<'EOF'
ListenAddress 127.0.0.1
EOF
sshd -t && systemctl restart ssh
ufw delete allow from YOUR.OTHER.IP to any port 22 proto tcp
ss -ltnp | grep sshd      # should show 127.0.0.1:22 only
