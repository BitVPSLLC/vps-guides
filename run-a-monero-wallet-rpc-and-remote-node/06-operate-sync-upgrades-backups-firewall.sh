# Section "Operate: sync, upgrades, backups, firewall" of https://bitvps.com/guides/run-a-monero-wallet-rpc-and-remote-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

curl -s http://127.0.0.1:18081/get_info | tr ',' '\n' | grep -E '"(height|target_height|synchronized|outgoing_connections_count)"'
systemctl status monerod monero-wallet-rpc --no-pager
tail -n 20 /var/log/monero-wallet/wallet-rpc.log
df -h /var/lib/monero
ufw status      # expect only OpenSSH and 18080/tcp
