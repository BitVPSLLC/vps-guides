# Section "Install Tor from the Tor Project repository" of https://bitvps.com/guides/run-a-tor-relay-or-bridge-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y apt-transport-https gnupg
curl -fsSL https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc \
  | gpg --dearmor -o /usr/share/keyrings/tor-archive-keyring.gpg
gpg --show-keys /usr/share/keyrings/tor-archive-keyring.gpg

cat > /etc/apt/sources.list.d/tor.list <<'EOF'
deb     [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org noble main
deb-src [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org noble main
EOF
apt update
apt install -y tor deb.torproject.org-keyring obfs4proxy nyx
tor --version
