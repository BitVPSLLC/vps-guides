# Section "Admin token, compose file, first start" of https://bitvps.com/guides/self-host-vaultwarden-password-manager
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

caddy validate --config /etc/caddy/Caddyfile
systemctl reload caddy
journalctl -u caddy --since "2 min ago" | grep -i -E 'certificate|error'
