# Section "nginx with Let’s Encrypt for wss://, and a Tor onion" of https://bitvps.com/guides/host-a-nostr-relay-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y nginx certbot python3-certbot-nginx
ufw allow 80/tcp && ufw allow 443/tcp

cat > /etc/nginx/sites-available/relay <<'EOF'
server {
    listen 80;
    listen [::]:80;
    server_name relay.example.com;

    location / {
        proxy_pass http://127.0.0.1:7777;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_read_timeout 300s;
        proxy_send_timeout 300s;
    }
}
EOF
ln -s /etc/nginx/sites-available/relay /etc/nginx/sites-enabled/relay
rm -f /etc/nginx/sites-enabled/default
nginx -t && systemctl reload nginx

certbot --nginx -d relay.example.com --agree-tos -m you@example.com --redirect
curl -s -H 'Accept: application/nostr+json' https://relay.example.com/
