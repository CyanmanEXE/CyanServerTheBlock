# 📁 `ezlibs-custom/footbomb/constants`

[🏠 Documentation home](../../../index.md) · [⬆ Parent folder](../index.md)

## 🗂️ Contents
- [Child references](#-child-references)
- [Guides and additional material](#-guides-and-additional-material)

## ⚙️ Current source/template setting

`constants.lua`: `DEFAULTS.INSTANCE_MAP = "footbomb"` is the **default map to clone for a match**, only when a Tiled referee object does not supply `Instance Map`. It is not a source-area check. The old `SOURCE_AREA` field was removed in this patch.

## Match defaults

`DEFAULTS.POINTS_TO_WIN = 10` is a fallback if the Tiled referee lacks a valid `Points to Win` integer. That Tiled value seeds the host's winning-score menu and can be edited there. `DEFAULTS.GRACE_ENABLED = true` preserves the existing trailing-player final-chance behavior until the host toggles it off in that menu.

## ⚡ Movement tuning

See [TIMING.md](../TIMING.md) for current defaults and units. `RESULT_BOMB_MOVE_SPEED=9` is the **actual** projected speed (no ×3); `RESULT_DEFENDER_JUMP_SPEED=5` provides neutral progress within the authored jump animation, not a seconds-per-tile calculation.

## 📂 Child references

| Folder / Lua script | Reference |
|---|---|
| — | No child folders |

## 📚 Guides and additional material

| Document | Description |
|---|---|
| — | No separate guides |

> 📅 Rebuilt from the supplied snapshot on 2026-11-19. Source-verified function signatures live in each script reference. Historical guides remain available alongside them.
