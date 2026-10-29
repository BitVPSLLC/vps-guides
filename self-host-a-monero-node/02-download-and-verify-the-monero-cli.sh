# Section "Download and verify the Monero CLI" of https://bitvps.com/guides/self-host-a-monero-node
# Read the guide before running anything: these are the command blocks as they appear
# in the text, kept in order. Values in angle brackets, example hostnames, IPs and
# passwords must be replaced with your own.

cd /tmp
# linux64 for the x86 BVX plans, linuxarm8 for the Arm BVA plans.
case "$(uname -m)" in
  x86_64)  TARGET=linux64 ;;
  aarch64) TARGET=linuxarm8 ;;
esac
curl -L -o monero.tar.bz2 https://downloads.getmonero.org/cli/$TARGET
curl -LO https://www.getmonero.org/downloads/hashes.txt

curl -L -o binaryfate.asc https://raw.githubusercontent.com/monero-project/monero/master/utils/gpg_keys/binaryfate.asc
gpg --import binaryfate.asc
gpg --fingerprint binaryFate
gpg --verify hashes.txt          # expect "Good signature from binaryFate"

grep -q "$(sha256sum monero.tar.bz2 | cut -d' ' -f1)" hashes.txt && echo HASH OK || echo HASH MISMATCH
