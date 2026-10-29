# Section "Publish the restricted RPC as an onion and connect your wallets" of https://bitvps.com/guides/run-a-monero-wallet-rpc-and-remote-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cat >> /etc/tor/torrc <<'EOF'
HiddenServiceDir /var/lib/tor/monero-rpc/
HiddenServiceVersion 3
HiddenServicePort 18089 127.0.0.1:18089
EOF
systemctl restart tor
cat /var/lib/tor/monero-rpc/hostname      # YOURNODE.onion

# From your laptop, with Tor running locally on 9050:
monero-wallet-cli --proxy 127.0.0.1:9050 --daemon-address YOURNODE.onion:18089 --trusted-daemon --wallet-file mywallet

# Or skip Tor and tunnel the port over SSH instead:
ssh -N -L 18089:127.0.0.1:18089 root@YOUR.SERVER.IP
monero-wallet-cli --daemon-address 127.0.0.1:18089 --trusted-daemon --wallet-file mywallet
