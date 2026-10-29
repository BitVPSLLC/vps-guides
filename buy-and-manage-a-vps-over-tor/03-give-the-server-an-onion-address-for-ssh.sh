# Section "Give the server an onion address for SSH" of https://bitvps.com/guides/buy-and-manage-a-vps-over-tor
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# On the server:
apt install -y tor
cat >> /etc/tor/torrc <<'EOF'
SocksPort 0
HiddenServiceDir /var/lib/tor/ssh/
HiddenServiceVersion 3
HiddenServicePort 22 127.0.0.1:22
EOF
systemctl restart tor
cat /var/lib/tor/ssh/hostname      # e.g. abc...xyz.onion
