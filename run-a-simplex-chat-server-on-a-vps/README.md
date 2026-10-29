# Run a SimpleX Chat server (SMP and XFTP) on a VPS and pay in Bitcoin or Monero

Files from the guide at https://bitvps.com/guides/run-a-simplex-chat-server-on-a-vps (published 2026-10-23, updated 2026-10-23).

Self-host SimpleX SMP and XFTP relays on Ubuntu 24.04: official install script, server addresses and fingerprints, Tor onion, firewall, smallest plan.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-install-smp-server-and-xftp-server.sh`](./02-install-smp-server-and-xftp-server.sh) | Install smp-server and xftp-server |
| [`03-install-smp-server-and-xftp-server-2.sh`](./03-install-smp-server-and-xftp-server-2.sh) | Install smp-server and xftp-server |
| [`04-ports-tor-onion-address-and-the-shareable-addres.sh`](./04-ports-tor-onion-address-and-the-shareable-addres.sh) | Ports, Tor onion address and the shareable address |
| [`05-ports-tor-onion-address-and-the-shareable-addres-2.sh`](./05-ports-tor-onion-address-and-the-shareable-addres-2.sh) | Ports, Tor onion address and the shareable address |
| [`06-ports-tor-onion-address-and-the-shareable-addres-3.sh`](./06-ports-tor-onion-address-and-the-shareable-addres-3.sh) | Ports, Tor onion address and the shareable address |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
