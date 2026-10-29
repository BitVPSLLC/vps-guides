# Self-host a Monero node on a VPS: monerod, pruning, public RPC and Tor

Files from the guide at https://bitvps.com/guides/self-host-a-monero-node (published 2026-10-19, updated 2026-10-19).

Run monerod on an Ubuntu 24.04 VPS: disk sizing, hash verification, systemd unit, pruning, public restricted RPC on 18089, Tor tx-proxy, wallet setup.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-download-and-verify-the-monero-cli.sh`](./02-download-and-verify-the-monero-cli.sh) | Download and verify the Monero CLI |
| [`03-download-and-verify-the-monero-cli-2.sh`](./03-download-and-verify-the-monero-cli-2.sh) | Download and verify the Monero CLI |
| [`04-user-config-file-and-systemd-unit.sh`](./04-user-config-file-and-systemd-unit.sh) | User, config file and systemd unit |
| [`05-user-config-file-and-systemd-unit-2.ini`](./05-user-config-file-and-systemd-unit-2.ini) | User, config file and systemd unit |
| [`06-user-config-file-and-systemd-unit-3.sh`](./06-user-config-file-and-systemd-unit-3.sh) | User, config file and systemd unit |
| [`07-broadcast-transactions-over-tor.sh`](./07-broadcast-transactions-over-tor.sh) | Broadcast transactions over Tor |
| [`08-connect-a-wallet-and-watch-the-sync.sh`](./08-connect-a-wallet-and-watch-the-sync.sh) | Connect a wallet and watch the sync |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
