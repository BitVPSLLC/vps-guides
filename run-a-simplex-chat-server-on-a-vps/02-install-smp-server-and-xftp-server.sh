# Section "Install smp-server and xftp-server" of https://bitvps.com/guides/run-a-simplex-chat-server-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cd /tmp
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/simplex-chat/simplexmq/stable/install.sh -o simplex-server-install.sh
# Take the SHA-256 from https://simplex.chat/docs/server.html (it changes with each script revision).
echo 'PASTE_SHA256_FROM_THE_DOCS  simplex-server-install.sh' | sha256sum -c
chmod +x simplex-server-install.sh
./simplex-server-install.sh     # type 1 for smp-server
./simplex-server-install.sh     # run again, type 2 for xftp-server
rm simplex-server-install.sh

ls -l /usr/local/bin/smp-server /usr/local/bin/xftp-server /usr/local/bin/simplex-servers-update
id smp && id xftp
