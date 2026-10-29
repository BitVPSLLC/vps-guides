# Section "nginx, Let’s Encrypt and .well-known delegation" of https://bitvps.com/guides/host-a-matrix-synapse-homeserver
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# Create the first (admin) user. Uses registration_shared_secret from homeserver.yaml.
register_new_matrix_user -c /etc/matrix-synapse/homeserver.yaml http://127.0.0.1:8008
# New user localpart: you
# Password:
# Make admin [no]: yes
