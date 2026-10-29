# Section "PostgreSQL and the Synapse package" of https://bitvps.com/guides/host-a-matrix-synapse-homeserver
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y lsb-release wget apt-transport-https
wget -O /usr/share/keyrings/matrix-org-archive-keyring.gpg https://packages.matrix.org/debian/matrix-org-archive-keyring.gpg
gpg --show-keys /usr/share/keyrings/matrix-org-archive-keyring.gpg | grep -A1 pub
echo "deb [signed-by=/usr/share/keyrings/matrix-org-archive-keyring.gpg] https://packages.matrix.org/debian/ $(lsb_release -cs) main" \
  > /etc/apt/sources.list.d/matrix-org.list
apt update

# server_name is the part after the colon in user IDs. It cannot be changed later.
echo "matrix-synapse-py3 matrix-synapse/server-name string example.com" | debconf-set-selections
echo "matrix-synapse-py3 matrix-synapse/report-stats boolean false" | debconf-set-selections
apt install -y matrix-synapse-py3
systemctl stop matrix-synapse
