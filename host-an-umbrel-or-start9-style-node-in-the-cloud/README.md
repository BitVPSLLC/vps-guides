# Host an Umbrel-style node in the cloud: umbrelOS on a VPS, Tor-only access, and the honest storage math

Files from the guide at https://bitvps.com/guides/host-an-umbrel-or-start9-style-node-in-the-cloud (published 2026-10-23, updated 2026-10-23).

umbrelOS on an Ubuntu 24.04 VPS via the community Docker image: Tor-only access, honest sizing (pruned Bitcoin, app-only), and where Start9 fits.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-install-docker-and-start-umbrelos-in-a-container.sh`](./02-install-docker-and-start-umbrelos-in-a-container.sh) | Install Docker and start umbrelOS in a container |
| [`03-install-docker-and-start-umbrelos-in-a-container-2.sh`](./03-install-docker-and-start-umbrelos-in-a-container-2.sh) | Install Docker and start umbrelOS in a container |
| [`04-install-docker-and-start-umbrelos-in-a-container-3.sh`](./04-install-docker-and-start-umbrelos-in-a-container-3.sh) | Install Docker and start umbrelOS in a container |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
