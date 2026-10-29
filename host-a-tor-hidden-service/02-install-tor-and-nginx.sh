# Section "Install tor and nginx" of https://bitvps.com/guides/host-a-tor-hidden-service
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y tor nginx
tor --version
systemctl enable --now tor nginx

# The default nginx site listens on 0.0.0.0:80. Remove it; nothing should listen publicly.
rm -f /etc/nginx/sites-enabled/default
