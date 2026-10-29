# Run a Tor middle relay or obfs4 bridge on a VPS (no exit) and pay in Bitcoin

Files from the guide at https://bitvps.com/guides/run-a-tor-relay-or-bridge-on-a-vps (published 2026-10-23, updated 2026-10-23).

Set up a Tor non-exit relay or obfs4 bridge on Ubuntu 24.04 from the Tor Project repo: torrc, bandwidth caps within 20 TB, families, Snowflake.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-install-tor-from-the-tor-project-repository.sh`](./02-install-tor-from-the-tor-project-repository.sh) | Install Tor from the Tor Project repository |
| [`03-middle-relay-torrc-with-bandwidth-caps.sh`](./03-middle-relay-torrc-with-bandwidth-caps.sh) | Middle relay: torrc with bandwidth caps |
| [`04-obfs4-bridge-torrc-and-the-bridge-line.sh`](./04-obfs4-bridge-torrc-and-the-bridge-line.sh) | obfs4 bridge: torrc and the bridge line |
| [`05-snowflake-standalone-proxy-the-low-effort-altern.sh`](./05-snowflake-standalone-proxy-the-low-effort-altern.sh) | Snowflake standalone proxy, the low-effort alternative |
| [`06-operate-relay-search-families-keys-updates.sh`](./06-operate-relay-search-families-keys-updates.sh) | Operate: relay search, families, keys, updates |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
