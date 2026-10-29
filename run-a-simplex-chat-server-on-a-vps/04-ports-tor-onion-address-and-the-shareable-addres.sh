# Section "Ports, Tor onion address and the shareable address" of https://bitvps.com/guides/run-a-simplex-chat-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# /etc/opt/simplex/smp-server.ini
#   [TRANSPORT]  port: 5223          (was 5223,443)
#   [WEB]        https: 443 commented out (the info page would also want 443)
sed -i 's/^port: .*/port: 5223/' /etc/opt/simplex/smp-server.ini
sed -i 's/^https: 443/# https: 443/' /etc/opt/simplex/smp-server.ini
grep -n -E '^(port|https|host):' /etc/opt/simplex/smp-server.ini

ufw allow 5223/tcp comment 'simplex smp'
ufw allow 443/tcp  comment 'simplex xftp'

systemctl enable --now smp-server xftp-server
journalctl -u smp-server -n 20
journalctl -u xftp-server -n 20
