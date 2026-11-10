# `generate-ezlibs-tiled.lua`

> **Source:** `scripts/ezlibs-scripts/generate-ezlibs-tiled.lua`  
> **Source lines:** 2023  
> **Functions detected:** 23  
> **Table declarations detected:** 230

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

generate-ezlibs-tiled.lua Generates three artifacts from a single source of truth: ezlibs-tiled-types.json    — Tiled project types (unchanged shape; metadata fields are stripped so Tiled doesn't see anything it might reject). ezlibs-tiled-schema.lua    — Runtime schema including category/required/ description/dependsOn metadata, consumed by tiled_utils.validate_properties. ezlibs-tiled-reference.md  — Map-maker reference generated from the same metadata, grouped by category, with a conditional-properties section per class. Run with: lua generate-ezlibs-tiled.lua [output_path_for_types_json]

## Dependencies

- `scripts/ezlibs-scripts/json` — line 16

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 122 | `prop` | `name, typ, default, enumName` |
| 1602 | `validate_schema` | `(none)` |
| 1604 | `err` | `fmt, ...` |
| 1654 | `strip_member` | `p` |
| 1662 | `strip_class_members` | `members` |
| 1670 | `build_tiled_types` | `(none)` |
| 1708 | `lua_quote` | `s` |
| 1712 | `serialize_value` | `v, indent` |
| 1752 | `merge_member_meta` | `ot, p` |
| 1762 | `build_schema_lua` | `(none)` |
| 1764 | `w` | `s` |
| 1805 | `md_escape` | `s` |
| 1811 | `fmt_default` | `v` |
| 1823 | `fmt_type` | `p` |
| 1831 | `category_of` | `ot_name, p` |
| 1838 | `required_of` | `ot_name, p` |
| 1843 | `description_of` | `ot_name, p` |
| 1848 | `conditional_of` | `ot_name, p` |
| 1870 | `build_reference_md` | `(none)` |
| 1872 | `w` | `s` |
| 1955 | `dirname` | `p` |
| 1959 | `script_dirname` | `(none)` |
| 1971 | `main` | `output_path, pretty` |

### Function notes

- **`prop(name, typ, default, enumName)`** — ---------------------------------------------------------------------- *(source line 122)*
- **`validate_schema()`** — ---------------------------------------------------------------------- Schema validation ---------------------------------------------------------------------- *(source line 1602)*
- **`err(fmt, ...)`** *(source line 1604)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`strip_member(p)`** *(source line 1654)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`strip_class_members(members)`** *(source line 1662)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_tiled_types()`** *(source line 1670)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`lua_quote(s)`** — ---------------------------------------------------------------------- *(source line 1708)*
- **`serialize_value(v, indent)`** *(source line 1712)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`merge_member_meta(ot, p)`** *(source line 1752)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_schema_lua()`** *(source line 1762)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`w(s)`** *(source line 1764)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`md_escape(s)`** *(source line 1805)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fmt_default(v)`** *(source line 1811)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`fmt_type(p)`** *(source line 1823)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`category_of(ot_name, p)`** *(source line 1831)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`required_of(ot_name, p)`** *(source line 1838)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`description_of(ot_name, p)`** *(source line 1843)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`conditional_of(ot_name, p)`** *(source line 1848)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`build_reference_md()`** *(source line 1870)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`w(s)`** *(source line 1872)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`dirname(p)`** — ---------------------------------------------------------------------- Directory helpers ---------------------------------------------------------------------- *(source line 1955)*
- **`script_dirname()`** *(source line 1959)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`main(output_path, pretty)`** *(source line 1971)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Enums` *(line 20)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `Direction` | table | `{ type = "string", values = {"Up", "Down", "Left", "Right", "Up Left", "Up Right", "Down Left", "Down Right"} }` |
| `MysteryType` | table | `{ type = "string", values = {"keyitem", "item", "money", "random", "quiz", "fragments", "tokens", "encounter"} }` |
| `WaypointType` | table | `{ type = "string", values = {"first", "random", "before", "after"} }` |
| `DialogueType` | table | `{ type = "string", values = {"first", "question", "quiz", "random", "itemcheck", "before", "after", "shop", "password", "quest_switch", "que…` |
| `ItemType` | table | `{ type = "string", values = {"item", "keyitem", "money", "fragments", "tokens"} }` |
| `CurrencyType` | table | `{ type = "string", values = {"money", "fragments", "tokens"} }` |
| `QuizFailAction` | table | `{ type = "string", values = {"retry", "hide_once", "hide_temp", "explode"} }` |
| `TriggerShape` | table | `{ type = "string", values = {"rect", "ellipse"} }` |
| `ButtonBehavior` | table | `{ type = "string", values = {"Pressure Plate", "One-Time", "Toggle", "Custom", "Timed"} }` |
| `KeyType` | table | `{ type = "string", values = {"money", "fragments", "tokens", "item", "bossgate", "navi_name", "navi_element", "navi_list"} }` |
| `ButtonChainType` | table | `{ type = "string", values = {"Any", "Exclusive"} }` |
| `ButtonGroupMode` | table | `{ type = "string", values = {"all_active", "any_active", "combination"} }` |
| `ButtonComboMode` | table | `{ type = "string", values = {"Inclusive", "Exclusive"} }` |
| `ButtonEffectEvent` | table | `{ type = "string", values = {"activated", "deactivated"} }` |
| `ButtonGroupEvent` | table | `{ type = "string", values = {"completed", "incomplete"} }` |
| `ButtonEffectAction` | table | `{ type = "string", values = {"activate", "deactivate", "toggle", "reset"} }` |
| `CompressionMode` | table | `{ type = "string", values = {"Compress", "Normalize", "Enlarge"} }` |
| `SizeModeScope` | table | `{ type = "string", values = {"Player", "Area Wide"} }` |
| `NaviElement` | table | `{ type = "string", values = {"None", "Fire", "Aqua", "Elec", "Wood", "Sword", "Break", "Cursor", "Wind", "Summon", "Plus"} }` |
| `CutsceneStepType` | table | `{ type = "string", values = {"Wait", "Move Actor", "Set Pose", "Show Message", "Ask Quiz", "Prompt Player", "Play Sound", "Fade Camera", "Mo…` |
| `NPCSpawnMode` | table | `{ type = "string", values = {"Once", "Interval"} }` |
| `BossSpawnMode` | table | `{ type = "string", values = {"Immediate", "On Dark Hole Cleared", "Manual", "After Boss Defeated"} }` |
| `BossRequirementType` | table | `{ type = "string", values = {"All", "Any"} }` |

### `Direction` *(line 21)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"Up", "Down", "Left", "Right", "Up Left", "Up Right", "Down Left", "Down Right"}` |

### `values` *(line 23)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Up"` |
| `[2]` | string literal | `"Down"` |
| `[3]` | string literal | `"Left"` |
| `[4]` | string literal | `"Right"` |
| `[5]` | string literal | `"Up Left"` |
| `[6]` | string literal | `"Up Right"` |
| `[7]` | string literal | `"Down Left"` |
| `[8]` | string literal | `"Down Right"` |

### `MysteryType` *(line 25)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"keyitem", "item", "money", "random", "quiz", "fragments", "tokens", "encounter"}` |

### `values` *(line 27)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"keyitem"` |
| `[2]` | string literal | `"item"` |
| `[3]` | string literal | `"money"` |
| `[4]` | string literal | `"random"` |
| `[5]` | string literal | `"quiz"` |
| `[6]` | string literal | `"fragments"` |
| `[7]` | string literal | `"tokens"` |
| `[8]` | string literal | `"encounter"` |

### `WaypointType` *(line 29)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"first", "random", "before", "after"}` |

### `values` *(line 31)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"first"` |
| `[2]` | string literal | `"random"` |
| `[3]` | string literal | `"before"` |
| `[4]` | string literal | `"after"` |

### `DialogueType` *(line 33)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"first", "question", "quiz", "random", "itemcheck", "before", "after", "shop", "password", "quest_switch", "quest_event", "item", "email", …` |

### `values` *(line 35)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"first"` |
| `[2]` | string literal | `"question"` |
| `[3]` | string literal | `"quiz"` |
| `[4]` | string literal | `"random"` |
| `[5]` | string literal | `"itemcheck"` |
| `[6]` | string literal | `"before"` |
| `[7]` | string literal | `"after"` |
| `[8]` | string literal | `"shop"` |
| `[9]` | string literal | `"password"` |
| `[10]` | string literal | `"quest_switch"` |
| `[11]` | string literal | `"quest_event"` |
| `[12]` | string literal | `"item"` |
| `[13]` | string literal | `"email"` |
| `[14]` | string literal | `"questcheck"` |
| `[15]` | string literal | `"battle_npc"` |

### `ItemType` *(line 39)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"item", "keyitem", "money", "fragments", "tokens"}` |

### `values` *(line 41)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"item"` |
| `[2]` | string literal | `"keyitem"` |
| `[3]` | string literal | `"money"` |
| `[4]` | string literal | `"fragments"` |
| `[5]` | string literal | `"tokens"` |

### `CurrencyType` *(line 43)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"money", "fragments", "tokens"}` |

### `values` *(line 45)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"money"` |
| `[2]` | string literal | `"fragments"` |
| `[3]` | string literal | `"tokens"` |

### `QuizFailAction` *(line 47)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"retry", "hide_once", "hide_temp", "explode"}` |

### `values` *(line 49)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"retry"` |
| `[2]` | string literal | `"hide_once"` |
| `[3]` | string literal | `"hide_temp"` |
| `[4]` | string literal | `"explode"` |

### `TriggerShape` *(line 51)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"rect", "ellipse"}` |

### `values` *(line 53)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"rect"` |
| `[2]` | string literal | `"ellipse"` |

### `ButtonBehavior` *(line 55)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"Pressure Plate", "One-Time", "Toggle", "Custom", "Timed"}` |

### `values` *(line 57)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Pressure Plate"` |
| `[2]` | string literal | `"One-Time"` |
| `[3]` | string literal | `"Toggle"` |
| `[4]` | string literal | `"Custom"` |
| `[5]` | string literal | `"Timed"` |

### `KeyType` *(line 59)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"money", "fragments", "tokens", "item", "bossgate", "navi_name", "navi_element", "navi_list"}` |

### `values` *(line 61)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"money"` |
| `[2]` | string literal | `"fragments"` |
| `[3]` | string literal | `"tokens"` |
| `[4]` | string literal | `"item"` |
| `[5]` | string literal | `"bossgate"` |
| `[6]` | string literal | `"navi_name"` |
| `[7]` | string literal | `"navi_element"` |
| `[8]` | string literal | `"navi_list"` |

### `ButtonChainType` *(line 64)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"Any", "Exclusive"}` |

### `values` *(line 66)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Any"` |
| `[2]` | string literal | `"Exclusive"` |

### `ButtonGroupMode` *(line 68)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"all_active", "any_active", "combination"}` |

### `values` *(line 70)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"all_active"` |
| `[2]` | string literal | `"any_active"` |
| `[3]` | string literal | `"combination"` |

### `ButtonComboMode` *(line 72)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"Inclusive", "Exclusive"}` |

### `values` *(line 74)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Inclusive"` |
| `[2]` | string literal | `"Exclusive"` |

### `ButtonEffectEvent` *(line 76)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"activated", "deactivated"}` |

### `values` *(line 78)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"activated"` |
| `[2]` | string literal | `"deactivated"` |

### `ButtonGroupEvent` *(line 80)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"completed", "incomplete"}` |

### `values` *(line 82)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"completed"` |
| `[2]` | string literal | `"incomplete"` |

### `ButtonEffectAction` *(line 84)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"activate", "deactivate", "toggle", "reset"}` |

### `values` *(line 86)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"activate"` |
| `[2]` | string literal | `"deactivate"` |
| `[3]` | string literal | `"toggle"` |
| `[4]` | string literal | `"reset"` |

### `CompressionMode` *(line 88)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"Compress", "Normalize", "Enlarge"}` |

### `values` *(line 90)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Compress"` |
| `[2]` | string literal | `"Normalize"` |
| `[3]` | string literal | `"Enlarge"` |

### `SizeModeScope` *(line 92)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"Player", "Area Wide"}` |

### `values` *(line 94)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Player"` |
| `[2]` | string literal | `"Area Wide"` |

### `NaviElement` *(line 96)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"None", "Fire", "Aqua", "Elec", "Wood", "Sword", "Break", "Cursor", "Wind", "Summon", "Plus"}` |

### `values` *(line 98)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"None"` |
| `[2]` | string literal | `"Fire"` |
| `[3]` | string literal | `"Aqua"` |
| `[4]` | string literal | `"Elec"` |
| `[5]` | string literal | `"Wood"` |
| `[6]` | string literal | `"Sword"` |
| `[7]` | string literal | `"Break"` |
| `[8]` | string literal | `"Cursor"` |
| `[9]` | string literal | `"Wind"` |
| `[10]` | string literal | `"Summon"` |
| `[11]` | string literal | `"Plus"` |

### `CutsceneStepType` *(line 101)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"Wait", "Move Actor", "Set Pose", "Show Message", "Ask Quiz", "Prompt Player", "Play Sound", "Fade Camera", "Move Camera", "Emit Event"}` |

### `values` *(line 103)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Wait"` |
| `[2]` | string literal | `"Move Actor"` |
| `[3]` | string literal | `"Set Pose"` |
| `[4]` | string literal | `"Show Message"` |
| `[5]` | string literal | `"Ask Quiz"` |
| `[6]` | string literal | `"Prompt Player"` |
| `[7]` | string literal | `"Play Sound"` |
| `[8]` | string literal | `"Fade Camera"` |
| `[9]` | string literal | `"Move Camera"` |
| `[10]` | string literal | `"Emit Event"` |

### `NPCSpawnMode` *(line 107)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"Once", "Interval"}` |

### `values` *(line 109)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Once"` |
| `[2]` | string literal | `"Interval"` |

### `BossSpawnMode` *(line 111)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"Immediate", "On Dark Hole Cleared", "Manual", "After Boss Defeated"}` |

### `values` *(line 113)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Immediate"` |
| `[2]` | string literal | `"On Dark Hole Cleared"` |
| `[3]` | string literal | `"Manual"` |
| `[4]` | string literal | `"After Boss Defeated"` |

### `BossRequirementType` *(line 115)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `type` | string literal | `"string"` |
| `values` | table | `{"All", "Any"}` |

### `values` *(line 117)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"All"` |
| `[2]` | string literal | `"Any"` |

### `p` *(line 123)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `name` | expression/reference | `name` |
| `type` | expression/reference | `typ` |
| `value` | expression/reference | `default` |

### `object_types` *(line 132)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ name = "Checkpoint", color = "#ffaa00", members = { prop("Password", "string", ""), prop("Key Type", "string", "money", "KeyType"), prop("…` |
| `[2]` | table | `{ name = "Mystery Data", color = "#00aaff", members = { prop("Locked", "bool", false), prop("Password Locked", "string", ""), prop("Once", "…` |
| `[3]` | table | `{ name = "Quiz List", color = "#aa66cc", members = { prop("Next 1", "object", ""), prop("Next 2", "object", ""), prop("Next 3", "object", ""…` |
| `[4]` | table | `{ name = "Quiz Question", color = "#88aa44", members = { prop("Question", "string", ""), prop("Option 1", "string", ""), prop("Option 2", "s…` |
| `[5]` | table | `{ name = "Location Trigger", color = "#88ff88", members = { prop("Event Name", "string", ""), prop("Name", "string", ""), } }` |
| `[6]` | table | `{ name = "Server Warp", color = "#ff8888", members = { prop("Incoming Data", "string", ""), prop("Direction", "string", "Down", "Direction")…` |
| `[7]` | table | `{ name = "Custom Warp", color = "#ff8888", members = { prop("Incoming Data", "string", ""), prop("Direction", "string", "Down", "Direction")…` |
| `[8]` | table | `{ name = "Interact Warp", color = "#ff8888", members = { prop("Incoming Data", "string", ""), prop("Direction", "string", "Down", "Direction…` |
| `[9]` | table | `{ name = "Radius Warp", color = "#ff8888", members = { prop("Incoming Data", "string", ""), prop("Direction", "string", "Down", "Direction")…` |
| `[10]` | table | `{ name = "NPC", color = "#aaaaaa", members = { prop("Direction", "string", "Down", "Direction"), prop("Asset Name", "string", ""), prop("Ani…` |
| `[11]` | table | `{ name = "Pushback NPC", color = "#ff6666", members = { prop("Direction", "string", "Down", "Direction"), prop("Asset Name", "string", "male…` |
| `[12]` | table | `{ name = "NPC Behavior", color = "#88bbdd", members = { prop("Attached NPC", "object", ""), prop("Behavior", "string", "Pushback"), prop("En…` |
| `[13]` | table | `{ name = "NPC Spawner", color = "#ffcc88", members = { prop("NPC Template", "object", ""), prop("Trigger Radius", "number", 0), prop("Spawn …` |
| `[14]` | table | `{ name = "FootBomb Controller", color = "#ffcc66", members = { prop("Direction", "string", "Down", "Direction"), prop("Asset Name", "string"…` |
| `[15]` | table | `{ name = "Waypoint", color = "#55ff55", members = { prop("Wait Time", "number", 0), prop("Direction", "string", "", "Direction"), prop("Wayp…` |
| `[16]` | table | `{ name = "Radius Encounter", color = "#ff5555", members = { prop("Radius", "number", 1), prop("Name", "string", ""), prop("Path", "file", ""…` |
| `[17]` | table | `{ name = "Water Refill", color = "#4444ff", members = {} }` |
| `[18]` | table | `{ name = "Item", color = "#ffdd44", members = { prop("Name", "string", ""), prop("Type", "string", "item", "ItemType"), prop("Description", …` |
| `[19]` | table | `{ name = "Dialogue", color = "#cc66cc", members = { prop("Dialogue Type", "string", "first", "DialogueType"), prop("Event Name", "string", "…` |
| `[20]` | table | `{ name = "Explosion Trigger", color = "#ff6600", members = { prop("Target", "string", ""), prop("Follow", "bool", false), prop("Once", "bool…` |
| `[21]` | table | `{ name = "Rush Road", color = "#ffaa00", members = { prop("Rush Object", "object", ""), prop("Direction", "string", "Down Left", "Direction"…` |
| `[22]` | table | `{ name = "Compression Tile", color = "#88aaff", members = { prop("Mode", "string", "Compress", "CompressionMode"), } }` |
| `[23]` | table | `{ name = "Admin Console", color = "#ffaa00", members = {} }` |
| `[24]` | table | `{ name = "Button Bot Details", color = "#99ddff", members = { prop("Asset Name", "string", ""), prop("Direction", "string", "Down", "Directi…` |
| `[25]` | table | `{ name = "OW Button", color = "#66ccff", members = { prop("Bot Details", "object", ""), prop("Next 1", "object", ""), prop("Button Behavior"…` |
| `[26]` | table | `{ name = "OW Button Group Member", color = "#66ddbb", members = { prop("Bot Details", "object", ""), prop("Button Behavior", "string", "One-…` |
| `[27]` | table | `{ name = "Unlock Behavior", color = "#ffcc00", members = { prop("Unlock This", "object", ""), prop("Unlock Permanently", "bool", false), pro…` |
| `[28]` | table | `{ name = "Relock Behavior", color = "#ff8888", members = { prop("Relock This", "object", ""), prop("Area Wide", "bool", false), } }` |
| `[29]` | table | `{ name = "Button Trigger", color = "#aaddff", members = { prop("Trigger Type", "string", "rect", "TriggerShape"), } }` |
| `[30]` | table | `{ name = "Button Group", color = "#66dd99", members = { prop("Group ID", "string", ""), prop("Group Mode", "string", "all_active", "ButtonGr…` |
| `[31]` | table | `{ name = "Button Combo", color = "#66bbdd", members = { prop("Button 1", "object", ""), prop("Forbidden Button 1", "object", ""), prop("Unlo…` |
| `[32]` | table | `{ name = "Combo Button Group", color = "#44bb88", members = { prop("Group ID", "string", ""), prop("Combo Mode", "string", "Inclusive", "But…` |
| `[33]` | table | `{ name = "Button Effect", color = "#ffbb66", members = { prop("Source Button", "object", ""), prop("Event", "string", "activated", "ButtonEf…` |
| `[34]` | table | `{ name = "Button Group Effect", color = "#ff9966", members = { prop("Button Group", "object", ""), prop("Event", "string", "completed", "But…` |
| `[35]` | table | `{ name = "Cutscene", color = "#c678dd", members = { prop("Name", "string", ""), prop("Start Step", "object", ""), prop("Trigger Radius", "nu…` |
| `[36]` | table | `{ name = "Cutscene Step", color = "#e5c07b", members = { prop("Type", "string", "Wait", "CutsceneStepType"), prop("Next Step", "object", "")…` |
| `[37]` | table | `{ name = "Liberation Config", color = "#cc66ff", members = { prop("Respawn Area", "string", ""), prop("Waiting Area", "string", ""), prop("L…` |
| `[38]` | table | `{ name = "Liberation Gate", color = "#cc66ff", members = { prop("Liberation Map File Name", "string", ""), } }` |
| `[39]` | table | `{ name = "Boss Dark Panel", color = "#cc3366", useAs = { "object" }, members = { prop("Boss", "string", ""), prop("Boss ID", "string", ""), …` |
| `[40]` | table | `{ name = "Dark Hole", color = "#663366", useAs = { "object" }, members = { prop("Boss ID 1", "string", ""), prop("Boss ID 2", "string", ""),…` |
| `[41]` | table | `{ name = "Indestructible Panel", color = "#9966cc", useAs = { "object" }, members = { prop("Boss ID 1", "string", ""), prop("Boss ID 2", "st…` |

### `members` *(line 136)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Password"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Key Type"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"money"` |
| `[7]` | string literal | `"KeyType")` |
| `[8]` | call/expression | `prop("Key Item Name"` |
| `[9]` | string literal | `"string"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Required Keys"` |
| `[12]` | string literal | `"number"` |
| `[13]` | number literal | `1)` |
| `[14]` | call/expression | `prop("Consume"` |
| `[15]` | string literal | `"bool"` |
| `[16]` | expression/reference | `false)` |
| `[17]` | call/expression | `prop("Once"` |
| `[18]` | string literal | `"bool"` |
| `[19]` | expression/reference | `false)` |
| `[20]` | call/expression | `prop("Unlocking Asset Name"` |
| `[21]` | string literal | `"string"` |
| `[22]` | string literal | `"bn5cubegreen")` |
| `[23]` | call/expression | `prop("Unlocking Animation Time"` |
| `[24]` | string literal | `"number"` |
| `[25]` | number literal | `0)` |
| `[26]` | call/expression | `prop("Unlocking Sound Path"` |
| `[27]` | string literal | `"string"` |
| `[28]` | string literal | `"/server/assets/ezlibs-assets/sfx/panel_change.ogg")` |
| `[29]` | call/expression | `prop("Skip Prompt"` |
| `[30]` | string literal | `"bool"` |
| `[31]` | expression/reference | `false)` |
| `[32]` | call/expression | `prop("Description"` |
| `[33]` | string literal | `"string"` |
| `[34]` | string literal | `"It's a Security Cube")` |
| `[35]` | call/expression | `prop("Unlocked Message"` |
| `[36]` | string literal | `"string"` |
| `[37]` | string literal | `"The Security Cube was unlocked!")` |
| `[38]` | call/expression | `prop("Unlock Failed Message"` |
| `[39]` | string literal | `"string"` |
| `[40]` | string literal | `"You were unable to unlock the Security Cube")` |
| `[41]` | call/expression | `prop("Navi Name"` |
| `[42]` | string literal | `"string"` |
| `[43]` | string literal | `"")` |
| `[44]` | call/expression | `prop("Navi Element"` |
| `[45]` | string literal | `"string"` |
| `[46]` | string literal | `""` |
| `[47]` | string literal | `"NaviElement")` |
| `[48]` | call/expression | `prop("Navi 1"` |
| `[49]` | string literal | `"string"` |
| `[50]` | string literal | `"")` |
| `[51]` | call/expression | `prop("Navi 2"` |
| `[52]` | string literal | `"string"` |
| `[53]` | string literal | `"")` |
| `[54]` | call/expression | `prop("Navi 3"` |
| `[55]` | string literal | `"string"` |
| `[56]` | string literal | `"")` |
| `[57]` | call/expression | `prop("Navi 4"` |
| `[58]` | string literal | `"string"` |
| `[59]` | string literal | `"")` |
| `[60]` | call/expression | `prop("Navi 5"` |
| `[61]` | string literal | `"string"` |
| `[62]` | string literal | `"")` |
| `[63]` | call/expression | `prop("Navi 6"` |
| `[64]` | string literal | `"string"` |
| `[65]` | string literal | `"")` |
| `[66]` | call/expression | `prop("Navi 7"` |
| `[67]` | string literal | `"string"` |
| `[68]` | string literal | `"")` |
| `[69]` | call/expression | `prop("Navi 8"` |
| `[70]` | string literal | `"string"` |
| `[71]` | string literal | `"")` |
| `[72]` | call/expression | `prop("Navi 9"` |
| `[73]` | string literal | `"string"` |
| `[74]` | string literal | `"")` |
| `[75]` | call/expression | `prop("Navi 10"` |
| `[76]` | string literal | `"string"` |
| `[77]` | string literal | `"")` |

### `members` *(line 167)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Locked"` |
| `[2]` | string literal | `"bool"` |
| `[3]` | expression/reference | `false)` |
| `[4]` | call/expression | `prop("Password Locked"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"")` |
| `[7]` | call/expression | `prop("Once"` |
| `[8]` | string literal | `"bool"` |
| `[9]` | expression/reference | `false)` |
| `[10]` | call/expression | `prop("Type"` |
| `[11]` | string literal | `"string"` |
| `[12]` | string literal | `"item"` |
| `[13]` | string literal | `"MysteryType")` |
| `[14]` | call/expression | `prop("Name"` |
| `[15]` | string literal | `"string"` |
| `[16]` | string literal | `"")` |
| `[17]` | call/expression | `prop("Description"` |
| `[18]` | string literal | `"string"` |
| `[19]` | string literal | `"")` |
| `[20]` | call/expression | `prop("Amount"` |
| `[21]` | string literal | `"number"` |
| `[22]` | number literal | `1)` |
| `[23]` | call/expression | `prop("Quiz List"` |
| `[24]` | string literal | `"object"` |
| `[25]` | string literal | `"")` |
| `[26]` | call/expression | `prop("Failure Message"` |
| `[27]` | string literal | `"string"` |
| `[28]` | string literal | `"")` |
| `[29]` | call/expression | `prop("On Fail"` |
| `[30]` | string literal | `"string"` |
| `[31]` | string literal | `"retry"` |
| `[32]` | string literal | `"QuizFailAction")` |
| `[33]` | call/expression | `prop("Explosion Count"` |
| `[34]` | string literal | `"number"` |
| `[35]` | number literal | `3)` |
| `[36]` | call/expression | `prop("Reward Type"` |
| `[37]` | string literal | `"string"` |
| `[38]` | string literal | `"item"` |
| `[39]` | string literal | `"ItemType")` |
| `[40]` | call/expression | `prop("Reward Name"` |
| `[41]` | string literal | `"string"` |
| `[42]` | string literal | `"")` |
| `[43]` | call/expression | `prop("Reward Amount"` |
| `[44]` | string literal | `"number"` |
| `[45]` | number literal | `1)` |
| `[46]` | call/expression | `prop("Reward Description"` |
| `[47]` | string literal | `"string"` |
| `[48]` | string literal | `"")` |
| `[49]` | call/expression | `prop("Cost Type"` |
| `[50]` | string literal | `"string"` |
| `[51]` | string literal | `""` |
| `[52]` | string literal | `"CurrencyType")` |
| `[53]` | call/expression | `prop("Cost Amount"` |
| `[54]` | string literal | `"number"` |
| `[55]` | number literal | `1)` |
| `[56]` | call/expression | `prop("Cost Failure Message"` |
| `[57]` | string literal | `"string"` |
| `[58]` | string literal | `"")` |
| `[59]` | call/expression | `prop("Next 1"` |
| `[60]` | string literal | `"object"` |
| `[61]` | string literal | `"")` |
| `[62]` | call/expression | `prop("Next 2"` |
| `[63]` | string literal | `"object"` |
| `[64]` | string literal | `"")` |
| `[65]` | call/expression | `prop("Next 3"` |
| `[66]` | string literal | `"object"` |
| `[67]` | string literal | `"")` |
| `[68]` | call/expression | `prop("Next 4"` |
| `[69]` | string literal | `"object"` |
| `[70]` | string literal | `"")` |
| `[71]` | call/expression | `prop("Next 5"` |
| `[72]` | string literal | `"object"` |
| `[73]` | string literal | `"")` |
| `[74]` | call/expression | `prop("Next 6"` |
| `[75]` | string literal | `"object"` |
| `[76]` | string literal | `"")` |
| `[77]` | call/expression | `prop("Next 7"` |
| `[78]` | string literal | `"object"` |
| `[79]` | string literal | `"")` |
| `[80]` | call/expression | `prop("Next 8"` |
| `[81]` | string literal | `"object"` |
| `[82]` | string literal | `"")` |
| `[83]` | call/expression | `prop("Next 9"` |
| `[84]` | string literal | `"object"` |
| `[85]` | string literal | `"")` |
| `[86]` | call/expression | `prop("Next 10"` |
| `[87]` | string literal | `"object"` |
| `[88]` | string literal | `"")` |

### `members` *(line 201)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Next 1"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Next 2"` |
| `[5]` | string literal | `"object"` |
| `[6]` | string literal | `"")` |
| `[7]` | call/expression | `prop("Next 3"` |
| `[8]` | string literal | `"object"` |
| `[9]` | string literal | `"")` |
| `[10]` | call/expression | `prop("Next 4"` |
| `[11]` | string literal | `"object"` |
| `[12]` | string literal | `"")` |
| `[13]` | call/expression | `prop("Next 5"` |
| `[14]` | string literal | `"object"` |
| `[15]` | string literal | `"")` |
| `[16]` | call/expression | `prop("Next 6"` |
| `[17]` | string literal | `"object"` |
| `[18]` | string literal | `"")` |
| `[19]` | call/expression | `prop("Next 7"` |
| `[20]` | string literal | `"object"` |
| `[21]` | string literal | `"")` |
| `[22]` | call/expression | `prop("Next 8"` |
| `[23]` | string literal | `"object"` |
| `[24]` | string literal | `"")` |
| `[25]` | call/expression | `prop("Next 9"` |
| `[26]` | string literal | `"object"` |
| `[27]` | string literal | `"")` |
| `[28]` | call/expression | `prop("Next 10"` |
| `[29]` | string literal | `"object"` |
| `[30]` | string literal | `"")` |

### `members` *(line 217)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Question"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Option 1"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"")` |
| `[7]` | call/expression | `prop("Option 2"` |
| `[8]` | string literal | `"string"` |
| `[9]` | string literal | `"")` |
| `[10]` | call/expression | `prop("Option 3"` |
| `[11]` | string literal | `"string"` |
| `[12]` | string literal | `"")` |
| `[13]` | call/expression | `prop("Correct Answer"` |
| `[14]` | string literal | `"number"` |
| `[15]` | number literal | `1)` |

### `members` *(line 228)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Event Name"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Name"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"")` |

### `members` *(line 236)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Incoming Data"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Direction"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"Down"` |
| `[7]` | string literal | `"Direction")` |
| `[8]` | call/expression | `prop("Warp In"` |
| `[9]` | string literal | `"bool"` |
| `[10]` | expression/reference | `false)` |
| `[11]` | call/expression | `prop("Arrival Animation"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Dont Teleport"` |
| `[15]` | string literal | `"bool"` |
| `[16]` | expression/reference | `false)` |
| `[17]` | call/expression | `prop("Address"` |
| `[18]` | string literal | `"string"` |
| `[19]` | string literal | `"")` |
| `[20]` | call/expression | `prop("Port"` |
| `[21]` | string literal | `"number"` |
| `[22]` | number literal | `0)` |
| `[23]` | call/expression | `prop("Data"` |
| `[24]` | string literal | `"string"` |
| `[25]` | string literal | `"")` |
| `[26]` | call/expression | `prop("Warp Out"` |
| `[27]` | string literal | `"bool"` |
| `[28]` | expression/reference | `false)` |

### `members` *(line 251)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Incoming Data"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Direction"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"Down"` |
| `[7]` | string literal | `"Direction")` |
| `[8]` | call/expression | `prop("Warp In"` |
| `[9]` | string literal | `"bool"` |
| `[10]` | expression/reference | `false)` |
| `[11]` | call/expression | `prop("Arrival Animation"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Dont Teleport"` |
| `[15]` | string literal | `"bool"` |
| `[16]` | expression/reference | `false)` |
| `[17]` | call/expression | `prop("Target Area"` |
| `[18]` | string literal | `"string"` |
| `[19]` | string literal | `"")` |
| `[20]` | call/expression | `prop("Target Object"` |
| `[21]` | string literal | `"string"` |
| `[22]` | string literal | `"")` |
| `[23]` | call/expression | `prop("Leave Animation"` |
| `[24]` | string literal | `"string"` |
| `[25]` | string literal | `"")` |

### `members` *(line 265)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Incoming Data"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Direction"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"Down"` |
| `[7]` | string literal | `"Direction")` |
| `[8]` | call/expression | `prop("Warp In"` |
| `[9]` | string literal | `"bool"` |
| `[10]` | expression/reference | `false)` |
| `[11]` | call/expression | `prop("Arrival Animation"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Dont Teleport"` |
| `[15]` | string literal | `"bool"` |
| `[16]` | expression/reference | `false)` |
| `[17]` | call/expression | `prop("Target Area"` |
| `[18]` | string literal | `"string"` |
| `[19]` | string literal | `"")` |
| `[20]` | call/expression | `prop("Target Object"` |
| `[21]` | string literal | `"string"` |
| `[22]` | string literal | `"")` |
| `[23]` | call/expression | `prop("Leave Animation"` |
| `[24]` | string literal | `"string"` |
| `[25]` | string literal | `"")` |

### `members` *(line 279)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Incoming Data"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Direction"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"Down"` |
| `[7]` | string literal | `"Direction")` |
| `[8]` | call/expression | `prop("Warp In"` |
| `[9]` | string literal | `"bool"` |
| `[10]` | expression/reference | `false)` |
| `[11]` | call/expression | `prop("Arrival Animation"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Dont Teleport"` |
| `[15]` | string literal | `"bool"` |
| `[16]` | expression/reference | `false)` |
| `[17]` | call/expression | `prop("Activation Radius"` |
| `[18]` | string literal | `"number"` |
| `[19]` | number literal | `1)` |
| `[20]` | call/expression | `prop("Target Area"` |
| `[21]` | string literal | `"string"` |
| `[22]` | string literal | `"")` |
| `[23]` | call/expression | `prop("Target Object"` |
| `[24]` | string literal | `"string"` |
| `[25]` | string literal | `"")` |
| `[26]` | call/expression | `prop("Leave Animation"` |
| `[27]` | string literal | `"string"` |
| `[28]` | string literal | `"")` |

### `members` *(line 294)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Direction"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"Down"` |
| `[4]` | string literal | `"Direction")` |
| `[5]` | call/expression | `prop("Asset Name"` |
| `[6]` | string literal | `"string"` |
| `[7]` | string literal | `"")` |
| `[8]` | call/expression | `prop("Animation Name"` |
| `[9]` | string literal | `"string"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Mug Animation Name"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Dont Face Player"` |
| `[15]` | string literal | `"bool"` |
| `[16]` | expression/reference | `false)` |
| `[17]` | call/expression | `prop("First Dialogue"` |
| `[18]` | string literal | `"object"` |
| `[19]` | string literal | `"")` |
| `[20]` | call/expression | `prop("Cutscene"` |
| `[21]` | string literal | `"string"` |
| `[22]` | string literal | `"")` |
| `[23]` | call/expression | `prop("Next Waypoint 1"` |
| `[24]` | string literal | `"object"` |
| `[25]` | string literal | `"")` |
| `[26]` | call/expression | `prop("Player Exclusive"` |
| `[27]` | string literal | `"bool"` |
| `[28]` | expression/reference | `false)` |
| `[29]` | call/expression | `prop("Quest NPC"` |
| `[30]` | string literal | `"bool"` |
| `[31]` | expression/reference | `false)` |
| `[32]` | call/expression | `prop("Quest Exclusive"` |
| `[33]` | string literal | `"string"` |
| `[34]` | string literal | `"")` |
| `[35]` | call/expression | `prop("Quest State"` |
| `[36]` | string literal | `"string"` |
| `[37]` | string literal | `"active")` |
| `[38]` | call/expression | `prop("Template Only"` |
| `[39]` | string literal | `"bool"` |
| `[40]` | expression/reference | `false)` |

### `members` *(line 313)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Direction"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"Down"` |
| `[4]` | string literal | `"Direction")` |
| `[5]` | call/expression | `prop("Asset Name"` |
| `[6]` | string literal | `"string"` |
| `[7]` | string literal | `"male-navi-exe6_teal")` |
| `[8]` | call/expression | `prop("Animation Name"` |
| `[9]` | string literal | `"string"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Mug Animation Name"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Dont Face Player"` |
| `[15]` | string literal | `"bool"` |
| `[16]` | expression/reference | `false)` |
| `[17]` | call/expression | `prop("First Dialogue"` |
| `[18]` | string literal | `"object"` |
| `[19]` | string literal | `"")` |
| `[20]` | call/expression | `prop("Next Waypoint 1"` |
| `[21]` | string literal | `"object"` |
| `[22]` | string literal | `"")` |
| `[23]` | call/expression | `prop("Player Exclusive"` |
| `[24]` | string literal | `"bool"` |
| `[25]` | expression/reference | `false)` |
| `[26]` | call/expression | `prop("Quest NPC"` |
| `[27]` | string literal | `"bool"` |
| `[28]` | expression/reference | `false)` |
| `[29]` | call/expression | `prop("Quest Exclusive"` |
| `[30]` | string literal | `"string"` |
| `[31]` | string literal | `"")` |
| `[32]` | call/expression | `prop("Quest State"` |
| `[33]` | string literal | `"string"` |
| `[34]` | string literal | `"active")` |
| `[35]` | call/expression | `prop("Collision Enabled"` |
| `[36]` | string literal | `"bool"` |
| `[37]` | expression/reference | `true)` |
| `[38]` | call/expression | `prop("Collision Width"` |
| `[39]` | string literal | `"number"` |
| `[40]` | number literal | `1.5)` |
| `[41]` | call/expression | `prop("Collision Height"` |
| `[42]` | string literal | `"number"` |
| `[43]` | number literal | `1.5)` |
| `[44]` | call/expression | `prop("Push Distance"` |
| `[45]` | string literal | `"number"` |
| `[46]` | number literal | `1.0)` |
| `[47]` | call/expression | `prop("Push Duration"` |
| `[48]` | string literal | `"number"` |
| `[49]` | number literal | `0.28)` |
| `[50]` | call/expression | `prop("Push Cooldown"` |
| `[51]` | string literal | `"number"` |
| `[52]` | number literal | `0.75)` |
| `[53]` | call/expression | `prop("Move Animation State"` |
| `[54]` | string literal | `"string"` |
| `[55]` | string literal | `"MOVE")` |
| `[56]` | call/expression | `prop("Template Only"` |
| `[57]` | string literal | `"bool"` |
| `[58]` | expression/reference | `false)` |

### `members` *(line 338)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Attached NPC"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Behavior"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"Pushback")` |
| `[7]` | call/expression | `prop("Enabled"` |
| `[8]` | string literal | `"bool"` |
| `[9]` | expression/reference | `true)` |
| `[10]` | call/expression | `prop("Collision Width"` |
| `[11]` | string literal | `"number"` |
| `[12]` | number literal | `1.5)` |
| `[13]` | call/expression | `prop("Collision Height"` |
| `[14]` | string literal | `"number"` |
| `[15]` | number literal | `1.5)` |
| `[16]` | call/expression | `prop("Push Distance"` |
| `[17]` | string literal | `"number"` |
| `[18]` | number literal | `1.0)` |
| `[19]` | call/expression | `prop("Push Duration"` |
| `[20]` | string literal | `"number"` |
| `[21]` | number literal | `0.28)` |
| `[22]` | call/expression | `prop("Push Cooldown"` |
| `[23]` | string literal | `"number"` |
| `[24]` | number literal | `0.75)` |
| `[25]` | call/expression | `prop("Move Animation State"` |
| `[26]` | string literal | `"string"` |
| `[27]` | string literal | `"MOVE")` |

### `members` *(line 353)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("NPC Template"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Trigger Radius"` |
| `[5]` | string literal | `"number"` |
| `[6]` | number literal | `0)` |
| `[7]` | call/expression | `prop("Spawn Mode"` |
| `[8]` | string literal | `"string"` |
| `[9]` | string literal | `"Once"` |
| `[10]` | string literal | `"NPCSpawnMode")` |
| `[11]` | call/expression | `prop("Spawn Interval"` |
| `[12]` | string literal | `"number"` |
| `[13]` | number literal | `3)` |
| `[14]` | call/expression | `prop("Max Alive"` |
| `[15]` | string literal | `"number"` |
| `[16]` | number literal | `0)` |
| `[17]` | call/expression | `prop("Once"` |
| `[18]` | string literal | `"bool"` |
| `[19]` | expression/reference | `false)` |
| `[20]` | call/expression | `prop("Warp Out At End"` |
| `[21]` | string literal | `"bool"` |
| `[22]` | expression/reference | `false)` |
| `[23]` | call/expression | `prop("Warp Out Delay"` |
| `[24]` | string literal | `"number"` |
| `[25]` | number literal | `0)` |
| `[26]` | call/expression | `prop("Warp Out Animation"` |
| `[27]` | string literal | `"string"` |
| `[28]` | string literal | `"")` |
| `[29]` | call/expression | `prop("Warp Out Animation Duration"` |
| `[30]` | string literal | `"number"` |
| `[31]` | number literal | `0.5)` |

### `members` *(line 369)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Direction"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"Down"` |
| `[4]` | string literal | `"Direction")` |
| `[5]` | call/expression | `prop("Asset Name"` |
| `[6]` | string literal | `"string"` |
| `[7]` | string literal | `"male-navi-exe6_teal")` |
| `[8]` | call/expression | `prop("Animation Name"` |
| `[9]` | string literal | `"string"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Mugshot"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Mug Animation Name"` |
| `[15]` | string literal | `"string"` |
| `[16]` | string literal | `"")` |
| `[17]` | call/expression | `prop("Dont Face Player"` |
| `[18]` | string literal | `"bool"` |
| `[19]` | expression/reference | `false)` |
| `[20]` | call/expression | `prop("Instance Map"` |
| `[21]` | string literal | `"string"` |
| `[22]` | string literal | `"footbomb")` |
| `[23]` | call/expression | `prop("Points to Win"` |
| `[24]` | string literal | `"number"` |
| `[25]` | number literal | `10)` |

### `members` *(line 383)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Wait Time"` |
| `[2]` | string literal | `"number"` |
| `[3]` | number literal | `0)` |
| `[4]` | call/expression | `prop("Direction"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `""` |
| `[7]` | string literal | `"Direction")` |
| `[8]` | call/expression | `prop("Waypoint Type"` |
| `[9]` | string literal | `"string"` |
| `[10]` | string literal | `"first"` |
| `[11]` | string literal | `"WaypointType")` |
| `[12]` | call/expression | `prop("Date"` |
| `[13]` | string literal | `"string"` |
| `[14]` | string literal | `"")` |
| `[15]` | call/expression | `prop("Move Animation"` |
| `[16]` | string literal | `"string"` |
| `[17]` | string literal | `"")` |
| `[18]` | call/expression | `prop("Move Loop"` |
| `[19]` | string literal | `"bool"` |
| `[20]` | expression/reference | `true)` |
| `[21]` | call/expression | `prop("Move Duration"` |
| `[22]` | string literal | `"number"` |
| `[23]` | number literal | `0)` |
| `[24]` | call/expression | `prop("Move Direction"` |
| `[25]` | string literal | `"string"` |
| `[26]` | string literal | `""` |
| `[27]` | string literal | `"Direction")` |
| `[28]` | call/expression | `prop("Wait Animation"` |
| `[29]` | string literal | `"string"` |
| `[30]` | string literal | `"")` |
| `[31]` | call/expression | `prop("Wait Loop"` |
| `[32]` | string literal | `"bool"` |
| `[33]` | expression/reference | `true)` |
| `[34]` | call/expression | `prop("Next Waypoint 1"` |
| `[35]` | string literal | `"object"` |
| `[36]` | string literal | `"")` |
| `[37]` | call/expression | `prop("Next Waypoint 2"` |
| `[38]` | string literal | `"object"` |
| `[39]` | string literal | `"")` |
| `[40]` | call/expression | `prop("Next Waypoint 3"` |
| `[41]` | string literal | `"object"` |
| `[42]` | string literal | `"")` |
| `[43]` | call/expression | `prop("Next Waypoint 4"` |
| `[44]` | string literal | `"object"` |
| `[45]` | string literal | `"")` |
| `[46]` | call/expression | `prop("Next Waypoint 5"` |
| `[47]` | string literal | `"object"` |
| `[48]` | string literal | `"")` |

### `members` *(line 404)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Radius"` |
| `[2]` | string literal | `"number"` |
| `[3]` | number literal | `1)` |
| `[4]` | call/expression | `prop("Name"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"")` |
| `[7]` | call/expression | `prop("Path"` |
| `[8]` | string literal | `"file"` |
| `[9]` | string literal | `"")` |
| `[10]` | call/expression | `prop("Once"` |
| `[11]` | string literal | `"bool"` |
| `[12]` | expression/reference | `false)` |

