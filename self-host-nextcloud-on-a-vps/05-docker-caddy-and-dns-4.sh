# Section "Docker, Caddy and DNS" of https://bitvps.com/guides/self-host-nextcloud-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

caddy validate --config /etc/caddy/Caddyfile && systemctl reload caddy
