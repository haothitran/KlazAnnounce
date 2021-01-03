# KlazAnnounce

A World of Warcraft add-on that displays indicators for when important events occur.

There are no in-game options. Settings are hard-coded and can be changed by accessing the file `Core\Config.lua` and adjusting `true`/`false` values. Edit spells and items to track in `Core\Filters.lua` and follow included instructions on how to add and remove spells and items.

## Features

- Force certain warning sounds to play even when sound effects are disabled.
- Announce when items are placed or used in groups (eg. Soulwells, Swapblaster, etc.).
- Announce spells interrupted by player in groups.
- Report cooldowns used by group in instances (eg. Blessing of Sacrifice, Tranquility, etc.).

## Installation

1. Backup `World of Warcraft\_retail_\Interface` and `World of Warcraft\_retail_\WTF` folders. Just in case.
2. Download and extract folder.
3. Place extracted folder in `World of Warcraft\_retail_\Interface\AddOns\` directory.
4. Restart World of Warcraft client.
