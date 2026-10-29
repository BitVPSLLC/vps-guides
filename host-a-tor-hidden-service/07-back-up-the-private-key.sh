# Section "Back up the private key" of https://bitvps.com/guides/host-a-tor-hidden-service
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# On the server:
tar czf - -C /var/lib/tor onion_site | gpg --symmetric --cipher-algo AES256 -o /root/onion_site.tgz.gpg

# From your own machine:
scp root@YOUR.SERVER.IP:/root/onion_site.tgz.gpg ~/backups/
ssh root@YOUR.SERVER.IP shred -u /root/onion_site.tgz.gpg

# Restoring on a new server, after installing tor:
gpg -d onion_site.tgz.gpg | tar xzf - -C /var/lib/tor
chown -R debian-tor:debian-tor /var/lib/tor/onion_site
chmod 700 /var/lib/tor/onion_site
systemctl restart tor
