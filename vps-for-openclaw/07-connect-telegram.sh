# Section "Connect Telegram" of https://bitvps.com/guides/vps-for-openclaw
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

openclaw channels add --channel telegram --token 'PASTE_BOT_TOKEN'
openclaw channels status --probe

# Send your bot any message in Telegram, then approve that pairing request.
# Codes expire after an hour.
openclaw pairing list telegram
openclaw pairing approve telegram CODE
