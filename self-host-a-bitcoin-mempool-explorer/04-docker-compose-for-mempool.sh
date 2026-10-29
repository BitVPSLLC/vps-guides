# Section "Docker Compose for mempool" of https://bitvps.com/guides/self-host-a-bitcoin-mempool-explorer
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y docker.io docker-compose-v2
mkdir -p /opt/mempool/data /opt/mempool/mysql/data
chown -R 1000:1000 /opt/mempool/data /opt/mempool/mysql
cd /opt/mempool
