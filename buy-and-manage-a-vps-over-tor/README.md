# Buy and manage a VPS entirely over Tor: onion checkout, SSH through Tor, and an onion address for SSH

Files from the guide at https://bitvps.com/guides/buy-and-manage-a-vps-over-tor (published 2026-10-22, updated 2026-10-22).

Order from the onion mirror, get the access link, SSH through Tor with ProxyCommand, give the server its own .onion for SSH, and close the clearnet port.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-ssh-to-the-server-through-tor.sh`](./01-ssh-to-the-server-through-tor.sh) | SSH to the server through Tor |
| [`02-ssh-to-the-server-through-tor-2.sh`](./02-ssh-to-the-server-through-tor-2.sh) | SSH to the server through Tor |
| [`03-give-the-server-an-onion-address-for-ssh.sh`](./03-give-the-server-an-onion-address-for-ssh.sh) | Give the server an onion address for SSH |
| [`04-give-the-server-an-onion-address-for-ssh-2.sh`](./04-give-the-server-an-onion-address-for-ssh-2.sh) | Give the server an onion address for SSH |
| [`05-give-the-server-an-onion-address-for-ssh-3.sh`](./05-give-the-server-an-onion-address-for-ssh-3.sh) | Give the server an onion address for SSH |
| [`06-optional-client-authorization-for-the-ssh-onion.sh`](./06-optional-client-authorization-for-the-ssh-onion.sh) | Optional: client authorization for the SSH onion |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
