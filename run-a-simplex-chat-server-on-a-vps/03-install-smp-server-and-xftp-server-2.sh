# Section "Install smp-server and xftp-server" of https://bitvps.com/guides/run-a-simplex-chat-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

su smp -c 'smp-server init --yes \
  --store-log \
  --no-password \
  --control-port \
  --socks-proxy \
  --source-code \
  --fqdn=smp.example.com'

su xftp -c 'xftp-server init --store-log \
  --fqdn=xftp.example.com \
  --quota 20gb \
  --path /srv/xftp/'

cat /etc/opt/simplex/fingerprint
cat /etc/opt/simplex-xftp/fingerprint
