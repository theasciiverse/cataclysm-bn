#!/bin/sh
# Gathers what ships into stage/ from upstream's official curses build,
# unpacked into the folder given (Linux: the tarball's cataclysmbn-<tag>
# folder; macOS: Cataclysm.app/Contents/Resources from the dmg):
#
#   sh asciiverse/stage.sh <unpacked folder> linux|macos
#
# The game itself is upstream's binary, renamed cataclysm-bn-curses (on
# Linux with its debug information stripped, 386 MB down to 96 MB; the
# macOS one is signed and left as it is), started by our script
# asciiverse/cataclysm-bn. Beside it: data/, lang/ (translations), lib/
# (the libraries upstream ships with it), the licences, upstream's
# VERSION.txt, our README.md and PATCHES.md. Left out: upstream's
# launchers, json_formatter (a modding tool), the app bundle's icon and
# plist, and the optional Monster Girls mod (PATCHES.md). The licences
# come from asciiverse/, since upstream's macOS build has none.
set -eu
src=$1
os=$2
cd "$(dirname "$0")/.."
rm -rf stage
mkdir -p stage
cp -R "$src/data" "$src/lang" "$src/lib" stage/
rm -rf stage/data/mods/Monster_Girls
if [ "$os" = linux ]; then
  strip -o stage/cataclysm-bn-curses "$src/cataclysm-bn"
else
  cp "$src/cataclysm-bn" stage/cataclysm-bn-curses
  cp "$src"/*.dylib stage/
fi
[ -f "$src/VERSION.txt" ] && cp "$src/VERSION.txt" stage/
cp asciiverse/LICENSE.txt asciiverse/LICENSE-OFL-Terminus-Font.txt stage/
chmod 755 stage/cataclysm-bn-curses
cp asciiverse/cataclysm-bn stage/cataclysm-bn
chmod 755 stage/cataclysm-bn
cp README.md PATCHES.md stage/
