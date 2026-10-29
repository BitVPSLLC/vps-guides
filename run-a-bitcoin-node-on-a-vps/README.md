# Run a Bitcoin node on a VPS (pruned or full) and pay for it in Bitcoin

Files from the guide at https://bitvps.com/guides/run-a-bitcoin-node-on-a-vps (published 2026-10-19, updated 2026-10-19).

Install Bitcoin Core on an Ubuntu 24.04 VPS: disk sizing, signature verification, systemd unit, bitcoin.conf, pruning for 40 GB, Tor, monitoring.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-download-and-verify-bitcoin-core.sh`](./02-download-and-verify-bitcoin-core.sh) | Download and verify Bitcoin Core |
| [`03-download-and-verify-bitcoin-core-2.sh`](./03-download-and-verify-bitcoin-core-2.sh) | Download and verify Bitcoin Core |
| [`04-system-user-bitcoin-conf-and-a-systemd-unit.sh`](./04-system-user-bitcoin-conf-and-a-systemd-unit.sh) | System user, bitcoin.conf and a systemd unit |
| [`05-system-user-bitcoin-conf-and-a-systemd-unit-2.ini`](./05-system-user-bitcoin-conf-and-a-systemd-unit-2.ini) | System user, bitcoin.conf and a systemd unit |
| [`06-system-user-bitcoin-conf-and-a-systemd-unit-3.sh`](./06-system-user-bitcoin-conf-and-a-systemd-unit-3.sh) | System user, bitcoin.conf and a systemd unit |
| [`07-route-the-node-over-tor.sh`](./07-route-the-node-over-tor.sh) | Route the node over Tor |
| [`08-route-the-node-over-tor-2.sh`](./08-route-the-node-over-tor-2.sh) | Route the node over Tor |
| [`09-monitor-and-maintain.sh`](./09-monitor-and-maintain.sh) | Monitor and maintain |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
