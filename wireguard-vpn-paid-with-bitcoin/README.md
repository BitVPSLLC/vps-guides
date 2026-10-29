# Set up a personal WireGuard VPN on a VPS paid with Bitcoin

Files from the guide at https://bitvps.com/guides/wireguard-vpn-paid-with-bitcoin (published 2026-10-19, updated 2026-10-19).

Build a personal WireGuard VPN on an Ubuntu 24.04 VPS: keys, wg0.conf with nftables NAT, IP forwarding, client QR code, DNS, and what a VPN does not hide.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-install-wireguard-and-generate-server-keys.sh`](./02-install-wireguard-and-generate-server-keys.sh) | Install WireGuard and generate server keys |
| [`03-enable-ip-forwarding.sh`](./03-enable-ip-forwarding.sh) | Enable IP forwarding |
| [`04-server-configuration-wg0-conf-with-nat.ini`](./04-server-configuration-wg0-conf-with-nat.ini) | Server configuration: wg0.conf with NAT |
| [`05-server-configuration-wg0-conf-with-nat-2.sh`](./05-server-configuration-wg0-conf-with-nat-2.sh) | Server configuration: wg0.conf with NAT |
| [`06-add-a-client-and-generate-its-config-plus-qr-cod.sh`](./06-add-a-client-and-generate-its-config-plus-qr-cod.sh) | Add a client and generate its config plus QR code |
| [`07-dns-do-not-leak-queries-around-the-tunnel.sh`](./07-dns-do-not-leak-queries-around-the-tunnel.sh) | DNS: do not leak queries around the tunnel |
| [`08-verify-and-troubleshoot.sh`](./08-verify-and-troubleshoot.sh) | Verify and troubleshoot |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
