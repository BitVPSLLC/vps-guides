# Self-host Vaultwarden (Bitwarden-compatible) on a VPS and pay in Bitcoin or Monero

Files from the guide at https://bitvps.com/guides/self-host-vaultwarden-password-manager (published 2026-10-23, updated 2026-10-23).

Vaultwarden on an Ubuntu 24.04 VPS with Docker and Caddy: Argon2 admin token, Let’s Encrypt, fail2ban, SQLite backups off-box, and which small plan fits.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-install-docker-and-caddy.sh`](./02-install-docker-and-caddy.sh) | Install Docker and Caddy |
| [`03-install-docker-and-caddy-2.sh`](./03-install-docker-and-caddy-2.sh) | Install Docker and Caddy |
| [`04-admin-token-compose-file-first-start.sh`](./04-admin-token-compose-file-first-start.sh) | Admin token, compose file, first start |
| [`05-admin-token-compose-file-first-start-2.yml`](./05-admin-token-compose-file-first-start-2.yml) | Admin token, compose file, first start |
| [`06-admin-token-compose-file-first-start-3.sh`](./06-admin-token-compose-file-first-start-3.sh) | Admin token, compose file, first start |
| [`07-admin-token-compose-file-first-start-4.conf`](./07-admin-token-compose-file-first-start-4.conf) | Admin token, compose file, first start |
| [`08-admin-token-compose-file-first-start-5.sh`](./08-admin-token-compose-file-first-start-5.sh) | Admin token, compose file, first start |
| [`09-fail2ban-for-the-web-vault-and-the-admin-page.sh`](./09-fail2ban-for-the-web-vault-and-the-admin-page.sh) | fail2ban for the web vault and the admin page |
| [`10-backups-the-database-the-keys-and-the-attachment.sh`](./10-backups-the-database-the-keys-and-the-attachment.sh) | Backups: the database, the keys and the attachments |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
