# Host a Nostr relay with strfry on a VPS and pay in Bitcoin or Monero

Files from the guide at https://bitvps.com/guides/host-a-nostr-relay-on-a-vps (published 2026-10-23, updated 2026-10-23).

Run a strfry Nostr relay on Ubuntu 24.04: build from source, systemd, nginx with Let’s Encrypt websockets, allowlist write policy, Tor onion, moderation.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-build-strfry-from-source.sh`](./02-build-strfry-from-source.sh) | Build strfry from source |
| [`03-configure-strfry-and-run-it-under-systemd.sh`](./03-configure-strfry-and-run-it-under-systemd.sh) | Configure strfry and run it under systemd |
| [`04-nginx-with-let-s-encrypt-for-wss-and-a-tor-onion.sh`](./04-nginx-with-let-s-encrypt-for-wss-and-a-tor-onion.sh) | nginx with Let’s Encrypt for wss://, and a Tor onion |
| [`05-nginx-with-let-s-encrypt-for-wss-and-a-tor-onion-2.sh`](./05-nginx-with-let-s-encrypt-for-wss-and-a-tor-onion-2.sh) | nginx with Let’s Encrypt for wss://, and a Tor onion |
| [`06-write-policy-an-allowlist-plugin.sh`](./06-write-policy-an-allowlist-plugin.sh) | Write policy: an allowlist plugin |
| [`07-moderation-the-acceptable-use-policy-and-day-to-.sh`](./07-moderation-the-acceptable-use-policy-and-day-to-.sh) | Moderation, the acceptable use policy, and day-to-day operation |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