### `members` *(line 414)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `members` *(line 419)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Name"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Type"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"item"` |
| `[7]` | string literal | `"ItemType")` |
| `[8]` | call/expression | `prop("Description"` |
| `[9]` | string literal | `"string"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Amount"` |
| `[12]` | string literal | `"number"` |
| `[13]` | number literal | `1)` |
| `[14]` | call/expression | `prop("Price"` |
| `[15]` | string literal | `"number"` |
| `[16]` | number literal | `999999)` |

### `members` *(line 430)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Dialogue Type"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"first"` |
| `[4]` | string literal | `"DialogueType")` |
| `[5]` | call/expression | `prop("Event Name"` |
| `[6]` | string literal | `"string"` |
| `[7]` | string literal | `"")` |
| `[8]` | call/expression | `prop("Mugshot"` |
| `[9]` | string literal | `"string"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Text 1"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Text 2"` |
| `[15]` | string literal | `"string"` |
| `[16]` | string literal | `"")` |
| `[17]` | call/expression | `prop("Text 3"` |
| `[18]` | string literal | `"string"` |
| `[19]` | string literal | `"")` |
| `[20]` | call/expression | `prop("Next 1"` |
| `[21]` | string literal | `"object"` |
| `[22]` | string literal | `"")` |
| `[23]` | call/expression | `prop("Next 2"` |
| `[24]` | string literal | `"object"` |
| `[25]` | string literal | `"")` |
| `[26]` | call/expression | `prop("Next 3"` |
| `[27]` | string literal | `"object"` |
| `[28]` | string literal | `"")` |
| `[29]` | call/expression | `prop("Next 4"` |
| `[30]` | string literal | `"object"` |
| `[31]` | string literal | `"")` |
| `[32]` | call/expression | `prop("Next 5"` |
| `[33]` | string literal | `"object"` |
| `[34]` | string literal | `"")` |
| `[35]` | call/expression | `prop("Item 1"` |
| `[36]` | string literal | `"object"` |
| `[37]` | string literal | `"")` |
| `[38]` | call/expression | `prop("Item 2"` |
| `[39]` | string literal | `"object"` |
| `[40]` | string literal | `"")` |
| `[41]` | call/expression | `prop("Take Item"` |
| `[42]` | string literal | `"bool"` |
| `[43]` | expression/reference | `false)` |
| `[44]` | call/expression | `prop("Date"` |
| `[45]` | string literal | `"string"` |
| `[46]` | string literal | `"")` |
| `[47]` | call/expression | `prop("Quest Name"` |
| `[48]` | string literal | `"string"` |
| `[49]` | string literal | `"")` |
| `[50]` | call/expression | `prop("Event Value"` |
| `[51]` | string literal | `"string"` |
| `[52]` | string literal | `"")` |
| `[53]` | call/expression | `prop("Dont Notify"` |
| `[54]` | string literal | `"bool"` |
| `[55]` | expression/reference | `false)` |
| `[56]` | call/expression | `prop("Email Id"` |
| `[57]` | string literal | `"string"` |
| `[58]` | string literal | `"")` |
| `[59]` | call/expression | `prop("Email Icon"` |
| `[60]` | string literal | `"number"` |
| `[61]` | number literal | `1)` |
| `[62]` | call/expression | `prop("Email Title"` |
| `[63]` | string literal | `"string"` |
| `[64]` | string literal | `"Mail")` |
| `[65]` | call/expression | `prop("Email From"` |
| `[66]` | string literal | `"string"` |
| `[67]` | string literal | `"???")` |
| `[68]` | call/expression | `prop("Body 1"` |
| `[69]` | string literal | `"string"` |
| `[70]` | string literal | `"")` |
| `[71]` | call/expression | `prop("Body 2"` |
| `[72]` | string literal | `"string"` |
| `[73]` | string literal | `"")` |
| `[74]` | call/expression | `prop("Body 3"` |
| `[75]` | string literal | `"string"` |
| `[76]` | string literal | `"")` |
| `[77]` | call/expression | `prop("Body 4"` |
| `[78]` | string literal | `"string"` |
| `[79]` | string literal | `"")` |
| `[80]` | call/expression | `prop("Body 5"` |
| `[81]` | string literal | `"string"` |
| `[82]` | string literal | `"")` |
| `[83]` | call/expression | `prop("Body 6"` |
| `[84]` | string literal | `"string"` |
| `[85]` | string literal | `"")` |
| `[86]` | call/expression | `prop("Body 7"` |
| `[87]` | string literal | `"string"` |
| `[88]` | string literal | `"")` |
| `[89]` | call/expression | `prop("Body 8"` |
| `[90]` | string literal | `"string"` |
| `[91]` | string literal | `"")` |
| `[92]` | call/expression | `prop("Body 9"` |
| `[93]` | string literal | `"string"` |
| `[94]` | string literal | `"")` |
| `[95]` | call/expression | `prop("Body 10"` |
| `[96]` | string literal | `"string"` |
| `[97]` | string literal | `"")` |
| `[98]` | call/expression | `prop("Notify Delay"` |
| `[99]` | string literal | `"number"` |
| `[100]` | number literal | `1.5)` |
| `[101]` | call/expression | `prop("Notify Message"` |
| `[102]` | string literal | `"string"` |
| `[103]` | string literal | `"Looks like you got an e-mail.")` |
| `[104]` | call/expression | `prop("Mug Texture Path"` |
| `[105]` | string literal | `"string"` |
| `[106]` | string literal | `"")` |
| `[107]` | call/expression | `prop("Mug Animation Path"` |
| `[108]` | string literal | `"string"` |
| `[109]` | string literal | `"")` |
| `[110]` | call/expression | `prop("Persist"` |
| `[111]` | string literal | `"bool"` |
| `[112]` | expression/reference | `true)` |
| `[113]` | call/expression | `prop("Encounter Name"` |
| `[114]` | string literal | `"string"` |
| `[115]` | string literal | `"")` |
| `[116]` | call/expression | `prop("Failure Message"` |
| `[117]` | string literal | `"string"` |
| `[118]` | string literal | `"")` |
| `[119]` | call/expression | `prop("Kick On Loss"` |
| `[120]` | string literal | `"bool"` |
| `[121]` | expression/reference | `true)` |

