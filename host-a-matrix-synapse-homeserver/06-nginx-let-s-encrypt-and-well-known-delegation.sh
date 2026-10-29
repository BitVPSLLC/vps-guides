# Section "nginx, Let’s Encrypt and .well-known delegation" of https://bitvps.com/guides/host-a-matrix-synapse-homeserver
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y nginx certbot python3-certbot-nginx
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 8448/tcp   # only needed if some remote server ignores .well-known; harmless to open

cat > /etc/nginx/sites-available/matrix <<'EOF'
server {
    listen 80;
    listen [::]:80;
    server_name matrix.example.com example.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    listen 8448 ssl http2 default_server;
    listen [::]:8448 ssl http2 default_server;
    server_name matrix.example.com;

    ssl_certificate     /etc/letsencrypt/live/matrix.example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/matrix.example.com/privkey.pem;

    # Only the client and federation APIs. Never proxy /_synapse/admin to the internet.
    location ~ ^(/_matrix|/_synapse/client) {
        proxy_pass http://127.0.0.1:8008;     # no trailing slash: nginx must not rewrite the URI
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Host $host:$server_port;
        proxy_http_version 1.1;
        client_max_body_size 50M;             # match max_upload_size
    }
}

# Delegation files on the bare domain (skip this block if example.com lives elsewhere).
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name example.com;
    ssl_certificate     /etc/letsencrypt/live/matrix.example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/matrix.example.com/privkey.pem;

    location = /.well-known/matrix/server {
        default_type application/json;
        return 200 '{"m.server": "matrix.example.com:443"}';
    }
    location = /.well-known/matrix/client {
        default_type application/json;
        add_header Access-Control-Allow-Origin *;
        return 200 '{"m.homeserver": {"base_url": "https://matrix.example.com"}}';
    }
}
EOF
ln -sf /etc/nginx/sites-available/matrix /etc/nginx/sites-enabled/matrix
rm -f /etc/nginx/sites-enabled/default

# Get the certificate first with the sites disabled, then enable and reload.
systemctl stop nginx
certbot certonly --standalone --agree-tos --no-eff-email -m you@example.com -d matrix.example.com -d example.com
nginx -t && systemctl start nginx
