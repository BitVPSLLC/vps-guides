# Self-host a mempool.space explorer on a VPS with your own Bitcoin Core and electrs

Files from the guide at https://bitvps.com/guides/self-host-a-bitcoin-mempool-explorer (published 2026-10-23, updated 2026-10-23).

Self-host mempool with Docker Compose on Ubuntu 24.04: real sizing for an archival node with txindex, WireGuard to your Core and electrs, TLS, Tor onion.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-wireguard-between-the-vps-and-your-node.sh`](./02-wireguard-between-the-vps-and-your-node.sh) | WireGuard between the VPS and your node |
| [`03-core-and-electrs-on-the-node-side.sh`](./03-core-and-electrs-on-the-node-side.sh) | Core and electrs on the node side |
| [`04-docker-compose-for-mempool.sh`](./04-docker-compose-for-mempool.sh) | Docker Compose for mempool |
| [`05-docker-compose-for-mempool-2.yml`](./05-docker-compose-for-mempool-2.yml) | Docker Compose for mempool |
| [`06-docker-compose-for-mempool-3.sh`](./06-docker-compose-for-mempool-3.sh) | Docker Compose for mempool |
| [`07-nginx-with-tls-and-a-tor-onion.sh`](./07-nginx-with-tls-and-a-tor-onion.sh) | nginx with TLS and a Tor onion |
| [`08-operate-upgrades-disk-backups-firewall.sh`](./08-operate-upgrades-disk-backups-firewall.sh) | Operate: upgrades, disk, backups, firewall |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
