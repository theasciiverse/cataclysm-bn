# Changes from upstream

This is the Asciiverse packaging of Cataclysm: Bright Nights, by its
contributors (github.com/cataclysmbn/Cataclysm-BN, a fork of
CleverRaven's Cataclysm: Dark Days Ahead, after Whales' Cataclysm),
stable release v0.13.0 (2026-09-25), terminal (curses) edition. Licence:
CC BY-SA 3.0, the Magical Nights mod CC BY-SA 4.0, the Terminus font
under the SIL Open Font License (`LICENSE.txt`,
`LICENSE-OFL-Terminus-Font.txt`, copied from upstream's source at
v0.13.0 into `asciiverse/`, since upstream's macOS build ships none).

## Upstream's builds, not ours

Upstream publishes official curses builds with every release:
`cbn-linux-curses-x64` (a tarball) and `cbn-osx-curses-x64` and
`-arm` (disk images). This package is made from those, unchanged, so the
game is exactly what upstream released; nothing is compiled here.
Upstream's game already takes a folder for all of a player's files
(`--userdir`), which is all our state-folder rule needs, so building it
ourselves would have bought nothing but a long C++ build.

This repository therefore holds only the packaging. The `upstream`
remote (github.com/cataclysmbn/Cataclysm-BN) is set with `--no-tags`
and never fetched: its history is several gigabytes. The release
workflow downloads upstream's files and checks them against the sha256
sums pinned in it:

- `cbn-linux-curses-x64-v0.13.0.tar.gz`
  `73c26b9984f63e349823164abc05433746a05ce42f74645f03fa79d52483e10c`
- `cbn-osx-curses-x64-v0.13.0.dmg`
  `e4acfbc78e1bd533767dde3d1950e236da7ea292dd079629d9a2ab25d9579e52`
- `cbn-osx-curses-arm-v0.13.0.dmg`
  `26a15505bfbfce1c892142521eb017f6c26bd64e66235774f3a8b8422cd592bf`

To move to a later release: change `UPSTREAM`, `BASE`, the file names
and the sums in the workflow, and tag `v<release>-av.1`.

## What we change in the package

- **A start script**, `cataclysm-bn` (`asciiverse/cataclysm-bn`), which
  av runs and which follows av's symbolic link to find the game. It
  starts the game with `--basepath` (the data beside it) and `--userdir
  $XDG_STATE_HOME/cataclysm-bn/` (else `~/.local/state/cataclysm-bn/`),
  so worlds, saves, options, key bindings, memorials, templates and logs
  all go to the state folder; upstream's default is `~/.cataclysm-bn` on
  Linux and `~/Library/Application Support/Cataclysm-BN` on macOS. On
  macOS it sets `DYLD_LIBRARY_PATH` to the game's folder, as upstream's
  own app does, for the curses libraries shipped there. The game itself
  is renamed `cataclysm-bn-curses`.
- **Linux: debug information stripped** from the game (`strip`): upstream
  ships it with full debug information, 386 MB; stripped it is 96 MB and
  runs the same. The macOS games are signed and left untouched.
- **Left out**: upstream's launchers (`cataclysm-launcher`, the app's
  `Cataclysm.sh`, which opens Terminal.app), `json_formatter` (a modding
  tool), the app bundle's icon and property list, and the optional
  Monster Girls Mutations mod (`data/mods/Monster_Girls`): its anime
  catgirl, cowgirl and bunnygirl mutation lines carry flirtatious
  innuendo, and the Asciiverse catalog has no sex content, so it is left
  out to be safe. It is off by default upstream and nothing depends on
  it.

## Packaging (new files)

- `asciiverse/cataclysm-bn`: the start script (above).
- `asciiverse/stage.sh`: gathers what ships into `stage/` from an
  unpacked upstream build: the start script, the game, `data/`, `lang/`,
  `lib/`, the macOS curses libraries, the licences, `VERSION.txt`,
  README.md and this file.
- `asciiverse/record-preview.py` and `asciiverse/cataclysm-bn.cast`: the
  catalog preview, after Cataclysm: DDA's recorder.
- `asciiverse/cataclysm-bn.toml`, `asciiverse/cataclysm-bn.md`: the
  catalog manifest and store page, as drafts for hub.
- `.github/workflows/asciiverse-release.yml`: on a `*-av.*` tag, downloads
  and checks upstream's builds, stages them, starts the game once to see
  it make its state folder (Linux, and macOS arm64), and releases one
  archive per target with SHA256SUMS.

## Not shipped

- Linux on arm64: upstream builds no curses edition for it.
- Windows: upstream's Windows builds are the tiles (SDL) edition only; no
  curses edition is made.
- System packages (.deb, .rpm and so on): upstream's Linux game links
  glibc 2.38, ncursesw 6 and SQLite 3 from the system, so they would not
  be the self-contained packages our other titles have.
