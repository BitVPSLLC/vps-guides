# Section "Optional: a vanity address with mkp224o" of https://bitvps.com/guides/host-a-tor-hidden-service
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y git gcc libc6-dev libsodium-dev make autoconf
git clone --depth 1 https://github.com/cathugger/mkp224o
cd mkp224o && ./autogen.sh && ./configure && make
./mkp224o -d keys -n 1 -t $(nproc) mysite      # stops after 1 match

systemctl stop tor
rm -rf /var/lib/tor/onion_site
cp -r keys/mysite*.onion /var/lib/tor/onion_site
chown -R debian-tor:debian-tor /var/lib/tor/onion_site
chmod 700 /var/lib/tor/onion_site
systemctl start tor
cat /var/lib/tor/onion_site/hostname
