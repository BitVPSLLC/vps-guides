# Host a Tor hidden service (v3 onion) with nginx on a VPS

Files from the guide at https://bitvps.com/guides/host-a-tor-hidden-service (published 2026-10-19, updated 2026-10-19).

Set up a v3 onion site on Ubuntu 24.04: tor + nginx, torrc HiddenServiceDir/Port, localhost-only nginx, Onion-Location, key backup, vanity, DoS defenses.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-install-tor-and-nginx.sh`](./02-install-tor-and-nginx.sh) | Install tor and nginx |
| [`03-configure-nginx-on-localhost-only.conf`](./03-configure-nginx-on-localhost-only.conf) | Configure nginx on localhost only |
| [`04-configure-nginx-on-localhost-only-2.sh`](./04-configure-nginx-on-localhost-only-2.sh) | Configure nginx on localhost only |
| [`05-create-the-hidden-service-in-torrc.sh`](./05-create-the-hidden-service-in-torrc.sh) | Create the hidden service in torrc |
| [`06-advertise-it-with-onion-location.conf`](./06-advertise-it-with-onion-location.conf) | Advertise it with Onion-Location |
| [`07-back-up-the-private-key.sh`](./07-back-up-the-private-key.sh) | Back up the private key |
| [`08-optional-a-vanity-address-with-mkp224o.sh`](./08-optional-a-vanity-address-with-mkp224o.sh) | Optional: a vanity address with mkp224o |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