### `members` *(line 476)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Target"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Follow"` |
| `[5]` | string literal | `"bool"` |
| `[6]` | expression/reference | `false)` |
| `[7]` | call/expression | `prop("Once"` |
| `[8]` | string literal | `"bool"` |
| `[9]` | expression/reference | `false)` |

### `members` *(line 485)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Rush Object"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Direction"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"Down Left"` |
| `[7]` | string literal | `"Direction")` |

### `members` *(line 493)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Mode"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"Compress"` |
| `[4]` | string literal | `"CompressionMode")` |

### `members` *(line 500)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `members` *(line 505)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Asset Name"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Direction"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"Down"` |
| `[7]` | string literal | `"Direction")` |
| `[8]` | call/expression | `prop("Animation Name"` |
| `[9]` | string literal | `"string"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Mug Animation Name"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Active Animation"` |
| `[15]` | string literal | `"string"` |
| `[16]` | string literal | `"ACTIVE")` |
| `[17]` | call/expression | `prop("Inactive Animation"` |
| `[18]` | string literal | `"string"` |
| `[19]` | string literal | `"INACTIVE")` |
| `[20]` | call/expression | `prop("Activated Animation"` |
| `[21]` | string literal | `"string"` |
| `[22]` | string literal | `"")` |
| `[23]` | call/expression | `prop("Deactivated Animation"` |
| `[24]` | string literal | `"string"` |
| `[25]` | string literal | `"")` |
| `[26]` | call/expression | `prop("Activation Animation Duration"` |
| `[27]` | string literal | `"number"` |
| `[28]` | number literal | `0.5)` |
| `[29]` | call/expression | `prop("Deactivation Animation Duration"` |
| `[30]` | string literal | `"number"` |
| `[31]` | number literal | `0.5)` |

