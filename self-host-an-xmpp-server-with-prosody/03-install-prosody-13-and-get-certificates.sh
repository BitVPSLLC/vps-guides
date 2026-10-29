# Section "Install Prosody 13 and get certificates" of https://bitvps.com/guides/self-host-an-xmpp-server-with-prosody
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y lsb-release wget
wget -O /etc/apt/sources.list.d/prosody.sources https://prosody.im/downloads/repos/$(lsb_release -sc)/prosody.sources
apt update
apt install -y prosody-13.0 certbot
prosodyctl about | head -3
