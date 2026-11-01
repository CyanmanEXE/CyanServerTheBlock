# `constants.lua`

> **Source:** `scripts/ezlibs-custom/footbomb/constants.lua`  
> **Source lines:** 113  
> **Functions detected:** 0  
> **Table declarations detected:** 13

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

FootBomb configuration. Keep values grouped by responsibility so UI, assets, input, and match tuning can be adjusted independently of lifecycle code.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `SCREEN_CENTER` *(line 6)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `120` |
| `y` | number literal | `80` |

### `constants` *(line 7)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DIAGNOSTICS` | table | `{ RUN_ANIMATION_DIAGNOSTICS = false, RUN_DIRECTION_MAPPING_TEST = false, }` |
| `DEFAULTS` | table | `{ SOURCE_AREA = "footbomb", POINTS_TO_WIN = 10, ASSET_NAME = "ref-prog", MUGSHOT_NAME = "ref-prog-mug", }` |
| `ASSETS` | table | `{ BOT_FOLDER = BOT_ASSET_FOLDER, MUG_FOLDER = BOT_ASSET_FOLDER, BOMB_FOLDER = ASSET_ROOT .. "bombs/", DEFAULT_MUG_ANIMATION = BOT_ASSET_FOLD…` |
| `UI` | table | `{ OFF_MAP_POSITION = { x = -1000, y = -1000, z = 0 }, CONFIRM_PROMPT = "Press A To Confirm", CONFIRM_PROMPT_SCALE = 2.0, CONFIRM_PROMPT_Y = …` |
| `INPUT` | table | `{ DIRECTION_SETTLE_SECONDS = 0.30, }` |
| `DIRECTIONS` | table | `{ CHOICES = { "Left", "Up", "Right" }, }` |
| `GAMEPLAY` | table | `{ RESULT_KICKER_WALK_UR_SPEED = 3, RESULT_KICKER_WALK_U_SPEED = 3, RESULT_BOMB_MOVE_SPEED = 3, RESULT_DEFENDER_JUMP_SPEED = 3, RESULT_BALL_Z…` |

### `DIAGNOSTICS` *(line 11)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `RUN_ANIMATION_DIAGNOSTICS` | boolean literal | `false` |
| `RUN_DIRECTION_MAPPING_TEST` | boolean literal | `false` |

### `DEFAULTS` *(line 15)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `SOURCE_AREA` | string literal | `"footbomb"` |
| `POINTS_TO_WIN` | number literal | `10` |
| `ASSET_NAME` | string literal | `"ref-prog"` |
| `MUGSHOT_NAME` | string literal | `"ref-prog-mug"` |

### `ASSETS` *(line 22)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `BOT_FOLDER` | expression/reference | `BOT_ASSET_FOLDER` |
| `MUG_FOLDER` | expression/reference | `BOT_ASSET_FOLDER` |
| `BOMB_FOLDER` | expression/reference | `ASSET_ROOT .. "bombs/"` |
| `DEFAULT_MUG_ANIMATION` | expression/reference | `BOT_ASSET_FOLDER .. "mug.animation"` |
| `CURSOR_TEXTURE` | string literal | `"/server/assets/net-games/cursors/text_cursor.png"` |
| `VIBRANT_CURSOR_TEXTURE` | string literal | `"/server/assets/net-games/cursors/vibrant_text_cursor.png"` |
| `CURSOR_ANIMATION` | string literal | `"/server/assets/net-games/cursors/text_cursor.animation"` |
| `CURSOR_SFX` | string literal | `"/server/assets/net-games/sfx/cursor_move.ogg"` |
| `SCOREBOARD_TEXTURE` | expression/reference | `ASSET_ROOT .. "ui/score-board.png"` |
| `SCOREBOARD_ANIMATION` | expression/reference | `ASSET_ROOT .. "ui/score-board.animation"` |
| `FINAL_SCORE_SFX` | expression/reference | `ASSET_ROOT .. "sfx/winner.ogg"` |
| `THUD_SFX` | expression/reference | `ASSET_ROOT .. "sfx/item-thud.ogg"` |
| `ROLE_PANEL_TEXTURE_KICKER` | expression/reference | `ASSET_ROOT .. "ui/kicker-role-box-9slice.png"` |
| `ROLE_PANEL_TEXTURE_DEFENDER` | expression/reference | `ASSET_ROOT .. "ui/defender-role-box-9slice.png"` |
| `ROLE_PANEL_ANIMATION` | expression/reference | `ASSET_ROOT .. "ui/role-box-9slice.animation"` |
| `ROLE_ICONS_TEXTURE` | expression/reference | `ASSET_ROOT .. "ui/role-icons.png"` |
| `ROLE_ICONS_ANIMATION` | expression/reference | `ASSET_ROOT .. "ui/role-icons.animation"` |