### `members` *(line 521)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Bot Details"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Next 1"` |
| `[5]` | string literal | `"object"` |
| `[6]` | string literal | `"")` |
| `[7]` | call/expression | `prop("Button Behavior"` |
| `[8]` | string literal | `"string"` |
| `[9]` | string literal | `"One-Time"` |
| `[10]` | string literal | `"ButtonBehavior")` |
| `[11]` | call/expression | `prop("Script Path"` |
| `[12]` | string literal | `"file"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Trigger Object"` |
| `[15]` | string literal | `"object"` |
| `[16]` | string literal | `"")` |
| `[17]` | call/expression | `prop("Button Activated Behavior"` |
| `[18]` | string literal | `"object"` |
| `[19]` | string literal | `"")` |
| `[20]` | call/expression | `prop("Button Deactivated Behavior"` |
| `[21]` | string literal | `"object"` |
| `[22]` | string literal | `"")` |
| `[23]` | call/expression | `prop("Button Chain Type"` |
| `[24]` | string literal | `"string"` |
| `[25]` | string literal | `"Any"` |
| `[26]` | string literal | `"ButtonChainType")` |
| `[27]` | call/expression | `prop("Trigger Type"` |
| `[28]` | string literal | `"string"` |
| `[29]` | string literal | `"rect"` |
| `[30]` | string literal | `"TriggerShape")` |
| `[31]` | call/expression | `prop("Trigger Width"` |
| `[32]` | string literal | `"number"` |
| `[33]` | number literal | `4)` |
| `[34]` | call/expression | `prop("Trigger Height"` |
| `[35]` | string literal | `"number"` |
| `[36]` | number literal | `4)` |
| `[37]` | call/expression | `prop("Activated Time"` |
| `[38]` | string literal | `"number"` |
| `[39]` | number literal | `1)` |
| `[40]` | call/expression | `prop("Bots Can Trigger"` |
| `[41]` | string literal | `"bool"` |
| `[42]` | expression/reference | `false)` |
| `[43]` | call/expression | `prop("Cinematic Unlock"` |
| `[44]` | string literal | `"bool"` |
| `[45]` | expression/reference | `false)` |
| `[46]` | call/expression | `prop("Cinematic Duration"` |
| `[47]` | string literal | `"number"` |
| `[48]` | number literal | `1.0)` |
| `[49]` | call/expression | `prop("Cinematic on Bot Trigger"` |
| `[50]` | string literal | `"bool"` |
| `[51]` | expression/reference | `false)` |

