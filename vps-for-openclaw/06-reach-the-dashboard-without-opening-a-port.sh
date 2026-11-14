# Section "Reach the dashboard without opening a port" of https://bitvps.com/guides/vps-for-openclaw
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# Leave this running, then open http://127.0.0.1:18789/ in your browser
# and sign in with the Gateway token from onboarding.
ssh -N -L 18789:127.0.0.1:18789 root@SERVER_IP
