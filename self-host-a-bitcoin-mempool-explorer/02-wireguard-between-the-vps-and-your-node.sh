# Section "WireGuard between the VPS and your node" of https://bitvps.com/guides/self-host-a-bitcoin-mempool-explorer
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# On both machines:
apt install -y wireguard
umask 077 && wg genkey | tee /etc/wireguard/private.key | wg pubkey > /etc/wireguard/public.key

# On the VPS (10.66.0.1):
cat > /etc/wireguard/wg0.conf <<EOF
[Interface]
Address = 10.66.0.1/24
ListenPort = 51820
PrivateKey = $(cat /etc/wireguard/private.key)

[Peer]
# your node
PublicKey = NODE_PUBLIC_KEY
AllowedIPs = 10.66.0.2/32
EOF
ufw allow 51820/udp
systemctl enable --now wg-quick@wg0

# On the node (10.66.0.2):
cat > /etc/wireguard/wg0.conf <<EOF
[Interface]
Address = 10.66.0.2/24
PrivateKey = $(cat /etc/wireguard/private.key)

[Peer]
# the VPS
PublicKey = VPS_PUBLIC_KEY
Endpoint = YOUR.VPS.IP:51820
AllowedIPs = 10.66.0.1/32
PersistentKeepalive = 25
EOF
systemctl enable --now wg-quick@wg0
ping -c 3 10.66.0.1