### `members` *(line 543)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Bot Details"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Button Behavior"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"One-Time"` |
| `[7]` | string literal | `"ButtonBehavior")` |
| `[8]` | call/expression | `prop("Script Path"` |
| `[9]` | string literal | `"file"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Trigger Object"` |
| `[12]` | string literal | `"object"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Trigger Type"` |
| `[15]` | string literal | `"string"` |
| `[16]` | string literal | `"rect"` |
| `[17]` | string literal | `"TriggerShape")` |
| `[18]` | call/expression | `prop("Trigger Width"` |
| `[19]` | string literal | `"number"` |
| `[20]` | number literal | `4)` |
| `[21]` | call/expression | `prop("Trigger Height"` |
| `[22]` | string literal | `"number"` |
| `[23]` | number literal | `4)` |
| `[24]` | call/expression | `prop("Activated Time"` |
| `[25]` | string literal | `"number"` |
| `[26]` | number literal | `1)` |
| `[27]` | call/expression | `prop("Bots Can Trigger"` |
| `[28]` | string literal | `"bool"` |
| `[29]` | expression/reference | `false)` |

### `members` *(line 558)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Unlock This"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Unlock Permanently"` |
| `[5]` | string literal | `"bool"` |
| `[6]` | expression/reference | `false)` |
| `[7]` | call/expression | `prop("Area Wide"` |
| `[8]` | string literal | `"bool"` |
| `[9]` | expression/reference | `false)` |

### `members` *(line 567)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Relock This"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Area Wide"` |
| `[5]` | string literal | `"bool"` |
| `[6]` | expression/reference | `false)` |

### `members` *(line 575)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Trigger Type"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"rect"` |
| `[4]` | string literal | `"TriggerShape")` |

