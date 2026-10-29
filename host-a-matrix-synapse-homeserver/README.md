# Host a Matrix Synapse homeserver on a VPS and pay in Bitcoin or Monero

Files from the guide at https://bitvps.com/guides/host-a-matrix-synapse-homeserver (published 2026-10-23, updated 2026-10-23).

Synapse on Ubuntu 24.04 via the matrix.org apt repo or Docker: Postgres, nginx and Let’s Encrypt, .well-known delegation, 4 GB RAM sizing, disk growth.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-postgresql-and-the-synapse-package.sh`](./02-postgresql-and-the-synapse-package.sh) | PostgreSQL and the Synapse package |
| [`03-postgresql-and-the-synapse-package-2.sh`](./03-postgresql-and-the-synapse-package-2.sh) | PostgreSQL and the Synapse package |
| [`04-postgresql-and-the-synapse-package-3.yml`](./04-postgresql-and-the-synapse-package-3.yml) | PostgreSQL and the Synapse package |
| [`05-postgresql-and-the-synapse-package-4.sh`](./05-postgresql-and-the-synapse-package-4.sh) | PostgreSQL and the Synapse package |
| [`06-nginx-let-s-encrypt-and-well-known-delegation.sh`](./06-nginx-let-s-encrypt-and-well-known-delegation.sh) | nginx, Let’s Encrypt and .well-known delegation |
| [`07-nginx-let-s-encrypt-and-well-known-delegation-2.sh`](./07-nginx-let-s-encrypt-and-well-known-delegation-2.sh) | nginx, Let’s Encrypt and .well-known delegation |
| [`08-optional-element-web-on-its-own-hostname.sh`](./08-optional-element-web-on-its-own-hostname.sh) | Optional: Element Web on its own hostname |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
