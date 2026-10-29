#!/bin/sh
# Section "Backups: built-in Borg versus rsync/restic off the box" of https://bitvps.com/guides/self-host-nextcloud-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# /usr/local/bin/nc-backup  (compose route)
set -eu
cd /opt/nextcloud
export RESTIC_REPOSITORY=sftp:backup@backup-host:/srv/restic/nextcloud
export RESTIC_PASSWORD_FILE=/root/.restic-pass
docker compose exec -T -u www-data app php occ maintenance:mode --on
docker compose exec -T db pg_dump -U nextcloud -Fc nextcloud > /var/backups/nextcloud.pgdump
restic backup /var/backups/nextcloud.pgdump /opt/nextcloud/data /opt/nextcloud/compose.yaml /opt/nextcloud/db.env \
  --exclude '/opt/nextcloud/data/appdata_*/preview'
docker compose exec -T -u www-data app php occ maintenance:mode --off
restic forget --keep-daily 7 --keep-weekly 4 --keep-monthly 6 --prune
