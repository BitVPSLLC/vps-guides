# Self-host an XMPP server with Prosody on a VPS and pay in Bitcoin or Monero

Files from the guide at https://bitvps.com/guides/self-host-an-xmpp-server-with-prosody (published 2026-10-23, updated 2026-10-23).

Prosody 13 on Ubuntu 24.04: DNS and SRV records, Let’s Encrypt via certbot, OMEMO-ready modules (smacks, carbons, mam, uploads), Tor onion, federation.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-dns-a-aaaa-and-srv-records.sh`](./01-dns-a-aaaa-and-srv-records.sh) | DNS: A, AAAA and SRV records |
| [`02-prepare-the-server.sh`](./02-prepare-the-server.sh) | Prepare the server |
| [`03-install-prosody-13-and-get-certificates.sh`](./03-install-prosody-13-and-get-certificates.sh) | Install Prosody 13 and get certificates |
| [`04-install-prosody-13-and-get-certificates-2.sh`](./04-install-prosody-13-and-get-certificates-2.sh) | Install Prosody 13 and get certificates |
| [`05-configure-prosody-for-omemo-mobile-clients-and-f.sh`](./05-configure-prosody-for-omemo-mobile-clients-and-f.sh) | Configure Prosody for OMEMO, mobile clients and federation |
| [`06-reach-the-server-over-tor-as-well.sh`](./06-reach-the-server-over-tor-as-well.sh) | Reach the server over Tor as well |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