### `members` *(line 582)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Group ID"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Group Mode"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"all_active"` |
| `[7]` | string literal | `"ButtonGroupMode")` |
| `[8]` | call/expression | `prop("Button 1"` |
| `[9]` | string literal | `"object"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Forbidden Button 1"` |
| `[12]` | string literal | `"object"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Unlock Checkpoint 1"` |
| `[15]` | string literal | `"object"` |
| `[16]` | string literal | `"")` |
| `[17]` | call/expression | `prop("Unlock Permanently"` |
| `[18]` | string literal | `"bool"` |
| `[19]` | expression/reference | `true)` |
| `[20]` | call/expression | `prop("Unlock Area Wide"` |
| `[21]` | string literal | `"bool"` |
| `[22]` | expression/reference | `false)` |
| `[23]` | call/expression | `prop("Relock Checkpoint 1"` |
| `[24]` | string literal | `"object"` |
| `[25]` | string literal | `"")` |
| `[26]` | call/expression | `prop("Relock Area Wide"` |
| `[27]` | string literal | `"bool"` |
| `[28]` | expression/reference | `false)` |
| `[29]` | call/expression | `prop("Cinematic Unlock"` |
| `[30]` | string literal | `"bool"` |
| `[31]` | expression/reference | `false)` |
| `[32]` | call/expression | `prop("Cinematic Duration"` |
| `[33]` | string literal | `"number"` |
| `[34]` | number literal | `1.0)` |
| `[35]` | call/expression | `prop("Cinematic on Bot Trigger"` |
| `[36]` | string literal | `"bool"` |
| `[37]` | expression/reference | `false)` |

### `members` *(line 600)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Button 1"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Forbidden Button 1"` |
| `[5]` | string literal | `"object"` |
| `[6]` | string literal | `"")` |
| `[7]` | call/expression | `prop("Unlock Checkpoint 1"` |
| `[8]` | string literal | `"object"` |
| `[9]` | string literal | `"")` |
| `[10]` | call/expression | `prop("Unlock Permanently"` |
| `[11]` | string literal | `"bool"` |
| `[12]` | expression/reference | `true)` |
| `[13]` | call/expression | `prop("Unlock Area Wide"` |
| `[14]` | string literal | `"bool"` |
| `[15]` | expression/reference | `false)` |
| `[16]` | call/expression | `prop("Relock Checkpoint 1"` |
| `[17]` | string literal | `"object"` |
| `[18]` | string literal | `"")` |
| `[19]` | call/expression | `prop("Relock Area Wide"` |
| `[20]` | string literal | `"bool"` |
| `[21]` | expression/reference | `false)` |

### `members` *(line 613)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Group ID"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Combo Mode"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"Inclusive"` |
| `[7]` | string literal | `"ButtonComboMode")` |
| `[8]` | call/expression | `prop("Button Combo 1"` |
| `[9]` | string literal | `"object"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Cinematic Unlock"` |
| `[12]` | string literal | `"bool"` |
| `[13]` | expression/reference | `false)` |
| `[14]` | call/expression | `prop("Cinematic Duration"` |
| `[15]` | string literal | `"number"` |
| `[16]` | number literal | `1.0)` |
| `[17]` | call/expression | `prop("Cinematic on Bot Trigger"` |
| `[18]` | string literal | `"bool"` |
| `[19]` | expression/reference | `false)` |

### `members` *(line 625)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Source Button"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Event"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"activated"` |
| `[7]` | string literal | `"ButtonEffectEvent")` |
| `[8]` | call/expression | `prop("Target Button"` |
| `[9]` | string literal | `"object"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Action"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"activate"` |
| `[14]` | string literal | `"ButtonEffectAction")` |

### `members` *(line 635)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Button Group"` |
| `[2]` | string literal | `"object"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Event"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"completed"` |
| `[7]` | string literal | `"ButtonGroupEvent")` |
| `[8]` | call/expression | `prop("Target Button"` |
| `[9]` | string literal | `"object"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Action"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"activate"` |
| `[14]` | string literal | `"ButtonEffectAction")` |

### `members` *(line 645)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Name"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Start Step"` |
| `[5]` | string literal | `"object"` |
| `[6]` | string literal | `"")` |
| `[7]` | call/expression | `prop("Trigger Radius"` |
| `[8]` | string literal | `"number"` |
| `[9]` | number literal | `0)` |
| `[10]` | call/expression | `prop("Once"` |
| `[11]` | string literal | `"bool"` |
| `[12]` | expression/reference | `false)` |

### `members` *(line 655)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Type"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"Wait"` |
| `[4]` | string literal | `"CutsceneStepType")` |
| `[5]` | call/expression | `prop("Next Step"` |
| `[6]` | string literal | `"object"` |
| `[7]` | string literal | `"")` |
| `[8]` | call/expression | `prop("Next 1"` |
| `[9]` | string literal | `"object"` |
| `[10]` | string literal | `"")` |
| `[11]` | call/expression | `prop("Next 2"` |
| `[12]` | string literal | `"object"` |
| `[13]` | string literal | `"")` |
| `[14]` | call/expression | `prop("Next 3"` |
| `[15]` | string literal | `"object"` |
| `[16]` | string literal | `"")` |
| `[17]` | call/expression | `prop("Fail Next"` |
| `[18]` | string literal | `"object"` |
| `[19]` | string literal | `"")` |
| `[20]` | call/expression | `prop("Wait Seconds"` |
| `[21]` | string literal | `"number"` |
| `[22]` | number literal | `1)` |
| `[23]` | call/expression | `prop("Actor"` |
| `[24]` | string literal | `"object"` |
| `[25]` | string literal | `"")` |
| `[26]` | call/expression | `prop("Target"` |
| `[27]` | string literal | `"object"` |
| `[28]` | string literal | `"")` |
| `[29]` | call/expression | `prop("Target X"` |
| `[30]` | string literal | `"number"` |
| `[31]` | number literal | `0)` |
| `[32]` | call/expression | `prop("Target Y"` |
| `[33]` | string literal | `"number"` |
| `[34]` | number literal | `0)` |
| `[35]` | call/expression | `prop("Target Z"` |
| `[36]` | string literal | `"number"` |
| `[37]` | number literal | `0)` |
| `[38]` | call/expression | `prop("Move Animation"` |
| `[39]` | string literal | `"string"` |
| `[40]` | string literal | `"")` |
| `[41]` | call/expression | `prop("Move Direction"` |
| `[42]` | string literal | `"string"` |
| `[43]` | string literal | `""` |
| `[44]` | string literal | `"Direction")` |
| `[45]` | call/expression | `prop("Move Speed"` |
| `[46]` | string literal | `"number"` |
| `[47]` | number literal | `3)` |
| `[48]` | call/expression | `prop("End Animation"` |
| `[49]` | string literal | `"string"` |
| `[50]` | string literal | `"")` |
| `[51]` | call/expression | `prop("End Direction"` |
| `[52]` | string literal | `"string"` |
| `[53]` | string literal | `""` |
| `[54]` | string literal | `"Direction")` |
| `[55]` | call/expression | `prop("End Hold Seconds"` |
| `[56]` | string literal | `"number"` |
| `[57]` | number literal | `0)` |
| `[58]` | call/expression | `prop("End Loop"` |
| `[59]` | string literal | `"bool"` |
| `[60]` | expression/reference | `true)` |
| `[61]` | call/expression | `prop("Animation"` |
| `[62]` | string literal | `"string"` |
| `[63]` | string literal | `"")` |
| `[64]` | call/expression | `prop("Direction"` |
| `[65]` | string literal | `"string"` |
| `[66]` | string literal | `""` |
| `[67]` | string literal | `"Direction")` |
| `[68]` | call/expression | `prop("Loop"` |
| `[69]` | string literal | `"bool"` |
| `[70]` | expression/reference | `true)` |
| `[71]` | call/expression | `prop("Hold Seconds"` |
| `[72]` | string literal | `"number"` |
| `[73]` | number literal | `0)` |
| `[74]` | call/expression | `prop("Speaker"` |
| `[75]` | string literal | `"object"` |
| `[76]` | string literal | `"")` |
| `[77]` | call/expression | `prop("Mugshot Override"` |
| `[78]` | string literal | `"string"` |
| `[79]` | string literal | `"")` |
| `[80]` | call/expression | `prop("Text"` |
| `[81]` | string literal | `"string"` |
| `[82]` | string literal | `"")` |
| `[83]` | call/expression | `prop("Question"` |
| `[84]` | string literal | `"string"` |
| `[85]` | string literal | `"")` |
| `[86]` | call/expression | `prop("Option 1"` |
| `[87]` | string literal | `"string"` |
| `[88]` | string literal | `"")` |
| `[89]` | call/expression | `prop("Option 2"` |
| `[90]` | string literal | `"string"` |
| `[91]` | string literal | `"")` |
| `[92]` | call/expression | `prop("Option 3"` |
| `[93]` | string literal | `"string"` |
| `[94]` | string literal | `"")` |
| `[95]` | call/expression | `prop("Message"` |
| `[96]` | string literal | `"string"` |
| `[97]` | string literal | `"")` |
| `[98]` | call/expression | `prop("Expected"` |
| `[99]` | string literal | `"string"` |
| `[100]` | string literal | `"")` |
| `[101]` | call/expression | `prop("Sound Path"` |
| `[102]` | string literal | `"string"` |
| `[103]` | string literal | `"")` |
| `[104]` | call/expression | `prop("Color R"` |
| `[105]` | string literal | `"number"` |
| `[106]` | number literal | `0)` |
| `[107]` | call/expression | `prop("Color G"` |
| `[108]` | string literal | `"number"` |
| `[109]` | number literal | `0)` |
| `[110]` | call/expression | `prop("Color B"` |
| `[111]` | string literal | `"number"` |
| `[112]` | number literal | `0)` |
| `[113]` | call/expression | `prop("Color A"` |
| `[114]` | string literal | `"number"` |
| `[115]` | number literal | `255)` |
| `[116]` | call/expression | `prop("Duration"` |
| `[117]` | string literal | `"number"` |
| `[118]` | number literal | `0.8)` |
| `[119]` | call/expression | `prop("Event Name"` |
| `[120]` | string literal | `"string"` |
| `[121]` | string literal | `"")` |

### `members` *(line 716)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Respawn Area"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Waiting Area"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"")` |
| `[7]` | call/expression | `prop("Liberation Tileset"` |
| `[8]` | string literal | `"string"` |
| `[9]` | string literal | `"")` |
| `[10]` | call/expression | `prop("Max Order Points"` |
| `[11]` | string literal | `"number"` |
| `[12]` | number literal | `9)` |
| `[13]` | call/expression | `prop("Target Phase Count"` |
| `[14]` | string literal | `"number"` |
| `[15]` | number literal | `13)` |
| `[16]` | call/expression | `prop("Target Player Count"` |
| `[17]` | string literal | `"number"` |
| `[18]` | number literal | `3)` |
| `[19]` | call/expression | `prop("Minimum Target Phase Count"` |
| `[20]` | string literal | `"number"` |
| `[21]` | number literal | `1)` |
| `[22]` | call/expression | `prop("Victory Lap Song"` |
| `[23]` | string literal | `"string"` |
| `[24]` | string literal | `"")` |
| `[25]` | call/expression | `prop("Honor HPMem"` |
| `[26]` | string literal | `"bool"` |
| `[27]` | expression/reference | `false)` |

### `members` *(line 734)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Liberation Map File Name"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |

### `useAs` *(line 743)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"object"` |

