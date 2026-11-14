# VPS for OpenClaw: run the Gateway around the clock on a server paid in Bitcoin or Monero

Files from the guide at https://bitvps.com/guides/vps-for-openclaw (published 2026-11-14, updated 2026-11-14).

Run the OpenClaw Gateway on a Linux VPS: which plan fits, install as a non-root user, SSH-tunnel the dashboard, Telegram, browser control, backups.

The guide explains what each block does and in what order to run it; this folder only holds the
blocks themselves so you can diff, clone or copy them. Each file is one code block, numbered in
reading order and named after its section.

| File | Section |
|------|---------|
| [`01-prepare-the-server.sh`](./01-prepare-the-server.sh) | Prepare the server |
| [`02-install-openclaw-as-a-non-root-user.sh`](./02-install-openclaw-as-a-non-root-user.sh) | Install OpenClaw as a non-root user |
| [`03-install-openclaw-as-a-non-root-user-2.sh`](./03-install-openclaw-as-a-non-root-user-2.sh) | Install OpenClaw as a non-root user |
| [`04-onboarding-and-the-gateway-service.sh`](./04-onboarding-and-the-gateway-service.sh) | Onboarding and the Gateway service |
| [`05-onboarding-and-the-gateway-service-2.sh`](./05-onboarding-and-the-gateway-service-2.sh) | Onboarding and the Gateway service |
| [`06-reach-the-dashboard-without-opening-a-port.sh`](./06-reach-the-dashboard-without-opening-a-port.sh) | Reach the dashboard without opening a port |
| [`07-connect-telegram.sh`](./07-connect-telegram.sh) | Connect Telegram |
| [`08-browser-control-on-a-headless-server.sh`](./08-browser-control-on-a-headless-server.sh) | Browser control on a headless server |
| [`09-browser-control-on-a-headless-server-2.json`](./09-browser-control-on-a-headless-server-2.json) | Browser control on a headless server |
| [`10-browser-control-on-a-headless-server-3.sh`](./10-browser-control-on-a-headless-server-3.sh) | Browser control on a headless server |
| [`11-backups-and-updates.sh`](./11-backups-and-updates.sh) | Backups and updates |

Found a mistake? Open an issue or a pull request; fixes are applied to the guide and regenerated here.
