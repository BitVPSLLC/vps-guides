# Section "Download and verify LND" of https://bitvps.com/guides/run-a-lightning-node-on-a-vps
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

VER=v0.21.4-beta   # check https://github.com/lightningnetwork/lnd/releases
case "$(uname -m)" in
  x86_64)  ARCH=amd64 ;;
  aarch64) ARCH=arm64 ;;
esac
cd /tmp
BASE=https://github.com/lightningnetwork/lnd/releases/download/$VER
curl -LO $BASE/lnd-linux-$ARCH-$VER.tar.gz
curl -LO $BASE/manifest-$VER.txt
curl -LO $BASE/manifest-roasbeef-$VER.sig

curl -L https://raw.githubusercontent.com/lightningnetwork/lnd/master/scripts/keys/roasbeef.asc | gpg --import
gpg --verify manifest-roasbeef-$VER.sig manifest-$VER.txt     # expect "Good signature from Olaoluwa Osuntokun"
grep lnd-linux-$ARCH-$VER.tar.gz manifest-$VER.txt | sha256sum --check   # expect exactly one OK

tar xzf lnd-linux-$ARCH-$VER.tar.gz
install -m 0755 -o root -g root -t /usr/local/bin lnd-linux-$ARCH-$VER/lnd lnd-linux-$ARCH-$VER/lncli
lnd --version
