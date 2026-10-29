# Section "Enable IP forwarding" of https://bitvps.com/guides/wireguard-vpn-paid-with-bitcoin
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cat > /etc/sysctl.d/99-wireguard.conf <<'EOF'
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
EOF
sysctl --system