### `members` *(line 744)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Boss"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Boss ID"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"")` |
| `[7]` | call/expression | `prop("Direction"` |
| `[8]` | string literal | `"string"` |
| `[9]` | string literal | `"Down"` |
| `[10]` | string literal | `"Direction")` |
| `[11]` | call/expression | `prop("Spawn Mode"` |
| `[12]` | string literal | `"string"` |
| `[13]` | string literal | `"Immediate"` |
| `[14]` | string literal | `"BossSpawnMode")` |
| `[15]` | call/expression | `prop("Trigger Boss"` |
| `[16]` | string literal | `"object"` |
| `[17]` | string literal | `"")` |
| `[18]` | call/expression | `prop("Spawn Offset X"` |
| `[19]` | string literal | `"number"` |
| `[20]` | number literal | `0)` |
| `[21]` | call/expression | `prop("Spawn Offset Y"` |
| `[22]` | string literal | `"number"` |
| `[23]` | number literal | `0)` |
| `[24]` | call/expression | `prop("Spawn Offset Z"` |
| `[25]` | string literal | `"number"` |
| `[26]` | number literal | `0)` |
| `[27]` | call/expression | `prop("Auto Face Player"` |
| `[28]` | string literal | `"bool"` |
| `[29]` | expression/reference | `false)` |
| `[30]` | call/expression | `prop("Boss Health Override"` |
| `[31]` | string literal | `"number"` |
| `[32]` | number literal | `0)` |
| `[33]` | call/expression | `prop("Spawn Enabled"` |
| `[34]` | string literal | `"bool"` |
| `[35]` | expression/reference | `true)` |
| `[36]` | call/expression | `prop("Boss Display Name"` |
| `[37]` | string literal | `"string"` |
| `[38]` | string literal | `"")` |

### `useAs` *(line 764)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"object"` |

### `members` *(line 765)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Boss ID 1"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Boss ID 2"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"")` |

### `useAs` *(line 773)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"object"` |

### `members` *(line 774)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | call/expression | `prop("Boss ID 1"` |
| `[2]` | string literal | `"string"` |
| `[3]` | string literal | `"")` |
| `[4]` | call/expression | `prop("Boss ID 2"` |
| `[5]` | string literal | `"string"` |
| `[6]` | string literal | `"")` |
| `[7]` | call/expression | `prop("Type"` |
| `[8]` | string literal | `"string"` |
| `[9]` | string literal | `"All"` |
| `[10]` | string literal | `"BossRequirementType")` |
| `[11]` | call/expression | `prop("Shared"` |
| `[12]` | string literal | `"bool"` |
| `[13]` | expression/reference | `false)` |

### `META` *(line 786)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `classes` | table | `{ ["Checkpoint"] = { category = "gameplay", description = "Lockable Security Cube that gates progression.", numberedTemplates = { "Navi " } …` |
| `properties` | table | `{ ["Liberation Config"] = { ["Max Order Points"] = { category = "gameplay", description = "Maximum order points available in this liberation…` |

### `classes` *(line 787)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[Checkpoint]` | table | `{ category = "gameplay", description = "Lockable Security Cube that gates progression.", numberedTemplates = { "Navi " } }` |
| `[Mystery Data]` | table | `{ category = "gameplay", description = "Pickup or event; behaviour branches on `Type`." }` |
| `[Quiz List]` | table | `{ category = "dialogue", description = "Ordered chain of Quiz Question objects.", numberedTemplates = { "Next " } }` |
| `[Quiz Question]` | table | `{ category = "dialogue", description = "Single quiz entry." }` |
| `[Dialogue]` | table | `{ category = "dialogue", description = "Dialogue node. Many properties are type-specific; see the Conditional section.", numberedTemplates =…` |
| `[NPC]` | table | `{ category = "gameplay", description = "Placed non-player character. Set `Template Only` to use an NPC purely as a reference target for NPC …` |
| `[Pushback NPC]` | table | `{ category = "gameplay", description = "NPC with a moving collision zone that pushes the player." }` |
| `[NPC Spawner]` | table | `{ category = "gameplay", description = "Spawns NPCs from a template object, lets them follow a waypoint path, and optionally warps them out …` |
| `[FootBomb Controller]` | table | `{ category = "gameplay", description = "Interaction actor for the FootBomb minigame." }` |
| `[Liberation Config]` | table | `{ category = "gameplay", description = "Configuration object for a liberation mission. Liberation Tileset and Max Order Points are read from…` |
| `[Liberation Gate]` | table | `{ category = "gameplay", description = "Interactive gate that starts the liberation mission named by `Liberation Map File Name`." }` |
| `[Boss Dark Panel]` | table | `{ category = "gameplay", description = "A Liberation boss spawn point. Select an enemy template, spawn mode, optional boss dependency, posit…` |
| `[Dark Hole]` | table | `{ category = "gameplay", description = "Placed Liberation panel object. Boss ID 1 and Boss ID 2 associate this Dark Hole with one or two bos…` |
| `[Indestructible Panel]` | table | `{ category = "gameplay", description = "Placed Liberation panel object. Boss ID 1/2 define boss-group unlock requirements; Type selects All …` |
| `[Waypoint]` | table | `{ category = "gameplay", description = "Navigation node for NPCs. Move Animation handles travel; Wait Animation handles the arrival hold. Se…` |
| `[Button Bot Details]` | table | `{ category = "appearance", description = "Visual and animation configuration for an OW Button." }` |
| `[OW Button]` | table | `{ category = "gameplay", description = "A pressable button. Unlocks checkpoints through a referenced Unlock Behavior. Optionally plays a cin…` |
| `[OW Button Group Member]` | table | `{ category = "gameplay", description = "Button that participates in a Button Group or Button Combo but never unlocks checkpoints on its own.…` |
| `[Unlock Behavior]` | table | `{ category = "gameplay", description = "Defines which checkpoint a button unlocks when it becomes active." }` |
| `[Relock Behavior]` | table | `{ category = "gameplay", description = "Defines which checkpoint a button re-locks when it becomes inactive." }` |
| `[Button Trigger]` | table | `{ category = "gameplay", description = "Optional standalone trigger rectangle referenced by an OW Button." }` |
| `[Button Group]` | table | `{ category = "gameplay", description = "Group of OW Button Group Members that share a satisfaction rule; owns its own checkpoint unlocks. Op…` |
| `[Button Combo]` | table | `{ category = "gameplay", description = "One specific button pattern; owns its own checkpoint unlocks.", numberedTemplates = { "Button ", "Fo…` |
| `[Combo Button Group]` | table | `{ category = "gameplay", description = "A set of Button Combos; satisfying any one fires that combo's actions. Optionally plays a cinematic …` |
| `[Button Effect]` | table | `{ category = "gameplay", description = "One button's state transition drives another button's action." }` |
| `[Button Group Effect]` | table | `{ category = "gameplay", description = "A group's completion transition drives another button's action." }` |
| `[Cutscene]` | table | `{ category = "gameplay", description = "Named cutscene definition. Trigger via radius or script." }` |
| `[Cutscene Step]` | table | `{ category = "gameplay", description = "One action in a cutscene chain. Chain via Next Step; branch via Next N / Fail Next." }` |
| `[Compression Tile]` | table | `{ category = "advanced", description = "Changes player or area scale while standing inside." }` |
| `[Item]` | table | `{ category = "gameplay", description = "Inventory or shop item reference." }` |
| `[Rush Road]` | table | `{ category = "advanced", description = "ezrushroads interaction object." }` |

### `numberedTemplates` *(line 790)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Navi "` |

### `numberedTemplates` *(line 795)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Next "` |

### `numberedTemplates` *(line 800)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Text "` |
| `[2]` | string literal | `"Next "` |
| `[3]` | string literal | `"Item "` |
| `[4]` | string literal | `"Body "` |

### `numberedTemplates` *(line 821)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Next Waypoint "` |

### `numberedTemplates` *(line 828)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Next "` |

### `numberedTemplates` *(line 839)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Button "` |
| `[2]` | string literal | `"Forbidden Button "` |
| `[3]` | string literal | `"Unlock Checkpoint "` |
| `[4]` | string literal | `"Relock Checkpoint "` |

### `numberedTemplates` *(line 843)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Button "` |
| `[2]` | string literal | `"Forbidden Button "` |
| `[3]` | string literal | `"Unlock Checkpoint "` |
| `[4]` | string literal | `"Relock Checkpoint "` |

### `numberedTemplates` *(line 847)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Button Combo "` |

