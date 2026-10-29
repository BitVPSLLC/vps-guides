# Section "PostgreSQL and the Synapse package" of https://bitvps.com/guides/host-a-matrix-synapse-homeserver
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

systemctl enable --now matrix-synapse
journalctl -u matrix-synapse -n 30 --no-pager
curl -s http://127.0.0.1:8008/_matrix/client/versions | head -c 200
