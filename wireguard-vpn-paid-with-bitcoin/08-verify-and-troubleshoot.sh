# Section "Verify and troubleshoot" of https://bitvps.com/guides/wireguard-vpn-paid-with-bitcoin
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

wg show                                   # latest handshake and transfer per peer
nft list table inet wg                    # masquerade rule present
sysctl net.ipv4.ip_forward                # = 1
journalctl -u wg-quick@wg0 --no-pager | tail -20
