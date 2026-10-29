# Section "Write policy: an allowlist plugin" of https://bitvps.com/guides/host-a-nostr-relay-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cat > /etc/strfry/policy.py <<'EOF'
#!/usr/bin/env python3
import json, sys

ALLOWED = {
    "YOUR_HEX_PUBKEY",
    "A_FRIENDS_HEX_PUBKEY",
}

for line in sys.stdin:
    req = json.loads(line)
    if req.get("type") != "new":
        continue
    ev = req["event"]
    res = {"id": ev["id"]}
    tagged = {t[1] for t in ev.get("tags", []) if len(t) > 1 and t[0] == "p"}
    if ev["pubkey"] in ALLOWED or (tagged & ALLOWED):
        res["action"] = "accept"
    else:
        res["action"] = "reject"
        res["msg"] = "blocked: this relay only accepts events from or to its members"
    print(json.dumps(res), flush=True)
EOF
chmod 0755 /etc/strfry/policy.py
chown root:strfry /etc/strfry/policy.py

sed -i 's|plugin = ""|plugin = "/etc/strfry/policy.py"|' /etc/strfry.conf
journalctl -u strfry -n 5     # strfry notices the config change and loads the plugin
