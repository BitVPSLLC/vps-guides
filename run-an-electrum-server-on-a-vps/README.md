# Run your own Electrum server (electrs or Fulcrum) on a VPS and pay in Bitcoin

Files from the guide at https://bitvps.com/guides/run-an-electrum-server-on-a-vps (published 2026-10-23, updated 2026-10-23).

Private Electrum server for Sparrow and Electrum on a VPS: honest disk sizing for an unpruned chain, electrs 0.12 build, Fulcrum option, TLS, Tor onion.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-bitcoin-core-unpruned-with-the-rest-interface-on.ini`](./02-bitcoin-core-unpruned-with-the-rest-interface-on.ini) | Bitcoin Core: unpruned, with the REST interface on |
| [`03-bitcoin-core-unpruned-with-the-rest-interface-on-2.sh`](./03-bitcoin-core-unpruned-with-the-rest-interface-on-2.sh) | Bitcoin Core: unpruned, with the REST interface on |
| [`04-build-and-run-electrs.sh`](./04-build-and-run-electrs.sh) | Build and run electrs |
| [`05-build-and-run-electrs-2.sh`](./05-build-and-run-electrs-2.sh) | Build and run electrs |
| [`06-tls-with-nginx-and-a-tor-onion-service.sh`](./06-tls-with-nginx-and-a-tor-onion-service.sh) | TLS with nginx and a Tor onion service |
| [`07-connect-sparrow-and-electrum.sh`](./07-connect-sparrow-and-electrum.sh) | Connect Sparrow and Electrum |
| [`08-operate-disk-upgrades-backups.sh`](./08-operate-disk-upgrades-backups.sh) | Operate: disk, upgrades, backups |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
