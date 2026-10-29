# Section "Ports, Tor onion address and the shareable address" of https://bitvps.com/guides/run-a-simplex-chat-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

smp://FINGERPRINT_FROM_/etc/opt/simplex/fingerprint@smp.example.com,abcd...xyz.onion
xftp://FINGERPRINT_FROM_/etc/opt/simplex-xftp/fingerprint@xftp.example.com,efgh...uvw.onion

# If you initialised smp-server with --password, it goes after the fingerprint:
# smp://FINGERPRINT:PASSWORD@smp.example.com,....onion
