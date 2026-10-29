# Section "Moderation, the acceptable use policy, and day-to-day operation" of https://bitvps.com/guides/host-a-nostr-relay-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

# Remove everything by a pubkey (dry run first; drop --dry-run to apply):
sudo -u strfry strfry --config /etc/strfry.conf delete --filter '{"authors":["BAD_HEX_PUBKEY"]}' --dry-run

# Nightly export is the backup; LMDB files should not be copied while open.
sudo -u strfry strfry --config /etc/strfry.conf export > /var/lib/strfry/export-$(date +%F).jsonl

# Health
du -sh /var/lib/strfry/db
ss -tn state established '( sport = :7777 )' | wc -l       # live websocket connections
curl -s http://127.0.0.1:7777/metrics | head                # Prometheus metrics
