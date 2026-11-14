# Section "Onboarding and the Gateway service" of https://bitvps.com/guides/vps-for-openclaw
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

openclaw onboard --install-daemon

# Check it is up and stays up.
openclaw status
openclaw doctor
systemctl --user status openclaw-gateway.service
journalctl --user -u openclaw-gateway.service -f   # Ctrl-C to leave
