# Section "DNS: do not leak queries around the tunnel" of https://bitvps.com/guides/wireguard-vpn-paid-with-bitcoin
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y unbound
cat > /etc/unbound/unbound.conf.d/wg.conf <<'EOF'
server:
    interface: 10.8.0.1
    interface: 127.0.0.1
    access-control: 10.8.0.0/24 allow
    access-control: fd00:8::/64 allow
    access-control: 127.0.0.0/8 allow
    hide-identity: yes
    hide-version: yes
    qname-minimisation: yes
    prefetch: yes
EOF
unbound-checkconf && systemctl restart unbound
ufw allow in on wg0 to any port 53
