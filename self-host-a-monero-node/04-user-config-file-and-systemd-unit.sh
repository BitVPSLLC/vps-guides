# Section "User, config file and systemd unit" of https://bitvps.com/guides/self-host-a-monero-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

useradd --system --home-dir /var/lib/monero --shell /usr/sbin/nologin monero
install -d -m 0750 -o monero -g monero /var/lib/monero /var/log/monero
install -d -m 0750 -o monero -g monero /etc/monero

cat > /etc/monero/monerod.conf <<'EOF'
data-dir=/var/lib/monero
log-file=/var/log/monero/monerod.log
log-level=0
max-log-files=5

# Storage
prune-blockchain=1
sync-pruned-blocks=1

# P2P
p2p-bind-ip=0.0.0.0
p2p-bind-port=18080
no-igd=1
out-peers=32
in-peers=64
limit-rate-up=4096      # kB/s
limit-rate-down=16384   # kB/s

# Unrestricted RPC: localhost only, for you.
rpc-bind-ip=127.0.0.1
rpc-bind-port=18081

# Restricted RPC: safe to expose. Wallets connect here.
rpc-restricted-bind-ip=0.0.0.0
rpc-restricted-bind-port=18089
public-node=1

no-zmq=1
EOF
chown monero:monero /etc/monero/monerod.conf
