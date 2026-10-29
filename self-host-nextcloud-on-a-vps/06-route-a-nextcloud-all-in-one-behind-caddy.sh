# Section "Route A: Nextcloud All-in-One behind Caddy" of https://bitvps.com/guides/self-host-nextcloud-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

docker run \
  --init \
  --sig-proxy=false \
  --name nextcloud-aio-mastercontainer \
  --restart always \
  --publish 127.0.0.1:8080:8080 \
  --env APACHE_PORT=11000 \
  --env APACHE_IP_BINDING=127.0.0.1 \
  --env APACHE_ADDITIONAL_NETWORK="" \
  --env SKIP_DOMAIN_VALIDATION=false \
  --volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  ghcr.io/nextcloud-releases/all-in-one:latest

# On your own machine, open a tunnel to the AIO interface:
ssh -L 8080:127.0.0.1:8080 root@YOUR.SERVER.IP
# then browse to https://localhost:8080 (self-signed certificate; accept it)
