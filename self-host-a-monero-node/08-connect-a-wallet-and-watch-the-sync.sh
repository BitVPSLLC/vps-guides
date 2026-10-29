# Section "Connect a wallet and watch the sync" of https://bitvps.com/guides/self-host-a-monero-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# On the server: height vs target_height tells you how far along sync is.
curl -s http://127.0.0.1:18081/get_info | tr ',' '\n' | grep -E '"(height|target_height|synchronized|incoming_connections_count|outgoing_connections_count)"'

# From your laptop, once synced:
monero-wallet-cli --daemon-address YOUR.SERVER.IP:18089 --wallet-file mywallet
