# Section "Reach the server over Tor as well" of https://bitvps.com/guides/self-host-an-xmpp-server-with-prosody
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y tor
cat >> /etc/tor/torrc <<'EOF'
HiddenServiceDir /var/lib/tor/xmpp/
HiddenServicePort 5222 127.0.0.1:5222
HiddenServicePort 5223 127.0.0.1:5223
HiddenServicePort 5269 127.0.0.1:5269
EOF
systemctl restart tor && sleep 5 && cat /var/lib/tor/xmpp/hostname
