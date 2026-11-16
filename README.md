# Cataclysm: Bright Nights

**The world ended. Somewhere under New England there is a lab where it
can end for good.**

You made it to an evacuation shelter. Outside the door: the dead walking
the streets of towns and cities, giant insects, killer robots, the
fungus, the Mi-go, and "things far stranger and deadlier", and the others
like yourself, who want what you have. Scavenge the ruins for food,
water and gear, learn by doing, craft almost anything, fortify a house,
wire up an electric grid, fix up a car or a helicopter and get out.

Bright Nights is the branch of the Cataclysm family that gives you a way
to win. Its developers took Cataclysm: Dark Days Ahead in their own
direction, reworking combat, bionics, mutations, explosives and much
more, and put an ending in the world: somewhere is the Central Lab,
guarded at the front, open to a careful survivor through an access shaft
or a subway station, and at its bottom the way to stop the Cataclysm.

- **A victory condition**: find the Central Lab and finish it
- **Cities that feel like New England**: small towns, real cities with
  suburbs, apartments and a business district, airports with full-size
  aircraft, and alien outposts fighting the dead in the streets
- **Manual melee**: choose your martial arts technique, grab smaller
  enemies and throw them, crash through windows
- **Electric grids** for your base, without needing a vehicle
- **Lua mods**, and a whole shelf of mods in the box: Magical Nights for
  magic, Aftershock for science fiction, Arcana, Cataclysm++, DinoMod and
  dozens more, switched on when you make a world

## Playing

Run `./cataclysm-bn` from this folder (it starts `cataclysm-bn-curses`
with the data beside it). It needs a UTF-8 terminal of at least 80x24;
a bigger one shows more of the map.

- `h` `j` `k` `l` `y` `u` `b` `n`, the arrow keys or the number pad:
  move; walk into a door to open it, into a monster to attack it
- `.` or `5`: wait a turn; `<` and `>`: go up and down
- `g`: pick up; `e`: examine; `o` and `c`: open and close; `s`: smash
- `i`: inventory; `w`: wield; `W`: wear; `E`: eat or drink; `a`: use
- `f`: fire; `t`: throw; `G`: grab
- `&`: craft; `*`: construct; `$`: sleep; `]`: cast a spell (with magic
  mods)
- `m`: the map; `x` or `;`: look around
- `?`: every key binding, and they can be changed; `0`: help
- `S`: save and quit; `Esc`: the game menu

Your worlds, saves, options, key bindings, memorials and logs are kept
in the state folder, `$XDG_STATE_HOME/cataclysm-bn` (else
`~/.local/state/cataclysm-bn`).

## Where it comes from

Whales began Cataclysm in 2010, and in 2013 its players carried it on as
Cataclysm: Dark Days Ahead, which grew under CleverRaven into one of the
biggest open-source games there is. In 2020 Coolthulhu, long a Dark
Days Ahead developer, restarted it as a fork of his own with a different idea
of what the game should be, and it took the name Bright Nights that
September. Its first stable release came in October 2022; the team that
carries it now (scarf005, RobbieNeko, chaosvolt, Oren Audeles and many
contributors) releases a new one every few months.

## Credits

- Cataclysm: Bright Nights: its contributors, https://github.com/cataclysmbn/Cataclysm-BN
- Before it: Cataclysm: Dark Days Ahead by CleverRaven and contributors,
  and Cataclysm by Whales, with TheDarklingWolf, GlyphGryph and Kevin
  Granade
- Licence: CC BY-SA 3.0; the Magical Nights mod CC BY-SA 4.0; the
  Terminus font under the SIL Open Font License (`LICENSE.txt`,
  `LICENSE-OFL-Terminus-Font.txt`)
- This package: Asciiverse, for the av launcher and the catalog at
  https://asciiverse.sh. What we changed is in PATCHES.md.

## Building

Nothing is built here. `sh asciiverse/stage.sh <folder> linux|macos`
gathers upstream's official curses build, unpacked into `<folder>`, and
our start script into `stage/`; the release workflow
(`.github/workflows/asciiverse-release.yml`) downloads upstream's builds,
checks them against pinned sha256 sums and packs one archive per target.
