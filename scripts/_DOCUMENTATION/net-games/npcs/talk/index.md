# `talk.lua`

> **Source:** `scripts/net-games/npcs/talk.lua`  
> **Source lines:** 579  
> **Functions detected:** 26  
> **Table declarations detected:** 5

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

===================================================== talk.lua Minimal author API for Dialogue NPCs with PROG-default UI =====================================================

## Dependencies

- `scripts/libs/direction` — line 6
- `scripts/net-games/dialogue/dialogue` — line 7
- `scripts/net-games/npcs/talk_presets` — line 8
- `scripts/net-games/npcs/menu_options` — line 9
- `scripts/displayer/displayer` — line 10
- `scripts/net-games/npcs/talk_vert_menu` — line 62

## Events

- `Net:on("actor_interaction", function(event) ...)` — line 533. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 17 | `shallow_copy` | `t` |
| 23 | `deep_merge` | `dst, src` |
| 35 | `normalize_script` | `lines_or_text` |
| 44 | `stable_box_id` | `cfg` |
| 51 | `force_indicator_on` | `player_id, box_id` |
| 59 | `get_talk_vert_menu` | `(none)` |
| 69 | `build_ui` | `cfg, bot_name, opts` |
| 179 | `get_pack_from_cfg` | `cfg` |
| 184 | `resolve_layout` | `cfg, menu_cfg` |
| 197 | `resolve_flow` | `cfg, menu_cfg` |
| 216 | `resolve_sfx` | `cfg, menu_cfg` |
| 233 | `resolve_options` | `menu_cfg` |
| 256 | `infer_exit_index` | `options, explicit_exit_index` |
| 275 | `Talk.start` | `player_id, script, cfg, bot_name, extra_opts` |
| 308 | `Talk.prompt_yesno` | `player_id, question, cfg, bot_name, handlers` |
| 328 | `Talk.vert_menu` | `player_id, bot_name, cfg, menu_cfg` |
| 369 | `pick_text` | `...` |
| 406 | `open_menu` | `(none)` |
| 433 | `on_yes` | `(none)` |
| 447 | `on_no` | `(none)` |
| 466 | `on_cancel` | `(none)` |
| 478 | `Talk.prompt_then_talk` | `player_id, question, yes_script, no_script, cfg, bot_name` |
| 482 | `on_yes` | `(none)` |
| 488 | `on_no` | `(none)` |
| 510 | `Talk.npc` | `cfg` |
| 574 | `Talk._build_ui` | `cfg, bot_name, opts` |

### Function notes

- **`shallow_copy(t)`** — ===================================================== Small table helpers ===================================================== *(source line 17)*
- **`deep_merge(dst, src)`** *(source line 23)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`normalize_script(lines_or_text)`** *(source line 35)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`stable_box_id(cfg)`** *(source line 44)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`force_indicator_on(player_id, box_id)`** *(source line 51)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`get_talk_vert_menu()`** *(source line 59)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_ui(cfg, bot_name, opts)`** — ===================================================== build_ui(cfg, bot_name, opts) opts.mode = "dialogue" | "prompt" ===================================================== *(source line 69)*
- **`get_pack_from_cfg(cfg)`** — ===================================================== Vertical menu helpers (author-facing API) ===================================================== *(source line 179)*
- **`resolve_layout(cfg, menu_cfg)`** *(source line 184)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_flow(cfg, menu_cfg)`** *(source line 197)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_sfx(cfg, menu_cfg)`** *(source line 216)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_options(menu_cfg)`** *(source line 233)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`infer_exit_index(options, explicit_exit_index)`** *(source line 256)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Talk.start(player_id, script, cfg, bot_name, extra_opts)`** — Talk.start(player_id, script, cfg, bot_name) Most callers won't use this directly; Talk.npc() does. *(source line 275)*
- **`Talk.prompt_yesno(player_id, question, cfg, bot_name, handlers)`** — Talk.prompt_yesno(player_id, question, cfg, bot_name, handlers) handlers = { on_yes = fn, on_no = fn, on_cancel = fn } *(source line 308)*
- **`Talk.vert_menu(player_id, bot_name, cfg, menu_cfg)`** — Talk.vert_menu(player_id, bot_name, cfg, menu_cfg) Highest-level vertical menu wrapper: - prompts yes/no to open (optional) - opens TalkVertMenu with preset defaults - allows full override of layout/flow/sfx/ui/mug/frame *(source line 328)*
- **`pick_text(...)`** *(source line 369)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`open_menu()`** *(source line 406)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_yes()`** *(source line 433)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_no()`** *(source line 447)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_cancel()`** *(source line 466)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Talk.prompt_then_talk(player_id, question, yes_script, no_script, cfg, bot_name)`** — Talk.prompt_then_talk(player_id, question, yes_script, no_script, cfg, bot_name) *(source line 478)*
- **`on_yes()`** *(source line 482)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`on_no()`** *(source line 488)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Talk.npc(cfg)`** — ===================================================== Talk.npc(cfg) Minimal NPC wiring with sane defaults.  Authors should only need: cfg.area_id, cfg.object, (optional) cfg.name, cfg.lines  Optional: cfg.preset / cfg.box / cfg.mug / cfg.nameplate / cfg.frame cfg.ui overrides (mugshot off, tweak offsets, etc.) cfg.prompt = { question, yes_lines, no_lines } ===================================================== *(source line 510)*
- **`Talk._build_ui(cfg, bot_name, opts)`** — ===================================================== Internal: expose UI builder for wrappers (vert menu, etc.) ===================================================== *(source line 574)*

## Tables and data structures

### `Talk` *(line 11)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o` *(line 18)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ui` *(line 80)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `base` *(line 201)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `o` *(line 279)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `page_advance` | expression/reference | `cfg.page_advance or "wait_for_confirm"` |
| `confirm_during_typing` | call/expression | `(cfg.confirm_during_typing ~= false)` |
| `cancel_behavior` | expression/reference | `cfg.cancel_behavior or "battle_network"` |
| `from_prompt` | call/expression | `(cfg.from_prompt == true)` |
| `reuse_existing_box` | call/expression | `(cfg.reuse_existing_box == true)` |
| `ui` | expression/reference | `ui` |
| `on_finish` | expression/reference | `cfg.on_finish` |
| `debug` | expression/reference | `cfg.debug` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/net-games/npcs/talk.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
