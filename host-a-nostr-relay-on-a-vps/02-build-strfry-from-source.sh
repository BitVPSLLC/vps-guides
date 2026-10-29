# Section "Build strfry from source" of https://bitvps.com/guides/host-a-nostr-relay-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

apt install -y git g++ make libssl-dev zlib1g-dev liblmdb-dev libflatbuffers-dev libsecp256k1-dev libzstd-dev
cd /usr/local/src
git clone https://github.com/hoytech/strfry && cd strfry
git checkout 1.1.3      # see https://github.com/hoytech/strfry/tags
git submodule update --init
make setup-golpe
make -j"$(nproc)"
install -m 0755 -o root -g root strfry /usr/local/bin/strfry
strfry --help | head -3
