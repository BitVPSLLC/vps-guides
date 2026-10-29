# BitVPS guides: scripts and config files

The command blocks and configuration files from the self-hosting guides at https://bitvps.com/guides, one folder
per guide. The guides explain the why and the order; this repository holds the what, so you can clone,
diff and copy instead of selecting text in a browser.

Everything targets a fresh Ubuntu 24.04 server with a root shell. Files are numbered in the order they
appear in the guide and named after their section. They are not turnkey installers: read the matching
section first and replace example hostnames, IPs, keys and passwords with your own.

## Guides

| Folder | Guide | Files |
|--------|-------|-------|
| [`run-a-bitcoin-node-on-a-vps`](./run-a-bitcoin-node-on-a-vps) | [Run a Bitcoin node on a VPS (pruned or full) and pay for it in Bitcoin](https://bitvps.com/guides/run-a-bitcoin-node-on-a-vps) | 9 |
| [`self-host-a-monero-node`](./self-host-a-monero-node) | [Self-host a Monero node on a VPS: monerod, pruning, public RPC and Tor](https://bitvps.com/guides/self-host-a-monero-node) | 8 |
| [`host-a-tor-hidden-service`](./host-a-tor-hidden-service) | [Host a Tor hidden service (v3 onion) with nginx on a VPS](https://bitvps.com/guides/host-a-tor-hidden-service) | 8 |
| [`wireguard-vpn-paid-with-bitcoin`](./wireguard-vpn-paid-with-bitcoin) | [Set up a personal WireGuard VPN on a VPS paid with Bitcoin](https://bitvps.com/guides/wireguard-vpn-paid-with-bitcoin) | 8 |
| [`buy-and-manage-a-vps-over-tor`](./buy-and-manage-a-vps-over-tor) | [Buy and manage a VPS entirely over Tor: onion checkout, SSH through Tor, and an onion address for SSH](https://bitvps.com/guides/buy-and-manage-a-vps-over-tor) | 6 |
| [`run-a-lightning-node-on-a-vps`](./run-a-lightning-node-on-a-vps) | [Run a Lightning node (LND) on a VPS over Tor and pay for it in Bitcoin](https://bitvps.com/guides/run-a-lightning-node-on-a-vps) | 11 |
| [`run-an-electrum-server-on-a-vps`](./run-an-electrum-server-on-a-vps) | [Run your own Electrum server (electrs or Fulcrum) on a VPS and pay in Bitcoin](https://bitvps.com/guides/run-an-electrum-server-on-a-vps) | 8 |
| [`host-a-nostr-relay-on-a-vps`](./host-a-nostr-relay-on-a-vps) | [Host a Nostr relay with strfry on a VPS and pay in Bitcoin or Monero](https://bitvps.com/guides/host-a-nostr-relay-on-a-vps) | 7 |
| [`run-a-tor-relay-or-bridge-on-a-vps`](./run-a-tor-relay-or-bridge-on-a-vps) | [Run a Tor middle relay or obfs4 bridge on a VPS (no exit) and pay in Bitcoin](https://bitvps.com/guides/run-a-tor-relay-or-bridge-on-a-vps) | 6 |
| [`run-a-monero-wallet-rpc-and-remote-node`](./run-a-monero-wallet-rpc-and-remote-node) | [Run a private Monero remote node and monero-wallet-rpc on a VPS, paid in Monero](https://bitvps.com/guides/run-a-monero-wallet-rpc-and-remote-node) | 6 |
| [`self-host-a-bitcoin-mempool-explorer`](./self-host-a-bitcoin-mempool-explorer) | [Self-host a mempool.space explorer on a VPS with your own Bitcoin Core and electrs](https://bitvps.com/guides/self-host-a-bitcoin-mempool-explorer) | 8 |
| [`self-host-vaultwarden-password-manager`](./self-host-vaultwarden-password-manager) | [Self-host Vaultwarden (Bitwarden-compatible) on a VPS and pay in Bitcoin or Monero](https://bitvps.com/guides/self-host-vaultwarden-password-manager) | 10 |
| [`self-host-nextcloud-on-a-vps`](./self-host-nextcloud-on-a-vps) | [Self-host Nextcloud on a VPS with Docker and pay in Bitcoin or Monero](https://bitvps.com/guides/self-host-nextcloud-on-a-vps) | 9 |
| [`run-a-simplex-chat-server-on-a-vps`](./run-a-simplex-chat-server-on-a-vps) | [Run a SimpleX Chat server (SMP and XFTP) on a VPS and pay in Bitcoin or Monero](https://bitvps.com/guides/run-a-simplex-chat-server-on-a-vps) | 6 |
| [`self-host-an-xmpp-server-with-prosody`](./self-host-an-xmpp-server-with-prosody) | [Self-host an XMPP server with Prosody on a VPS and pay in Bitcoin or Monero](https://bitvps.com/guides/self-host-an-xmpp-server-with-prosody) | 6 |
| [`host-a-matrix-synapse-homeserver`](./host-a-matrix-synapse-homeserver) | [Host a Matrix Synapse homeserver on a VPS and pay in Bitcoin or Monero](https://bitvps.com/guides/host-a-matrix-synapse-homeserver) | 8 |
| [`host-an-umbrel-or-start9-style-node-in-the-cloud`](./host-an-umbrel-or-start9-style-node-in-the-cloud) | [Host an Umbrel-style node in the cloud: umbrelOS on a VPS, Tor-only access, and the honest storage math](https://bitvps.com/guides/host-an-umbrel-or-start9-style-node-in-the-cloud) | 4 |

## Regeneration

This tree is generated from the guide source, so edits here are overwritten on the next sync. Report
problems as issues or pull requests and the fix is applied to the guide, then regenerated.

## About

[BitVPS](https://bitvps.com) sells Linux KVM servers that you pay for by the day with Bitcoin, Monero, Ethereum,
Solana or a card. No account, no KYC: root access arrives by a magic link sent to your email. Plans:
https://bitvps.com/configure. Only bitvps.com and the onion address listed at https://bitvps.com/official-sites are ours.

License: MIT (see [LICENSE](./LICENSE)).
