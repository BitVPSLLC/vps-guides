# Section "Connect Sparrow and Electrum" of https://bitvps.com/guides/run-an-electrum-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# Electrum, clearnet TLS, pinned to this one server:
electrum --oneserver --server YOUR.SERVER.IP:50002:s

# Electrum over Tor to the onion service (Tor running locally on 9050):
electrum --oneserver --server YOURONIONADDRESS.onion:50001:t --proxy socks5:127.0.0.1:9050
