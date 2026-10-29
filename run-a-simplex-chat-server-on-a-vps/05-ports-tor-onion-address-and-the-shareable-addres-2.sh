# Section "Ports, Tor onion address and the shareable address" of https://bitvps.com/guides/run-a-simplex-chat-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y tor
cat >> /etc/tor/torrc <<'EOF'
SocksPort 127.0.0.1:9050

HiddenServiceDir /var/lib/tor/simplex-smp/
HiddenServicePort 5223 127.0.0.1:5223

HiddenServiceDir /var/lib/tor/simplex-xftp/
HiddenServicePort 443 127.0.0.1:443
EOF
systemctl restart tor
sleep 5
cat /var/lib/tor/simplex-smp/hostname
cat /var/lib/tor/simplex-xftp/hostname
