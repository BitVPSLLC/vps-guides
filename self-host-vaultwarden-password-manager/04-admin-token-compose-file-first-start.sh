# Section "Admin token, compose file, first start" of https://bitvps.com/guides/self-host-vaultwarden-password-manager
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

docker run --rm -it vaultwarden/server:1.37.4 /vaultwarden hash --preset owasp
# Asks for a password twice, then prints a line like:
# ADMIN_TOKEN='$argon2id$v=19$m=19456,t=2,p=1$....$....'
# Copy everything inside the quotes.
