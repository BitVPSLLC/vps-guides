# Section "obfs4 bridge: torrc and the bridge line" of https://bitvps.com/guides/run-a-tor-relay-or-bridge-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cat > /etc/tor/torrc <<'EOF'
BridgeRelay     1
BridgeDistribution any
Nickname        PickANickname
ContactInfo     you@example.com

ORPort          34521
ServerTransportPlugin obfs4 exec /usr/bin/obfs4proxy
ServerTransportListenAddr obfs4 0.0.0.0:48213
ExtORPort       auto
SocksPort       0

ExitRelay       0
ExitPolicy      reject *:*

RelayBandwidthRate  6 MBytes
RelayBandwidthBurst 12 MBytes
AccountingStart     month 1 00:00
AccountingMax       18 TBytes

ControlPort         9051
CookieAuthentication 1
Log notice file     /var/log/tor/notices.log
EOF

ufw allow 34521/tcp && ufw allow 48213/tcp
systemctl restart tor@default
sleep 20 && grep -E 'obfs4|reachable|fingerprint' /var/log/tor/notices.log

cat /var/lib/tor/pt_state/obfs4_bridgeline.txt    # the line you give to users
cat /var/lib/tor/hashed-fingerprint               # look it up at bridges.torproject.org/status
