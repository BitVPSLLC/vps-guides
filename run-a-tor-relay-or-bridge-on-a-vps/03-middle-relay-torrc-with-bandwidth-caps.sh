# Section "Middle relay: torrc with bandwidth caps" of https://bitvps.com/guides/run-a-tor-relay-or-bridge-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cat > /etc/tor/torrc <<'EOF'
Nickname        PickANickname
ContactInfo     you@example.com

ORPort          9001
# ORPort        [YOUR_IPV6_ADDRESS]:9001
SocksPort       0

# This is a middle relay. Exits are not permitted on BitVPS.
ExitRelay       0
ExitPolicy      reject *:*

# Stay inside the 20 TB monthly allowance (values are bytes, not bits).
RelayBandwidthRate  6 MBytes
RelayBandwidthBurst 12 MBytes
AccountingStart     month 1 00:00
AccountingMax       18 TBytes

# For nyx and your own inspection only.
ControlPort         9051
CookieAuthentication 1
Log notice file     /var/log/tor/notices.log
EOF

ufw allow 9001/tcp
systemctl restart tor@default
sleep 20 && tail -n 20 /var/log/tor/notices.log
