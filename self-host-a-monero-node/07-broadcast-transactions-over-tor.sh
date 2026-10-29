# Section "Broadcast transactions over Tor" of https://bitvps.com/guides/self-host-a-monero-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y tor
cat >> /etc/tor/torrc <<'EOF'
HiddenServiceDir /var/lib/tor/monero/
HiddenServiceVersion 3
HiddenServicePort 18084 127.0.0.1:18084
EOF
systemctl restart tor
cat /var/lib/tor/monero/hostname     # your onion address

cat >> /etc/monero/monerod.conf <<EOF

# Tor
tx-proxy=tor,127.0.0.1:9050,16
anonymous-inbound=$(cat /var/lib/tor/monero/hostname):18084,127.0.0.1:18084,25
EOF
systemctl restart monerod
