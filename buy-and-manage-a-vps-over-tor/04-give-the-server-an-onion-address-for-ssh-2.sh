# Section "Give the server an onion address for SSH" of https://bitvps.com/guides/buy-and-manage-a-vps-over-tor
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# On your machine, add a second host entry that uses the onion address:
cat >> ~/.ssh/config <<'EOF'
Host anon-onion
    HostName abc...xyz.onion
    User root
    IdentityFile ~/.ssh/anon_server
    IdentitiesOnly yes
    ProxyCommand nc -X 5 -x 127.0.0.1:9050 %h %p
EOF
ssh anon-onion
