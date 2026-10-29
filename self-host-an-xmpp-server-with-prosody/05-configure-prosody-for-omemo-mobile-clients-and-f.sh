# Section "Configure Prosody for OMEMO, mobile clients and federation" of https://bitvps.com/guides/self-host-an-xmpp-server-with-prosody
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cp /etc/prosody/prosody.cfg.lua /etc/prosody/prosody.cfg.lua.dist
cat > /etc/prosody/prosody.cfg.lua <<'EOF'
admins = { "admin@example.com" }
pidfile = "/run/prosody/prosody.pid"

modules_enabled = {
  -- required
  "disco"; "roster"; "saslauth"; "tls"; "dialback";
  -- multi-device and mobile
  "carbons"; "smacks"; "mam"; "csi_simple"; "cloud_notify";
  "pep"; "vcard4"; "vcard_legacy"; "bookmarks"; "private";
  -- housekeeping
  "blocklist"; "limits"; "ping"; "time"; "version"; "uptime";
  "invites"; "invites_adhoc"; "invites_register";
  "admin_adhoc"; "admin_shell";
  "server_contact_info";
}

-- No open registration; create users with prosodyctl or send invites.
allow_registration = false

-- TLS everywhere
c2s_require_encryption = true
s2s_require_encryption = true
s2s_secure_auth = true
c2s_direct_tls_ports = { 5223 }

-- Archive: keep a month so a phone that was off for a week still syncs.
archive_expires_after = "1m"
default_archive_policy = true
max_archive_query_results = 50

-- Rate limits per connection
limits = {
  c2s = { rate = "10kb/s" };
  s2sin = { rate = "30kb/s" };
}

authentication = "internal_hashed"
storage = "internal"

log = {
  info = "/var/log/prosody/prosody.log";
  error = "/var/log/prosody/prosody.err";
}

certificates = "certs"

http_ports = { 5280 }
http_interfaces = { "127.0.0.1" }
https_ports = { 5281 }
https_interfaces = { "*", "::" }

VirtualHost "example.com"
  contact_info = {
    admin = { "mailto:you@example.com" };
  }

Component "conference.example.com" "muc"
  name = "Group chats"
  restrict_room_creation = "local"
  modules_enabled = { "muc_mam" }
  muc_log_by_default = true

Component "upload.example.com" "http_file_share"
  http_file_share_size_limit = 50 * 1024 * 1024    -- 50 MB per file
  http_file_share_daily_quota = 500 * 1024 * 1024  -- per user per day
  http_file_share_expires_after = 60 * 60 * 24 * 14  -- two weeks
EOF

prosodyctl check config
prosodyctl adduser admin@example.com
systemctl enable --now prosody
systemctl restart prosody

ufw allow 5222/tcp comment 'xmpp c2s'
ufw allow 5223/tcp comment 'xmpp c2s direct tls'
ufw allow 5269/tcp comment 'xmpp s2s'
ufw allow 5281/tcp comment 'prosody https uploads'

prosodyctl check          # DNS, certificates, config
prosodyctl check connectivity   # asks an external service to connect to you
