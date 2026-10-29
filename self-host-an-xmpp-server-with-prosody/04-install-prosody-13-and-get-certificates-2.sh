# Section "Install Prosody 13 and get certificates" of https://bitvps.com/guides/self-host-an-xmpp-server-with-prosody
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

ufw allow 80/tcp comment 'certbot http-01'
certbot certonly --standalone --agree-tos --no-eff-email -m you@example.com \
  -d example.com -d xmpp.example.com -d conference.example.com -d upload.example.com

cat > /etc/letsencrypt/renewal-hooks/deploy/prosody.sh <<'EOF'
#!/bin/sh
/usr/bin/prosodyctl --root cert import /etc/letsencrypt/live
EOF
chmod +x /etc/letsencrypt/renewal-hooks/deploy/prosody.sh
/etc/letsencrypt/renewal-hooks/deploy/prosody.sh
ls /etc/prosody/certs/