### `UI` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `OFF_MAP_POSITION` | table | `{ x = -1000, y = -1000, z = 0 }` |
| `CONFIRM_PROMPT` | string literal | `"Press A To Confirm"` |
| `CONFIRM_PROMPT_SCALE` | number literal | `2.0` |
| `CONFIRM_PROMPT_Y` | number literal | `5` |
| `NAVI_NAME_SCALE` | number literal | `1.5` |
| `SCREEN_WIDTH` | number literal | `240` |
| `SCREEN_HEIGHT` | number literal | `160` |
| `SCOREBOARD_X` | expression/reference | `SCREEN_CENTER.x - 100` |
| `SCOREBOARD_Y` | expression/reference | `SCREEN_CENTER.y - 50` |
| `SCOREBOARD_SCALE` | number literal | `2.0` |
| `SCORE_BOX_PLAYER_ONE_X` | number literal | `67` |
| `SCORE_BOX_PLAYER_TWO_X` | number literal | `122` |
| `SCORE_BOX_Y` | number literal | `54` |
| `SCORE_BOX_WIDTH` | number literal | `52` |
| `SCORE_BOX_HEIGHT` | number literal | `55` |
| `SCORE_TEXT_SCALE` | number literal | `4.0` |
| `ROLE_TEXT_Y` | number literal | `142` |
| `ROLE_TEXT_SCALE` | number literal | `2.0` |
| `ROLE_PANEL_Y` | number literal | `260` |
| `ROLE_PANEL_PADDING` | table | `{ horizontal = 6, vertical = 8 }` |
| `ROLE_PANEL_CHILD_PADDING` | number literal | `2` |
| `ROLE_PANEL_SLICE_SCALE` | number literal | `2.0` |
| `ROLE_ICON_SCALE` | number literal | `1.0` |
| `ROLE_ICON_GAP` | number literal | `8` |
| `ROLE_ICON_STATE_KICKER` | string literal | `"KICKER"` |
| `ROLE_ICON_STATE_DEFENDER` | string literal | `"DEFENSE"` |
| `SCORE_PLAYER_ONE_MUG_X` | number literal | `24` |
| `SCORE_PLAYER_TWO_MUG_X` | number literal | `176` |
| `SCORE_MUG_Y` | expression/reference | `SCREEN_CENTER.y - 24` |
| `SCORE_MUG_SCALE` | number literal | `2.0` |
| `BOMB_SELECTOR_SCALE` | number literal | `2.0` |
| `BOMB_CURSOR_LEFT_X` | expression/reference | `SCREEN_CENTER.x - 28` |
| `BOMB_CURSOR_RIGHT_X` | expression/reference | `SCREEN_CENTER.x + 34` |
| `BOMB_CURSOR_Y` | expression/reference | `SCREEN_CENTER.y + 12` |
| `BOMB_PREVIEW_X` | expression/reference | `SCREEN_CENTER.x - 17` |
| `BOMB_PREVIEW_Y` | expression/reference | `SCREEN_CENTER.y + 4` |
| `DIRECTION_CURSOR_X` | table | `{ 40, SCREEN_CENTER.x, 200 }` |
| `DIRECTION_CURSOR_Y` | expression/reference | `SCREEN_CENTER.y - 18` |
| `DIRECTION_CURSOR_SCALE` | number literal | `2.0` |
| `DIRECTION_CURSOR_BOB_OFFSET` | number literal | `5` |
| `DIRECTION_CURSOR_BOB_TICKS` | number literal | `2` |

### `OFF_MAP_POSITION` *(line 45)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `-1000` |
| `y` | number literal | `-1000` |
| `z` | number literal | `0` |

### `ROLE_PANEL_PADDING` *(line 65)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `horizontal` | number literal | `6` |
| `vertical` | number literal | `8` |

### `DIRECTION_CURSOR_X` *(line 86)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | number literal | `40` |
| `[2]` | expression/reference | `SCREEN_CENTER.x` |
| `[3]` | number literal | `200` |

### `INPUT` *(line 92)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DIRECTION_SETTLE_SECONDS` | number literal | `0.30` |

### `DIRECTIONS` *(line 96)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `CHOICES` | table | `{ "Left", "Up", "Right" }` |

### `CHOICES` *(line 98)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Left"` |
| `[2]` | string literal | `"Up"` |
| `[3]` | string literal | `"Right"` |

### `GAMEPLAY` *(line 100)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `RESULT_KICKER_WALK_UR_SPEED` | number literal | `3` |
| `RESULT_KICKER_WALK_U_SPEED` | number literal | `3` |
| `RESULT_BOMB_MOVE_SPEED` | number literal | `3` |
| `RESULT_DEFENDER_JUMP_SPEED` | number literal | `3` |
| `RESULT_BALL_Z_LIFT` | number literal | `4` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/footbomb/constants.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
