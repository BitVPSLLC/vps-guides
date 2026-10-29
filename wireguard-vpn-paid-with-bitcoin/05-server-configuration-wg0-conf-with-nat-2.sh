# Section "Server configuration: wg0.conf with NAT" of https://bitvps.com/guides/wireguard-vpn-paid-with-bitcoin
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

chmod 600 /etc/wireguard/wg0.conf

# Firewall: open the WireGuard port and allow forwarding from wg0 out to eth0.
# ufw's default FORWARD policy is DROP, so the route rule is required.
ufw allow 51820/udp
ufw route allow in on wg0 out on eth0

systemctl enable --now wg-quick@wg0
wg show
