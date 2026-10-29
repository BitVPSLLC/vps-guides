# Section "lnd.conf and a systemd unit" of https://bitvps.com/guides/run-a-lightning-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

useradd --system --home-dir /var/lib/lnd --shell /usr/sbin/nologin lnd
install -d -m 0750 -o lnd -g lnd /var/lib/lnd /etc/lnd
usermod -aG bitcoin lnd
usermod -aG debian-tor lnd
