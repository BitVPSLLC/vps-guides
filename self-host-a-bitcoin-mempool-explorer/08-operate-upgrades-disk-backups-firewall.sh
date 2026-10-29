# Section "Operate: upgrades, disk, backups, firewall" of https://bitvps.com/guides/self-host-a-bitcoin-mempool-explorer
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cd /opt/mempool
docker compose ps
docker compose logs --since 1h api | grep -iE 'error|warn'
df -h / && du -sh /opt/mempool/mysql
wg show        # tunnel handshake age; should be under two minutes with keepalive on
