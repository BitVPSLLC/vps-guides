# Section "Install Docker and start umbrelOS in a container" of https://bitvps.com/guides/host-an-umbrel-or-start9-style-node-in-the-cloud
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cat > /etc/docker/daemon.json <<'EOF'
{
  "ip": "127.0.0.1",
  "log-driver": "journald"
}
EOF
systemctl restart docker

mkdir -p /opt/umbrel && cd /opt/umbrel
cat > compose.yaml <<'EOF'
services:
  umbrel:
    image: dockurr/umbrel
    container_name: umbrel
    pid: host
    privileged: true
    ports:
      - "127.0.0.1:80:80"
      - "127.0.0.1:443:443"
      - "127.0.0.1:2000:2000"
    volumes:
      - ./umbrel:/data
      - /var/run/docker.sock:/var/run/docker.sock
    restart: always
    stop_grace_period: 1m
EOF
docker compose up -d
docker compose logs -f    # first start takes a few minutes; Ctrl-C when it settles
