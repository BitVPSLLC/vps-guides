# Section "Add a client and generate its config plus QR code" of https://bitvps.com/guides/wireguard-vpn-paid-with-bitcoin
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cd /etc/wireguard
umask 077
wg genkey | tee phone.key | wg pubkey > phone.pub
wg genpsk > phone.psk

SERVER_IP=$(curl -4 -s https://ifconfig.me)
cat > phone.conf <<EOF
[Interface]
PrivateKey = $(cat phone.key)
Address = 10.8.0.2/32, fd00:8::2/128
DNS = 10.8.0.1

[Peer]
PublicKey = $(cat server.pub)
PresharedKey = $(cat phone.psk)
Endpoint = $SERVER_IP:51820
AllowedIPs = 0.0.0.0/0, ::/0
PersistentKeepalive = 25
EOF

# Register the peer on the server side.
cat >> wg0.conf <<EOF

[Peer]
# phone
PublicKey = $(cat phone.pub)
PresharedKey = $(cat phone.psk)
AllowedIPs = 10.8.0.2/32, fd00:8::2/128
EOF

# Apply without dropping existing sessions.
wg syncconf wg0 <(wg-quick strip wg0)

# Scan from the WireGuard app, or copy phone.conf to a laptop.
qrencode -t ansiutf8 < phone.conf

# Once imported, remove the client's private material from the server.
shred -u phone.key phone.psk phone.conf
