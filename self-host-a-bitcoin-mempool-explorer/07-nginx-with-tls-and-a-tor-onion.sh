# Section "nginx with TLS and a Tor onion" of https://bitvps.com/guides/self-host-a-bitcoin-mempool-explorer
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y nginx certbot python3-certbot-nginx tor
ufw allow 80/tcp && ufw allow 443/tcp

cat > /etc/nginx/sites-available/mempool <<'EOF'
server {
    listen 80;
    listen [::]:80;
    server_name mempool.example.com;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_read_timeout 600s;
    }
}
EOF
ln -s /etc/nginx/sites-available/mempool /etc/nginx/sites-enabled/mempool
rm -f /etc/nginx/sites-enabled/default
nginx -t && systemctl reload nginx
certbot --nginx -d mempool.example.com --agree-tos -m you@example.com --redirect

cat >> /etc/tor/torrc <<'EOF'
HiddenServiceDir /var/lib/tor/mempool/
HiddenServiceVersion 3
HiddenServicePort 80 127.0.0.1:8080
EOF
systemctl restart tor
cat /var/lib/tor/mempool/hostname
