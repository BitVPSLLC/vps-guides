# Section "Snowflake standalone proxy, the low-effort alternative" of https://bitvps.com/guides/run-a-tor-relay-or-bridge-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y snowflake-proxy
systemctl enable --now snowflake-proxy
journalctl -u snowflake-proxy -f      # "Proxy starting" and then periodic connection counts
