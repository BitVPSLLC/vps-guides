# Section "DNS: A, AAAA and SRV records" of https://bitvps.com/guides/self-host-an-xmpp-server-with-prosody
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

xmpp.example.com.                 A     YOUR.IPV4
xmpp.example.com.                 AAAA  YOUR:IPV6
conference.example.com.           CNAME xmpp.example.com.
upload.example.com.               CNAME xmpp.example.com.

_xmpp-client._tcp.example.com.    SRV   0 5 5222 xmpp.example.com.
_xmpps-client._tcp.example.com.   SRV   0 5 5223 xmpp.example.com.
_xmpp-server._tcp.example.com.    SRV   0 5 5269 xmpp.example.com.
_xmpp-server._tcp.conference.example.com.  SRV 0 5 5269 xmpp.example.com.