### `properties` *(line 866)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[Liberation Config]` | table | `{ ["Max Order Points"] = { category = "gameplay", description = "Maximum order points available in this liberation mission. Defaults to 9 wh…` |
| `[Liberation Gate]` | table | `{ ["Liberation Map File Name"] = { category = "gameplay", description = "Area ID of the liberation mission this gate starts. Must match the …` |
| `[Boss Dark Panel]` | table | `{ ["Boss"] = { category = "gameplay", description = "Required enemy template key registered in Liberation enemy_templates.lua." }, ["Boss ID…` |
| `[Dark Hole]` | table | `{ ["Boss ID 1"] = { category = "gameplay", description = "First boss-group identifier. This Dark Hole counts toward this boss group's On Dar…` |
| `[Indestructible Panel]` | table | `{ ["Boss ID 1"] = { category = "gameplay", description = "First boss-group identifier required to unlock this panel." }, ["Boss ID 2"] = { c…` |
| `[Checkpoint]` | table | `{ ["Password"] = { category = "gameplay", description = "If set, requires typing this password to unlock. Overrides Key Type." }, ["Key Type…` |
| `[NPC]` | table | `{ ["Direction"] = { category = "appearance", description = "Initial facing (Tiled default populates it).", required = true }, ["Asset Name"]…` |
| `[Pushback NPC]` | table | `{ ["Collision Enabled"] = { category = "gameplay", description = "Enables the push collision zone." }, ["Collision Width"] = { category = "g…` |
| `[NPC Behavior]` | table | `{ ["Attached NPC"] = { category = "gameplay", description = "Object reference to an NPC or NPC template that receives this behavior.", requi…` |
| `[NPC Spawner]` | table | `{ ["NPC Template"] = { category = "gameplay", description = "Reference to an NPC object to spawn. The referenced NPC should have `Template O…` |
| `[FootBomb Controller]` | table | `{ ["Instance Map"] = { category = "gameplay", description = "Map loaded for a match." }, ["Points to Win"] = { category = "gameplay", descri…` |
| `[Mystery Data]` | table | `{ ["Type"] = { category = "gameplay", description = "Selects the event flow." }, ["Quiz List"] = { category = "dialogue", description = "Roo…` |
| `[Dialogue]` | table | `{ ["Text 1"] = { category = "dialogue", description = "Primary text; meaning varies by Dialogue Type." }, ["Text 2"] = { category = "dialogu…` |
| `[Waypoint]` | table | `{ ["Waypoint Type"] = { category = "gameplay", description = "How the next waypoint is selected." }, ["Date"] = { category = "gameplay", con…` |
| `[Button Bot Details]` | table | `{ ["Asset Name"] = { category = "appearance", description = "Sprite asset name (no extension).", required = true }, ["Direction"] = { catego…` |
| `[OW Button]` | table | `{ ["Bot Details"] = { category = "appearance", description = "Reference to the Button Bot Details object that configures this button's appea…` |
| `[OW Button Group Member]` | table | `{ ["Bot Details"] = { category = "appearance", description = "Reference to the Button Bot Details object that configures this button's appea…` |
| `[Unlock Behavior]` | table | `{ ["Unlock This"] = { category = "gameplay", description = "Checkpoint reference this behavior unlocks.", required = true }, ["Unlock Perman…` |
| `[Relock Behavior]` | table | `{ ["Relock This"] = { category = "gameplay", description = "Checkpoint reference this behavior re-locks.", required = true }, ["Area Wide"] …` |
| `[Button Trigger]` | table | `{ ["Trigger Type"] = { category = "gameplay", description = "Rectangle vs ellipse detection shape for the referenced trigger object." }, }` |
| `[Button Group]` | table | `{ ["Group ID"] = { category = "gameplay", description = "Optional stable identifier. Falls back to the object's Tiled ID." }, ["Group Mode"]…` |
| `[Button Combo]` | table | `{ ["Button 1"] = { category = "gameplay", description = "Reference to a required OW Button Group Member. Add Button 2..N as needed.", requir…` |
| `[Combo Button Group]` | table | `{ ["Group ID"] = { category = "gameplay", description = "Optional stable identifier. Falls back to the object's Tiled ID." }, ["Combo Mode"]…` |
| `[Button Effect]` | table | `{ ["Source Button"] = { category = "gameplay", description = "Button whose state transition triggers this effect.", required = true }, ["Eve…` |
| `[Button Group Effect]` | table | `{ ["Button Group"] = { category = "gameplay", description = "Button Group (or Combo Button Group) whose completion transition triggers this …` |
| `[Cutscene]` | table | `{ ["Name"] = { category = "gameplay", description = "Unique cutscene identifier within the area.", required = true }, ["Start Step"] = { cat…` |
| `[Cutscene Step]` | table | `{ ["Type"] = { category = "gameplay", description = "Which action this step performs.", required = true }, ["Next Step"] = { category = "gam…` |

### `dependsOn` *(line 913)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Key Type"` |
| `equals` | string literal | `"item"` |

### `dependsOn` *(line 937)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Key Type"` |
| `equals` | string literal | `"navi_name"` |

### `dependsOn` *(line 941)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Key Type"` |
| `equals` | string literal | `"navi_element"` |

### `dependsOn` *(line 945)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Key Type"` |
| `equals` | string literal | `"navi_list"` |

### `dependsOn` *(line 978)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Quest Exclusive"` |

### `dependsOn` *(line 1034)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Spawn Mode"` |
| `equals` | string literal | `"Interval"` |

### `dependsOn` *(line 1038)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Spawn Mode"` |
| `equals` | string literal | `"Interval"` |

### `dependsOn` *(line 1042)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Spawn Mode"` |
| `equals` | string literal | `"Once"` |

### `dependsOn` *(line 1048)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Warp Out At End"` |

### `dependsOn` *(line 1052)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Warp Out At End"` |

### `dependsOn` *(line 1056)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Warp Out At End"` |

### `dependsOn` *(line 1073)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"quiz"` |

### `dependsOn` *(line 1076)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"quiz"` |

### `dependsOn` *(line 1079)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"quiz"` |

### `dependsOn` *(line 1082)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"quiz"` |

### `dependsOn` *(line 1085)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"quiz"` |

### `dependsOn` *(line 1090)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Cost Type"` |

### `dependsOn` *(line 1093)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Cost Type"` |

### `dependsOn` *(line 1105)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `oneOf` | table | `{ "item", "itemcheck", "shop" }` |

### `oneOf` *(line 1106)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"item"` |
| `[2]` | string literal | `"itemcheck"` |
| `[3]` | string literal | `"shop"` |

### `dependsOn` *(line 1109)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"itemcheck"` |

### `dependsOn` *(line 1112)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `oneOf` | table | `{ "before", "after" }` |

### `oneOf` *(line 1113)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"before"` |
| `[2]` | string literal | `"after"` |

### `dependsOn` *(line 1116)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `oneOf` | table | `{ "quest_switch", "quest_event", "questcheck" }` |

### `oneOf` *(line 1117)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"quest_switch"` |
| `[2]` | string literal | `"quest_event"` |
| `[3]` | string literal | `"questcheck"` |

### `dependsOn` *(line 1120)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"quest_event"` |

### `dependsOn` *(line 1123)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"email"` |

### `dependsOn` *(line 1126)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"email"` |

### `dependsOn` *(line 1129)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"email"` |

### `dependsOn` *(line 1132)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"email"` |

### `dependsOn` *(line 1135)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"email"` |

### `dependsOn` *(line 1138)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"email"` |

### `dependsOn` *(line 1141)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"email"` |

### `dependsOn` *(line 1144)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `oneOf` | table | `{ "item", "email" }` |

### `oneOf` *(line 1145)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"item"` |
| `[2]` | string literal | `"email"` |

### `dependsOn` *(line 1148)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"battle_npc"` |

### `dependsOn` *(line 1151)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"battle_npc"` |

### `dependsOn` *(line 1157)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Dialogue Type"` |
| `equals` | string literal | `"battle_npc"` |

### `dependsOn` *(line 1164)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Waypoint Type"` |
| `oneOf` | table | `{ "before", "after" }` |

### `oneOf` *(line 1165)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"before"` |
| `[2]` | string literal | `"after"` |

### `dependsOn` *(line 1174)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Move Animation"` |

### `dependsOn` *(line 1178)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Move Animation"` |

### `dependsOn` *(line 1188)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Wait Animation"` |

### `dependsOn` *(line 1232)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Button Behavior"` |
| `equals` | string literal | `"Custom"` |

### `dependsOn` *(line 1253)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Button Behavior"` |
| `equals` | string literal | `"Timed"` |

### `dependsOn` *(line 1257)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Button Behavior"` |
| `oneOf` | table | `{ "Pressure Plate", "One-Time", "Toggle", "Timed" }` |

### `oneOf` *(line 1258)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Pressure Plate"` |
| `[2]` | string literal | `"One-Time"` |
| `[3]` | string literal | `"Toggle"` |
| `[4]` | string literal | `"Timed"` |

### `dependsOn` *(line 1262)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Button Activated Behavior"` |

### `dependsOn` *(line 1266)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Cinematic Unlock"` |

### `dependsOn` *(line 1270)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Cinematic Unlock"` |

### `dependsOn` *(line 1280)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Button Behavior"` |
| `equals` | string literal | `"Custom"` |

### `dependsOn` *(line 1295)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Button Behavior"` |
| `equals` | string literal | `"Timed"` |

### `dependsOn` *(line 1299)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Button Behavior"` |
| `oneOf` | table | `{ "Pressure Plate", "One-Time", "Toggle", "Timed" }` |

### `oneOf` *(line 1300)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Pressure Plate"` |
| `[2]` | string literal | `"One-Time"` |
| `[3]` | string literal | `"Toggle"` |
| `[4]` | string literal | `"Timed"` |

### `dependsOn` *(line 1336)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Group Mode"` |
| `equals` | string literal | `"combination"` |

### `dependsOn` *(line 1351)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Unlock Checkpoint 1"` |

### `dependsOn` *(line 1355)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Cinematic Unlock"` |

### `dependsOn` *(line 1359)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Cinematic Unlock"` |

### `dependsOn` *(line 1392)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Button Combo 1"` |

### `dependsOn` *(line 1396)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Cinematic Unlock"` |

### `dependsOn` *(line 1400)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Cinematic Unlock"` |

### `dependsOn` *(line 1450)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Ask Quiz"` |

### `dependsOn` *(line 1453)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Ask Quiz"` |

### `dependsOn` *(line 1456)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Ask Quiz"` |

### `dependsOn` *(line 1460)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Prompt Player"` |

### `dependsOn` *(line 1464)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Wait"` |

### `dependsOn` *(line 1469)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `oneOf` | table | `{ "Move Actor", "Set Pose" }` |

### `oneOf` *(line 1470)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Move Actor"` |
| `[2]` | string literal | `"Set Pose"` |

### `dependsOn` *(line 1477)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `oneOf` | table | `{ "Move Actor", "Move Camera" }` |

### `oneOf` *(line 1478)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Move Actor"` |
| `[2]` | string literal | `"Move Camera"` |

### `dependsOn` *(line 1481)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `oneOf` | table | `{ "Move Actor", "Move Camera" }` |

### `oneOf` *(line 1482)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Move Actor"` |
| `[2]` | string literal | `"Move Camera"` |

### `dependsOn` *(line 1485)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `oneOf` | table | `{ "Move Actor", "Move Camera" }` |

### `oneOf` *(line 1486)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Move Actor"` |
| `[2]` | string literal | `"Move Camera"` |

### `dependsOn` *(line 1489)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `oneOf` | table | `{ "Move Actor", "Move Camera" }` |

### `oneOf` *(line 1490)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Move Actor"` |
| `[2]` | string literal | `"Move Camera"` |

### `dependsOn` *(line 1495)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Move Actor"` |

### `dependsOn` *(line 1499)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Move Actor"` |

### `dependsOn` *(line 1503)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Move Actor"` |

### `dependsOn` *(line 1507)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Move Actor"` |

### `dependsOn` *(line 1510)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Move Actor"` |

### `dependsOn` *(line 1514)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Move Actor"` |

### `dependsOn` *(line 1517)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Move Actor"` |

### `dependsOn` *(line 1522)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Set Pose"` |

### `dependsOn` *(line 1525)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Set Pose"` |

### `dependsOn` *(line 1528)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Set Pose"` |

### `dependsOn` *(line 1532)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Set Pose"` |

### `dependsOn` *(line 1537)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `oneOf` | table | `{ "Show Message", "Ask Quiz", "Prompt Player" }` |

### `oneOf` *(line 1538)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Show Message"` |
| `[2]` | string literal | `"Ask Quiz"` |
| `[3]` | string literal | `"Prompt Player"` |

### `dependsOn` *(line 1542)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `oneOf` | table | `{ "Show Message", "Ask Quiz", "Prompt Player" }` |

### `oneOf` *(line 1543)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Show Message"` |
| `[2]` | string literal | `"Ask Quiz"` |
| `[3]` | string literal | `"Prompt Player"` |

### `dependsOn` *(line 1546)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Show Message"` |

### `dependsOn` *(line 1549)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Ask Quiz"` |

### `dependsOn` *(line 1552)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Ask Quiz"` |

### `dependsOn` *(line 1555)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Ask Quiz"` |

### `dependsOn` *(line 1559)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Ask Quiz"` |

### `dependsOn` *(line 1563)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Prompt Player"` |

### `dependsOn` *(line 1567)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Prompt Player"` |

### `dependsOn` *(line 1571)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Play Sound"` |

### `dependsOn` *(line 1575)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Fade Camera"` |

### `dependsOn` *(line 1578)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Fade Camera"` |

### `dependsOn` *(line 1581)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Fade Camera"` |

### `dependsOn` *(line 1584)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Fade Camera"` |

### `dependsOn` *(line 1588)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `oneOf` | table | `{ "Fade Camera", "Move Camera" }` |

### `oneOf` *(line 1589)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"Fade Camera"` |
| `[2]` | string literal | `"Move Camera"` |

### `dependsOn` *(line 1594)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `property` | string literal | `"Type"` |
| `equals` | string literal | `"Emit Event"` |

### `errors` *(line 1603)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `seen_classes` *(line 1607)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `seen` *(line 1617)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `METADATA_FIELDS` *(line 1649)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `category` | boolean literal | `true` |
| `required` | boolean literal | `true` |
| `description` | boolean literal | `true` |
| `conditional` | boolean literal | `true` |
| `dependsOn` | boolean literal | `true` |

### `out` *(line 1655)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 1663)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `output` *(line 1671)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `enum_names` *(line 1673)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `parts` *(line 1727)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `keys` *(line 1733)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `parts` *(line 1736)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `out` *(line 1753)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `lines` *(line 1763)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `enum_names` *(line 1769)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `CATEGORY_ORDER` *(line 1801)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `appearance` | number literal | `1` |
| `dialogue` | number literal | `2` |
| `gameplay` | number literal | `3` |
| `advanced` | number literal | `4` |

### `parts` *(line 1857)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `lines` *(line 1871)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `enum_names` *(line 1881)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `sorted` *(line 1901)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `parts` *(line 1925)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-scripts/generate-ezlibs-tiled.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
