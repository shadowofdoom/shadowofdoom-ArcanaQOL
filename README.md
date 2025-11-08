# Arcana QOL

A Hades II mod that provides Quality of Life improvements for Arcana cards.

## Current Features

### The Queen - Relaxed Requirements

**The Queen** (Persephone) arcana card has an automatic equip requirement based on how many arcana cards with the same cost you have equipped.

### Vanilla Behavior
- The Queen auto-unequips if you have **3 or more** cards with the same cost

### With This Mod
- The Queen auto-unequips only if you have **4 or more** cards with the same cost
- Allows you to equip 3 cards with the same cost while keeping The Queen active
- **In-game description is automatically updated** to show the correct number

## Technical Details

- **Arcana Card**: The Queen (BonusRarity)
- **Modified Values**:
  - `AutoEquipRequirements.MaxDuplicateCount` changed from `2` to `3`
  - `AutoEquipText` updated to display the new requirement in-game
- **Effect**: The card's trait (Duo Rarity Boost) benefits from having more card flexibility

## Installation

1. Install via r2modman (recommended) or manually
2. Requires the following dependencies:
   - Hell2Modding
   - ENVY
   - ModUtil
   - Chalk
   - ReLoad

## Configuration

Edit `config.lua` to customize:

```lua
enabled = true  -- Enable/disable the mod
debug = true    -- Enable debug logging
max_duplicate_count = 3  -- Number of same-cost cards allowed (default: 3)
```

You can change `max_duplicate_count` to any value you want:
- `2` = Vanilla behavior
- `3` = Default mod behavior (allows 3 same-cost cards)
- `4` = Even more relaxed (allows 4 same-cost cards)
- etc.

**Note:** The in-game description automatically updates to match your configured value!

## Compatibility

- ✅ Compatible with all other mods
- ✅ Safe to add/remove mid-save
- ✅ Only modifies arcana card data (currently just The Queen)
- ✅ More arcana QOL features may be added in future updates

## Version History

### 1.0.1
- Updated mods GitHub URL

### v1.0.0
- Initial release
- Changes MaxDuplicateCount from 2 to 3
- Updates in-game description to show correct number
- Configurable via config.lua

## Author

shadowofdoom

## License

Free to use and modify
