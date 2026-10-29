# Section "Admin token, compose file, first start" of https://bitvps.com/guides/self-host-vaultwarden-password-manager
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

mkdir -p /opt/vaultwarden/data && cd /opt/vaultwarden
docker compose up -d
docker compose logs -f   # wait for "Rocket has launched", then Ctrl-C
