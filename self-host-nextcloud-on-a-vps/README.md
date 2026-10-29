# Self-host Nextcloud on a VPS with Docker and pay in Bitcoin or Monero

Files from the guide at https://bitvps.com/guides/self-host-nextcloud-on-a-vps (published 2026-10-23, updated 2026-10-23).

Nextcloud 35 on Ubuntu 24.04: All-in-One behind Caddy or compose with Postgres and Redis, disk sizing by plan, cron, off-box backups, optional Collabora.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-docker-caddy-and-dns.sh`](./02-docker-caddy-and-dns.sh) | Docker, Caddy and DNS |
| [`03-docker-caddy-and-dns-2.sh`](./03-docker-caddy-and-dns-2.sh) | Docker, Caddy and DNS |
| [`04-docker-caddy-and-dns-3.conf`](./04-docker-caddy-and-dns-3.conf) | Docker, Caddy and DNS |
| [`05-docker-caddy-and-dns-4.sh`](./05-docker-caddy-and-dns-4.sh) | Docker, Caddy and DNS |
| [`06-route-a-nextcloud-all-in-one-behind-caddy.sh`](./06-route-a-nextcloud-all-in-one-behind-caddy.sh) | Route A: Nextcloud All-in-One behind Caddy |
| [`07-route-b-docker-compose-with-postgres-and-redis.yml`](./07-route-b-docker-compose-with-postgres-and-redis.yml) | Route B: docker-compose with Postgres and Redis |
| [`08-route-b-docker-compose-with-postgres-and-redis-2.sh`](./08-route-b-docker-compose-with-postgres-and-redis-2.sh) | Route B: docker-compose with Postgres and Redis |
| [`09-backups-built-in-borg-versus-rsync-restic-off-th.sh`](./09-backups-built-in-borg-versus-rsync-restic-off-th.sh) | Backups: built-in Borg versus rsync/restic off the box |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
