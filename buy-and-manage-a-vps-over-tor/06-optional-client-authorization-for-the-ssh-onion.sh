# Section "Optional: client authorization for the SSH onion" of https://bitvps.com/guides/buy-and-manage-a-vps-over-tor
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# On your machine (openssl plus the coreutils base32 tool):
openssl genpkey -algorithm x25519 -out client.key.pem
PRIV=$(openssl pkey -in client.key.pem -outform DER | tail -c 32 | base32 | tr -d '=')
PUB=$(openssl pkey -in client.key.pem -pubout -outform DER | tail -c 32 | base32 | tr -d '=')
echo "descriptor:x25519:$PUB"      # goes on the server
echo "ONIONADDR_WITHOUT_SUFFIX:descriptor:x25519:$PRIV"   # goes in your local tor

# On the server:
install -d -m 0700 -o debian-tor -g debian-tor /var/lib/tor/ssh/authorized_clients
echo "descriptor:x25519:$PUB" > /var/lib/tor/ssh/authorized_clients/laptop.auth
chown debian-tor:debian-tor /var/lib/tor/ssh/authorized_clients/laptop.auth
systemctl reload tor

# On your machine, in /etc/tor/torrc:
#   ClientOnionAuthDir /var/lib/tor/onion_auth
# then write ONIONADDR_WITHOUT_SUFFIX:descriptor:x25519:$PRIV into
# /var/lib/tor/onion_auth/anon.auth_private and restart tor.
