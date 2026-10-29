# Section "Bitcoin Core: pruned, ZMQ, Tor-only" of https://bitvps.com/guides/run-a-lightning-node-on-a-vps
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

usermod -aG debian-tor bitcoin
systemctl restart bitcoind
ls -l /var/lib/bitcoind/.cookie    # expect -rw-r----- bitcoin bitcoin

sudo -u bitcoin bitcoin-cli -conf=/etc/bitcoin/bitcoin.conf -datadir=/var/lib/bitcoind getblockchaininfo | grep -E '"(blocks|headers|pruned|verificationprogress)"'
