# Section "SSH to the server through Tor" of https://bitvps.com/guides/buy-and-manage-a-vps-over-tor
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# One-off, via the system tor daemon on 9050 (use 9150 for Tor Browser):
ssh -o ProxyCommand='nc -X 5 -x 127.0.0.1:9050 %h %p' -i ~/.ssh/anon_server root@YOUR.SERVER.IP

# Permanent, in ~/.ssh/config:
cat >> ~/.ssh/config <<'EOF'
Host anon
    HostName YOUR.SERVER.IP
    User root
    IdentityFile ~/.ssh/anon_server
    IdentitiesOnly yes
    ProxyCommand nc -X 5 -x 127.0.0.1:9050 %h %p
EOF
ssh anon
