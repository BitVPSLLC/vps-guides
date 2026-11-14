# Section "Install OpenClaw as a non-root user" of https://bitvps.com/guides/vps-for-openclaw
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# Node 24 LTS from NodeSource (Node 22, 23 and 25 are not supported).
curl -fsSL https://deb.nodesource.com/setup_24.x | bash -
apt install -y nodejs
node --version

# OpenClaw CLI, without starting onboarding as root.
curl -fsSL https://openclaw.ai/install.sh | bash -s -- --no-onboard

# The user that owns OpenClaw state and its Gateway service.
adduser --disabled-password --gecos "" openclaw
loginctl enable-linger openclaw
su - openclaw
openclaw --version
