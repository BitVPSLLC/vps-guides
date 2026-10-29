# Section "Backups: the database, the keys and the attachments" of https://bitvps.com/guides/self-host-vaultwarden-password-manager
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y sqlite3
cat > /usr/local/bin/vw-backup <<'EOF'
#!/bin/sh
set -eu
SRC=/opt/vaultwarden/data
DST=/var/backups/vaultwarden
STAMP=$(date +%F-%H%M)
mkdir -p "$DST"
sqlite3 "$SRC/db.sqlite3" ".backup '$DST/db-$STAMP.sqlite3'"
tar czf "$DST/files-$STAMP.tgz" -C "$SRC" attachments sends rsa_key.pem rsa_key.pub.pem config.json 2>/dev/null || true
# keep 14 days locally
find "$DST" -type f -mtime +14 -delete
EOF
chmod +x /usr/local/bin/vw-backup
vw-backup && ls -lh /var/backups/vaultwarden

# Run it nightly.
echo '17 3 * * * root /usr/local/bin/vw-backup' > /etc/cron.d/vaultwarden-backup
