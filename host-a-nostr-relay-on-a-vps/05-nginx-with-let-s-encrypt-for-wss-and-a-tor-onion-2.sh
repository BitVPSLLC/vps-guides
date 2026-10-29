# Section "nginx with Let’s Encrypt for wss://, and a Tor onion" of https://bitvps.com/guides/host-a-nostr-relay-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y tor
cat >> /etc/tor/torrc <<'EOF'
HiddenServiceDir /var/lib/tor/nostr/
HiddenServiceVersion 3
HiddenServicePort 80 127.0.0.1:7777
EOF
systemctl restart tor
cat /var/lib/tor/nostr/hostname     # advertise as ws://THIS.onion
