# Section "Route the node over Tor" of https://bitvps.com/guides/run-a-bitcoin-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y tor
cat >> /etc/tor/torrc <<'EOF'
ControlPort 9051
CookieAuthentication 1
CookieAuthFileGroupReadable 1
EOF
systemctl restart tor

# Let the bitcoin user read Tor's auth cookie.
usermod -aG debian-tor bitcoin

cat >> /etc/bitcoin/bitcoin.conf <<'EOF'

# Tor
proxy=127.0.0.1:9050
listenonion=1
torcontrol=127.0.0.1:9051
# Uncomment to refuse clearnet entirely:
# onlynet=onion
EOF
systemctl restart bitcoind
