# Run a Lightning node (LND) on a VPS over Tor and pay for it in Bitcoin

Files from the guide at https://bitvps.com/guides/run-a-lightning-node-on-a-vps (published 2026-10-23, updated 2026-10-23).

LND on an Ubuntu 24.04 VPS with a pruned Bitcoin Core backend: sizing, signed-release checks, systemd, Tor-only, channel backups off-box, watchtowers.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-bitcoin-core-pruned-zmq-tor-only.ini`](./02-bitcoin-core-pruned-zmq-tor-only.ini) | Bitcoin Core: pruned, ZMQ, Tor-only |
| [`03-bitcoin-core-pruned-zmq-tor-only-2.sh`](./03-bitcoin-core-pruned-zmq-tor-only-2.sh) | Bitcoin Core: pruned, ZMQ, Tor-only |
| [`04-download-and-verify-lnd.sh`](./04-download-and-verify-lnd.sh) | Download and verify LND |
| [`05-lnd-conf-and-a-systemd-unit.sh`](./05-lnd-conf-and-a-systemd-unit.sh) | lnd.conf and a systemd unit |
| [`06-lnd-conf-and-a-systemd-unit-2.ini`](./06-lnd-conf-and-a-systemd-unit-2.ini) | lnd.conf and a systemd unit |
| [`07-lnd-conf-and-a-systemd-unit-3.ini`](./07-lnd-conf-and-a-systemd-unit-3.ini) | lnd.conf and a systemd unit |
| [`08-lnd-conf-and-a-systemd-unit-4.sh`](./08-lnd-conf-and-a-systemd-unit-4.sh) | lnd.conf and a systemd unit |
| [`09-channel-backups-off-box-and-a-watchtower.sh`](./09-channel-backups-off-box-and-a-watchtower.sh) | Channel backups off-box, and a watchtower |
| [`10-channel-backups-off-box-and-a-watchtower-2.sh`](./10-channel-backups-off-box-and-a-watchtower-2.sh) | Channel backups off-box, and a watchtower |
| [`11-operate-upgrades-monitoring-firewall-and-the-exp.sh`](./11-operate-upgrades-monitoring-firewall-and-the-exp.sh) | Operate: upgrades, monitoring, firewall, and the expiry date |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
