# Section "monero-wallet-rpc on a view-only wallet for a shop" of https://bitvps.com/guides/run-a-monero-wallet-rpc-and-remote-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

rpc() {
  curl -s --digest -u "shop:$(cat /etc/monero-wallet/rpc-password)" \
    -H 'Content-Type: application/json' http://127.0.0.1:18083/json_rpc -d "$1"
  echo
}

# Is the wallet caught up with the daemon?
rpc '{"jsonrpc":"2.0","id":"0","method":"get_height"}'

# New subaddress for order 1042 (account 0). Returns "address" and "address_index".
rpc '{"jsonrpc":"2.0","id":"0","method":"create_address","params":{"account_index":0,"label":"order-1042"}}'

# Incoming transfers (confirmed and still in the mempool) to that subaddress index.
rpc '{"jsonrpc":"2.0","id":"0","method":"get_transfers","params":{"in":true,"pool":true,"account_index":0,"subaddr_indices":[7]}}'
