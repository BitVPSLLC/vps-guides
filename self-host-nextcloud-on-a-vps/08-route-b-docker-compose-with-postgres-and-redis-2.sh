# Section "Route B: docker-compose with Postgres and Redis" of https://bitvps.com/guides/self-host-nextcloud-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

mkdir -p /opt/nextcloud/data && cd /opt/nextcloud
cat > db.env <<EOF
POSTGRES_DB=nextcloud
POSTGRES_USER=nextcloud
POSTGRES_PASSWORD=$(openssl rand -hex 24)
EOF
chmod 600 db.env
docker compose up -d
docker compose logs -f app    # until "Initializing finished"
