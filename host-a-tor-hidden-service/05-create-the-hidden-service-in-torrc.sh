# Section "Create the hidden service in torrc" of https://bitvps.com/guides/host-a-tor-hidden-service
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cat >> /etc/tor/torrc <<'EOF'
# This box only hosts a service; no local SOCKS proxy needed.
SocksPort 0

HiddenServiceDir /var/lib/tor/onion_site/
HiddenServiceVersion 3
HiddenServicePort 80 127.0.0.1:8080

# Intro-point rate limiting (pushed to introduction points via the descriptor).
HiddenServiceEnableIntroDoSDefense 1
HiddenServiceEnableIntroDoSRatePerSec 25
HiddenServiceEnableIntroDoSBurstPerSec 200

# Proof-of-work: clients solve a puzzle when the service is under load.
HiddenServicePoWDefensesEnabled 1
HiddenServicePoWQueueRate 250
HiddenServicePoWQueueBurst 2500
EOF
systemctl restart tor
cat /var/lib/tor/onion_site/hostname
