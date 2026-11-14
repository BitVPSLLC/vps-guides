# Section "Backups and updates" of https://bitvps.com/guides/vps-for-openclaw
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

openclaw gateway stop
mkdir -p ~/Backups/openclaw
openclaw backup create --output ~/Backups/openclaw --verify
openclaw gateway start
ls -lh ~/Backups/openclaw
