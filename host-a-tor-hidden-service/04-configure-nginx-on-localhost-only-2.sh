# Section "Configure nginx on localhost only" of https://bitvps.com/guides/host-a-tor-hidden-service
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

install -d -m 0755 /var/www/onion
echo '<h1>It works over Tor.</h1>' > /var/www/onion/index.html
ln -s /etc/nginx/sites-available/onion /etc/nginx/sites-enabled/onion
nginx -t && systemctl reload nginx
ss -ltnp | grep nginx     # must show 127.0.0.1:8080 only
