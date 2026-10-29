# Run a private Monero remote node and monero-wallet-rpc on a VPS, paid in Monero

Files from the guide at https://bitvps.com/guides/run-a-monero-wallet-rpc-and-remote-node (published 2026-10-23, updated 2026-10-23).

monerod with restricted RPC behind a Tor onion, plus monero-wallet-rpc on a view-only wallet so a shop detects XMR payments without holding the spend key.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-monerod-pruned-restricted-rpc-on-localhost-broad.sh`](./02-monerod-pruned-restricted-rpc-on-localhost-broad.sh) | monerod: pruned, restricted RPC on localhost, broadcasts over Tor |
| [`03-publish-the-restricted-rpc-as-an-onion-and-conne.sh`](./03-publish-the-restricted-rpc-as-an-onion-and-conne.sh) | Publish the restricted RPC as an onion and connect your wallets |
| [`04-monero-wallet-rpc-on-a-view-only-wallet-for-a-sh.sh`](./04-monero-wallet-rpc-on-a-view-only-wallet-for-a-sh.sh) | monero-wallet-rpc on a view-only wallet for a shop |
| [`05-monero-wallet-rpc-on-a-view-only-wallet-for-a-sh-2.sh`](./05-monero-wallet-rpc-on-a-view-only-wallet-for-a-sh-2.sh) | monero-wallet-rpc on a view-only wallet for a shop |
| [`06-operate-sync-upgrades-backups-firewall.sh`](./06-operate-sync-upgrades-backups-firewall.sh) | Operate: sync, upgrades, backups, firewall |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
