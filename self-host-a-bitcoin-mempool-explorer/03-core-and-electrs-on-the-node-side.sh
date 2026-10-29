# Section "Core and electrs on the node side" of https://bitvps.com/guides/self-host-a-bitcoin-mempool-explorer
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# On the node:
curl -sSL https://raw.githubusercontent.com/bitcoin/bitcoin/master/share/rpcauth/rpcauth.py | python3 - mempool
# Paste the printed rpcauth=mempool:... line into bitcoin.conf and keep the password for the VPS.

cat >> /etc/bitcoin/bitcoin.conf <<'EOF'
txindex=1
prune=0
server=1
rpcbind=127.0.0.1
rpcbind=10.66.0.2
rpcallowip=127.0.0.1
rpcallowip=10.66.0.1/32
rpcworkqueue=128
rpcthreads=8
EOF
systemctl restart bitcoind
bitcoin-cli -rpcwait getindexinfo        # txindex builds in the background; wait for synced: true

# electrs: serve the Electrum protocol on the tunnel address.
sed -i 's|^electrum_rpc_addr.*|electrum_rpc_addr = "10.66.0.2:50001"|' /etc/electrs.toml
systemctl restart electrs

ufw allow from 10.66.0.1 to any port 8332 proto tcp
ufw allow from 10.66.0.1 to any port 50001 proto tcp

# From the VPS, confirm both are reachable:
curl -s --user mempool:THE_PASSWORD --data-binary '{"jsonrpc":"1.0","id":"t","method":"getblockcount","params":[]}' -H 'content-type: text/plain;' http://10.66.0.2:8332/
nc -zv 10.66.0.2 50001
