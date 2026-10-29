# Section "Optional: Element Web on its own hostname" of https://bitvps.com/guides/host-a-matrix-synapse-homeserver
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

VER=$(curl -s https://api.github.com/repos/element-hq/element-web/releases/latest | grep -oP '"tag_name": "\K[^"]+')
cd /tmp
curl -LO https://github.com/element-hq/element-web/releases/download/$VER/element-$VER.tar.gz
curl -LO https://github.com/element-hq/element-web/releases/download/$VER/element-$VER.tar.gz.asc
# Import the Element release key from https://packages.element.io/element-release-key.gpg and verify:
curl -s https://packages.element.io/element-release-key.gpg | gpg --import
gpg --verify element-$VER.tar.gz.asc element-$VER.tar.gz

mkdir -p /var/www/element
tar xzf element-$VER.tar.gz -C /var/www/element --strip-components=1
cat > /var/www/element/config.json <<'EOF'
{
  "default_server_config": {
    "m.homeserver": { "base_url": "https://matrix.example.com", "server_name": "example.com" }
  },
  "disable_custom_urls": false,
  "brand": "Element"
}
EOF
