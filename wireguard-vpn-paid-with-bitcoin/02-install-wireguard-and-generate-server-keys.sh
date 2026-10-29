# Section "Install WireGuard and generate server keys" of https://bitvps.com/guides/wireguard-vpn-paid-with-bitcoin
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y wireguard qrencode

# Find the public interface name (eth0 on most of our images).
ip route get 1.1.1.1 | awk '{print $5; exit}'

umask 077
wg genkey | tee /etc/wireguard/server.key | wg pubkey > /etc/wireguard/server.pub
cat /etc/wireguard/server.pub
