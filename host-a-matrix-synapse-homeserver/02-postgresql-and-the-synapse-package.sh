# Section "PostgreSQL and the Synapse package" of https://bitvps.com/guides/host-a-matrix-synapse-homeserver
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y postgresql
sudo -u postgres psql <<'EOF'
CREATE USER synapse_user WITH PASSWORD 'CHANGE_ME_LONG_RANDOM';
CREATE DATABASE synapse
  ENCODING 'UTF8' LC_COLLATE='C' LC_CTYPE='C'
  TEMPLATE=template0 OWNER synapse_user;
EOF
