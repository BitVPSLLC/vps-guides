# Section "lnd.conf and a systemd unit" of https://bitvps.com/guides/run-a-lightning-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

chown -R lnd:lnd /etc/lnd
systemctl daemon-reload
systemctl enable --now lnd
journalctl -u lnd -f        # wait for "Waiting for wallet encryption password"

# In a second shell: create the wallet. Write the 24 words down, offline.
sudo -u lnd lncli --lnddir=/var/lib/lnd create

# Then store the wallet password so lnd unlocks itself after a reboot.
printf '%s' 'YOUR-WALLET-PASSWORD' > /etc/lnd/password.txt
chown lnd:lnd /etc/lnd/password.txt && chmod 0400 /etc/lnd/password.txt
