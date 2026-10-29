# Section "Operate: relay search, families, keys, updates" of https://bitvps.com/guides/run-a-tor-relay-or-bridge-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cat /var/lib/tor/fingerprint
sudo -u debian-tor nyx
tar czf /root/tor-keys-$(date +%F).tgz -C /var/lib/tor keys fingerprint    # copy this off the server
apt update && apt upgrade -y    # the Tor repository delivers new releases through apt
