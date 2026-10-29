# Section "Docker Compose for mempool" of https://bitvps.com/guides/self-host-a-bitcoin-mempool-explorer
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

docker compose up -d
docker compose logs -f api      # watch it connect to Core and electrs and load the first blocks
curl -s http://127.0.0.1:8080/api/v1/backend-info
curl -s http://127.0.0.1:8080/api/blocks/tip/height
