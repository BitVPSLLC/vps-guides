# Section "TLS with nginx and a Tor onion service" of https://bitvps.com/guides/run-an-electrum-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y nginx libnginx-mod-stream tor
install -d -m 0750 -o root -g root /etc/nginx/certs
openssl req -x509 -newkey ec -pkeyopt ec_paramgen_curve:prime256v1 -nodes -days 3650 \
  -subj "/CN=electrs" -keyout /etc/nginx/certs/electrs.key -out /etc/nginx/certs/electrs.crt

cat > /etc/nginx/modules-enabled/60-electrs-stream.conf <<'EOF'
stream {
  upstream electrs { server 127.0.0.1:50001; }
  server {
    listen 50002 ssl;
    listen [::]:50002 ssl;
    proxy_pass electrs;
    ssl_certificate     /etc/nginx/certs/electrs.crt;
    ssl_certificate_key /etc/nginx/certs/electrs.key;
    ssl_protocols TLSv1.2 TLSv1.3;
  }
}
EOF
nginx -t && systemctl reload nginx

cat >> /etc/tor/torrc <<'EOF'
HiddenServiceDir /var/lib/tor/electrs/
HiddenServiceVersion 3
HiddenServicePort 50001 127.0.0.1:50001
EOF
systemctl restart tor
cat /var/lib/tor/electrs/hostname

# Clearnet TLS port: open it only to the addresses that will use it.
ufw allow from YOUR.HOME.IP.ADDR to any port 50002 proto tcp
