# 🗺️ Tiled object types — current server and map reference

[🏠 Documentation home](../index.md) · [🗺️ Areas index](index.md) · [⚔️ Liberation walkthrough](LIBERATION_TILED_SETUP.md)

> **Evidence:** `scripts/ezlibs-scripts/ezlibs-tiled-schema.lua` (generated from `generate-ezlibs-tiled.lua`) and the **69 attached `areas/*.tmx` files**. Schema membership alone does not guarantee a runtime implementation; unknown class-specific requirements should be verified against the consumer.

## 🧭 Index

| Object type | Schema fields | Observed placements | Example |
|---|---:|---:|---|
| [Admin Console](#admin-console) | 0 | 0 | `not present in supplied maps` |
| [Board](#board) | 0 | 8 | `christmas.tmx` |
| [Bonus Panel](#bonus-panel) | 0 | 27 | `DEBUGLIB.tmx` |
| [Boss Dark Panel](#boss-dark-panel) | 12 | 8 | `DEBUGLIB.tmx` |
| [Bot Config](#bot-config) | 21 | 69 | `DEBUGLIB.tmx` |
| [Button Bot Details](#button-bot-details) | 10 | 0 | `not present in supplied maps` |
| [Button Combo](#button-combo) | 7 | 0 | `not present in supplied maps` |
| [Button Effect](#button-effect) | 4 | 0 | `not present in supplied maps` |
| [Button Group](#button-group) | 12 | 0 | `not present in supplied maps` |
| [Button Group Effect](#button-group-effect) | 4 | 0 | `not present in supplied maps` |
| [Button Trigger](#button-trigger) | 1 | 0 | `not present in supplied maps` |
| [Checkpoint](#checkpoint) | 25 | 52 | `ACDC1.tmx` |
| [Combo Button Group](#combo-button-group) | 6 | 0 | `not present in supplied maps` |
| [Compression Tile](#compression-tile) | 1 | 30 | `Hood2.tmx` |
| [Conductor](#conductor) | 0 | 11 | `Chichi.tmx` |
| [Custom Warp](#custom-warp) | 8 | 438 | `AirShoes.tmx` |
| [Cutscene](#cutscene) | 4 | 1 | `cutscene-test.tmx` |
| [Cutscene Step](#cutscene-step) | 39 | 12 | `cutscene-test.tmx` |
| [Dark Hole](#dark-hole) | 5 | 46 | `DEBUGLIB.tmx` |
| [Dark Hole Buffed Virus](#dark-hole-buffed-virus) | 5 | 50 | `DEBUGLIB.tmx` |
| [Dark Hole Encounter List](#dark-hole-encounter-list) | 0 | 1 | `DEBUGLIB.tmx` |
| [Dark Panel](#dark-panel) | 0 | 1252 | `DEBUGLIB.tmx` |
| [Dialogue](#dialogue) | 40 | 287 | `Chichi2.tmx` |
| [dialogue](#dialogue) | 0 | 12 | `christmas.tmx` |
| [Encounter Config](#encounter-config) | 4 | 68 | `DEBUGLIB.tmx` |
| [Endless Runner Spawn](#endless-runner-spawn) | 0 | 1 | `endless-runner.tmx` |
| [Endless Runner Trigger](#endless-runner-trigger) | 0 | 1 | `endless-runner.tmx` |
| [Explosion Trigger](#explosion-trigger) | 3 | 0 | `not present in supplied maps` |
| [FootBomb Controller](#footbomb-controller) | 8 | 1 | `footbomb.tmx` |
| [FootBomb Ref](#footbomb-ref) | 0 | 1 | `footbombZ.tmx` |
| [Home Warp](#home-warp) | 0 | 1 | `default.tmx` |
| [Indestructible Panel](#indestructible-panel) | 3 | 97 | `DEBUGLIB.tmx` |
| [Interact Warp](#interact-warp) | 8 | 0 | `not present in supplied maps` |
| [Item](#item) | 5 | 6 | `porttown2.tmx` |
| [Item Panel](#item-panel) | 0 | 123 | `DEBUGLIB.tmx` |
| [keyitem](#keyitem) | 0 | 2 | `PoliceStation.tmx` |
| [Liberation Config](#liberation-config) | 10 | 9 | `DEBUGLIB.tmx` |
| [Liberation Encounter Pool](#liberation-encounter-pool) | 0 | 0 | `not present in supplied maps` |
| [Liberation Enemy Config](#liberation-enemy-config) | 21 | 0 | `not present in supplied maps` |
| [Liberation Enemy Defaults](#liberation-enemy-defaults) | 2 | 0 | `not present in supplied maps` |
| [Liberation Gate](#liberation-gate) | 1 | 8 | `christmas.tmx` |
| [Liberation Tutorial](#liberation-tutorial) | 0 | 4 | `christmas.tmx` |
| [Location Trigger](#location-trigger) | 2 | 0 | `not present in supplied maps` |
| [Music Definition](#music-definition) | 3 | 4 | `DEBUGLIB.tmx` |
| [Mystery Data](#mystery-data) | 28 | 3 | `ooo.tmx` |
| [Mystery Datum](#mystery-datum) | 0 | 199 | `ACDC1.tmx` |
| [Mystery Option](#mystery-option) | 0 | 192 | `ACDC1.tmx` |
| [NPC](#npc) | 13 | 605 | `ACDC1.tmx` |
| [NPC Behavior](#npc-behavior) | 9 | 0 | `not present in supplied maps` |
| [NPC Spawner](#npc-spawner) | 10 | 0 | `not present in supplied maps` |
| [OW Button](#ow-button) | 16 | 0 | `not present in supplied maps` |
| [OW Button Group Member](#ow-button-group-member) | 9 | 0 | `not present in supplied maps` |
| [Panel Gate](#panel-gate) | 0 | 117 | `DEBUGLIB.tmx` |
| [Passenger Train](#passenger-train) | 0 | 11 | `Chichi.tmx` |
| [Point of Interest](#point-of-interest) | 0 | 49 | `DEBUGLIB.tmx` |
| [Pushback NPC](#pushback-npc) | 19 | 0 | `not present in supplied maps` |
| [Quiz List](#quiz-list) | 10 | 0 | `not present in supplied maps` |
| [Quiz Question](#quiz-question) | 5 | 0 | `not present in supplied maps` |
| [Radius Encounter](#radius-encounter) | 4 | 5 | `MasterPath.tmx` |
| [Radius Warp](#radius-warp) | 9 | 59 | `ACDC1.tmx` |
| [Relock Behavior](#relock-behavior) | 2 | 0 | `not present in supplied maps` |
| [Runner Rectangle Encounter](#runner-rectangle-encounter) | 0 | 1 | `endless-runner.tmx` |
| [Rush Road](#rush-road) | 2 | 0 | `not present in supplied maps` |
| [Server Warp](#server-warp) | 9 | 5 | `crimsonhp.tmx` |
| [Shopping question](#shopping-question) | 0 | 1 | `porttown2.tmx` |
| [Spawn Point](#spawn-point) | 2 | 48 | `DEBUGLIB.tmx` |
| [Tournament Board](#tournament-board) | 0 | 1 | `default.tmx` |
| [Trap Panel](#trap-panel) | 0 | 57 | `DEBUGLIB.tmx` |
| [Unlock Behavior](#unlock-behavior) | 3 | 0 | `not present in supplied maps` |
| [Water Refill](#water-refill) | 0 | 0 | `not present in supplied maps` |
| [Waypoint](#waypoint) | 15 | 240 | `ACDC1.tmx` |

## 📌 How to interpret field status

- **Required (schema):** the generated class explicitly marks `required=true`.
- **Required (runtime):** the inspected consumer/validator rejects or cannot use a missing field (documented separately).
- **Conditional:** the generated schema records a dependency or condition; see the condition text.
- **Optional:** the schema defines a default or the field is not expressly required. A default of `0`/empty string may mean **inherit/unset** depending on the reader.
- **Observed-only:** appears in an actual map but is absent from the current generated schema. Check the runtime before reusing it.

## 📘 Classes and real map examples

### Admin Console

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Board

**Actual example:** `areas/christmas.tmx` object ID `45` (name `Open BBS`).

| Tiled property | Recorded value |
|---|---|
| `BBS` | `true` |
| `Color` | `#ff00ffff` |
| `Name` | `Christmas BBS` |
| `Post Limit` | `100` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Bonus Panel

**Actual example:** `areas/DEBUGLIB.tmx` object ID `67`.

| Tiled property | Recorded value |
|---|---|
| `Order Point` | `8` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Boss Dark Panel

Placed Liberation boss. Uses Bot Config for template/stats/healing and OW Encounter Config for battle selection.

**Actual example:** `areas/DEBUGLIB.tmx` object ID `61`.

| Tiled property | Recorded value |
|---|---|
| `Auto Face Player` | `true` |
| `Boss ID` | `ShadeMan_01` |
| `Bot Config` | `117` |
| `Direction` | `Up Left` |
| `OW Encounter Config` | `118` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Boss ID` | `string` | Optional | `` |  |
| `Direction` | `string` | Optional | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Spawn Mode` | `string` | Optional | `Immediate` | enum BossSpawnMode: Immediate, On Dark Hole Cleared, Manual, After Boss Defeated |
| `Trigger Boss` | `object` | Optional | `0` |  |
| `Spawn Offset X` | `number` | Optional | `0` |  |
| `Spawn Offset Y` | `number` | Optional | `0` |  |
| `Spawn Offset Z` | `number` | Optional | `0` |  |
| `Auto Face Player` | `bool` | Optional | `False` |  |
| `Spawn Enabled` | `bool` | Optional | `True` |  |
| `Boss Display Name` | `string` | Optional | `` |  |
| `Bot Config` | `object` | Optional | `0` |  |
| `OW Encounter Config` | `object` | Optional | `0` |  |

[↑ Back to class index](#-index)

### Bot Config

Reusable OW bot template, native/persistent HP and scale, AI, damage and per-turn healing. Boss defaults to 10% healing; regular enemies default to zero.

**Actual example:** `areas/DEBUGLIB.tmx` object ID `124` (name `BOT -> DHBV #126: Mettaur - 0.75x - 40HP`).

| Tiled property | Recorded value |
|---|---|
| `AI Type` | `shockwave_line` |
| `Battle Attack Multiplier` | `1` |
| `Battle Defense Multiplier` | `1` |
| `Battle Scale` | `0.75` |
| `Battle Scale Scope` | `Matching` |
| `Heal Percent Per Turn` | `0` |
| `Max HP` | `40` |
| `OW Attack Damage` | `20` |
| `OW Scale` | `0.75` |
| `Spawns` | `Mettaur` |
| `Starting HP` | `40` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Spawns` | `string` | Optional | `` |  |
| `Max HP` | `int` | Optional | `0` |  |
| `Starting HP` | `int` | Optional | `0` |  |
| `OW Scale` | `float` | Optional | `0` |  |
| `Battle Scale` | `float` | Optional | `0` |  |
| `Battle Scale Scope` | `string` | Optional | `Auto` | enum LiberationBattleScaleScope: Auto, Matching, All |
| `OW Attack Damage` | `int` | Optional | `0` |  |
| `OW Damage Multiplier` | `float` | Optional | `0` |  |
| `OW Defense Multiplier` | `float` | Optional | `0` |  |
| `Battle Attack Multiplier` | `float` | Optional | `0` |  |
| `Battle Defense Multiplier` | `float` | Optional | `0` |  |
| `AI Type` | `string` | Optional | `Auto` | enum LiberationAIType: Auto, simple_charge, ranged, shockwave_line, patterned_attack, roll_heart_whip, shademan_ambush, bladia_strike |
| `OW Attack Shape` | `string` | Optional | `Auto` | enum LiberationAttackShape: Auto, line, arc, cone, cross, diamond |
| `OW Attack Range` | `int` | Optional | `0` |  |
| `OW Movement Mode` | `string` | Optional | `Auto` | enum LiberationMovementMode: Auto, stationary, approach, reposition |
| `OW Movement Tiles` | `int` | Optional | `-1` |  |
| `OW Telegraph Seconds` | `float` | Optional | `0` |  |
| `OW Windup Seconds` | `float` | Optional | `0` |  |
| `OW Step Seconds` | `float` | Optional | `0` |  |
| `Heal Percent Per Turn` | `float` | Optional | `-1` |  |
| `Heal Flat Per Turn` | `float` | Optional | `-1` |  |

[↑ Back to class index](#-index)

### Button Bot Details

Visual and animation configuration for an OW Button.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Asset Name` | `string` | Required (schema) | `` |  |
| `Direction` | `string` | Required (schema) | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Animation Name` | `string` | Optional | `` |  |
| `Mug Animation Name` | `string` | Optional | `` |  |
| `Active Animation` | `string` | Optional | `ACTIVE` |  |
| `Inactive Animation` | `string` | Optional | `INACTIVE` |  |
| `Activated Animation` | `string` | Optional | `` |  |
| `Deactivated Animation` | `string` | Optional | `` |  |
| `Activation Animation Duration` | `number` | Conditional | `0.5` | Only used when Activated Animation is set. |
| `Deactivation Animation Duration` | `number` | Conditional | `0.5` | Only used when Deactivated Animation is set. |

[↑ Back to class index](#-index)

### Button Combo

One specific button pattern; owns its own checkpoint unlocks.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Button 1` | `object` | Required (schema) | `` |  |
| `Forbidden Button 1` | `object` | Optional | `` |  |
| `Unlock Checkpoint 1` | `object` | Optional | `` |  |
| `Unlock Permanently` | `bool` | Optional | `True` |  |
| `Unlock Area Wide` | `bool` | Optional | `False` |  |
| `Relock Checkpoint 1` | `object` | Conditional | `` | Only meaningful when at least one Unlock Checkpoint is configured. |
| `Relock Area Wide` | `bool` | Optional | `False` |  |

[↑ Back to class index](#-index)

### Button Effect

One button's state transition drives another button's action.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Source Button` | `object` | Required (schema) | `` |  |
| `Event` | `string` | Optional | `activated` | enum ButtonEffectEvent: activated, deactivated |
| `Target Button` | `object` | Required (schema) | `` |  |
| `Action` | `string` | Optional | `activate` | enum ButtonEffectAction: activate, deactivate, toggle, reset |

[↑ Back to class index](#-index)

### Button Group

Group of OW Button Group Members that share a satisfaction rule; owns its own checkpoint unlocks. Optionally plays a cinematic camera pan on player-triggered un

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Group ID` | `string` | Optional | `` |  |
| `Group Mode` | `string` | Optional | `all_active` | enum ButtonGroupMode: all_active, any_active, combination |
| `Button 1` | `object` | Required (schema) | `` |  |
| `Forbidden Button 1` | `object` | Conditional | `` | Only meaningful when Group Mode == 'combination'. |
| `Unlock Checkpoint 1` | `object` | Optional | `` |  |
| `Unlock Permanently` | `bool` | Optional | `True` |  |
| `Unlock Area Wide` | `bool` | Optional | `False` |  |
| `Relock Checkpoint 1` | `object` | Conditional | `` | Only meaningful when at least one Unlock Checkpoint is configured. |
| `Relock Area Wide` | `bool` | Optional | `False` |  |
| `Cinematic Unlock` | `bool` | Conditional | `False` | Only affects player-triggered unlocks on the satisfied transition. Not used on the relock (incomplete) path. |
| `Cinematic Duration` | `number` | Conditional | `1` | Only used when Cinematic Unlock is true. |
| `Cinematic on Bot Trigger` | `bool` | Conditional | `False` | Only used when Cinematic Unlock is true. |

[↑ Back to class index](#-index)

### Button Group Effect

A group's completion transition drives another button's action.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Button Group` | `object` | Required (schema) | `` |  |
| `Event` | `string` | Optional | `completed` | enum ButtonGroupEvent: completed, incomplete |
| `Target Button` | `object` | Required (schema) | `` |  |
| `Action` | `string` | Optional | `activate` | enum ButtonEffectAction: activate, deactivate, toggle, reset |

[↑ Back to class index](#-index)

### Button Trigger

Optional standalone trigger rectangle referenced by an OW Button.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Trigger Type` | `string` | Optional | `rect` | enum TriggerShape: rect, ellipse |

[↑ Back to class index](#-index)

### Checkpoint

Lockable Security Cube that gates progression.

**Actual example:** `areas/ACDC1.tmx` object ID `83`.

| Tiled property | Recorded value |
|---|---|
| `Consume` | `true` |
| `Description` | `This leads to Alohaha, please provide 2000 money to proceed!` |
| `Dialogue Type` | `None` |
| `Disappear Cooldown` | `0` |
| `Key Name` | `money` |
| `Once` | `false` |
| `Required Keys` | `2000` |
| `Unlock Failed Message` | `Sorry! That isn't enough! Come back when you have more!` |
| `Unlocked Message` | `Enjoy!` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Password` | `string` | Optional | `` |  |
| `Key Type` | `string` | Optional | `money` | enum KeyType: money, fragments, tokens, item, bossgate, navi_name, navi_element, navi_list |
| `Key Item Name` | `string` | Conditional | `` | Only used when Key Type == 'item'. |
| `Required Keys` | `number` | Optional | `1` |  |
| `Consume` | `bool` | Optional | `False` |  |
| `Once` | `bool` | Optional | `False` |  |
| `Unlocking Asset Name` | `string` | Optional | `bn5cubegreen` |  |
| `Unlocking Animation Time` | `number` | Optional | `0` |  |
| `Unlocking Sound Path` | `string` | Optional | `/server/assets/ezlibs-assets/sfx/panel_change.ogg` |  |
| `Skip Prompt` | `bool` | Optional | `False` |  |
| `Description` | `string` | Optional | `It's a Security Cube` |  |
| `Unlocked Message` | `string` | Optional | `The Security Cube was unlocked!` |  |
| `Unlock Failed Message` | `string` | Optional | `You were unable to unlock the Security Cube` |  |
| `Navi Name` | `string` | Conditional | `` | Only used when Key Type == 'navi_name'. |
| `Navi Element` | `string` | Conditional | `` | enum NaviElement: None, Fire, Aqua, Elec, Wood, Sword, Break, Cursor, Wind, Summon, Plus; Only used when Key Type == 'navi_element'. |
| `Navi 1` | `string` | Conditional | `` | Only used when Key Type == 'navi_list'. |
| `Navi 2` | `string` | Optional | `` |  |
| `Navi 3` | `string` | Optional | `` |  |
| `Navi 4` | `string` | Optional | `` |  |
| `Navi 5` | `string` | Optional | `` |  |
| `Navi 6` | `string` | Optional | `` |  |
| `Navi 7` | `string` | Optional | `` |  |
| `Navi 8` | `string` | Optional | `` |  |
| `Navi 9` | `string` | Optional | `` |  |
| `Navi 10` | `string` | Optional | `` |  |

**Observed-only custom fields:** `Dialogue Type`, `Disappear Cooldown`, `Interact Relay`, `Key Name`, `Take Item`, `Unlock GID`, `Unlock Item`.

[↑ Back to class index](#-index)

### Combo Button Group

A set of Button Combos; satisfying any one fires that combo's actions. Optionally plays a cinematic camera pan on player-triggered unlocks via \`Cinematic Unloc

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Group ID` | `string` | Optional | `` |  |
| `Combo Mode` | `string` | Optional | `Inclusive` | enum ButtonComboMode: Inclusive, Exclusive |
| `Button Combo 1` | `object` | Required (schema) | `` |  |
| `Cinematic Unlock` | `bool` | Conditional | `False` | Only affects player-triggered unlocks on the satisfied transition. |
| `Cinematic Duration` | `number` | Conditional | `1` | Only used when Cinematic Unlock is true. |
| `Cinematic on Bot Trigger` | `bool` | Conditional | `False` | Only used when Cinematic Unlock is true. |

[↑ Back to class index](#-index)

### Compression Tile

Changes player or area scale while standing inside.

**Actual example:** `areas/Hood2.tmx` object ID `22` (name `PressExit`).

| Tiled property | Recorded value |
|---|---|
| `Decompress` | `true` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Mode` | `string` | Optional | `Compress` | enum CompressionMode: Compress, Normalize, Enlarge |

**Observed-only custom fields:** `Compress`, `Decompress`.

[↑ Back to class index](#-index)

### Conductor

**Actual example:** `areas/Chichi.tmx` object ID `22` (name `Conductor Prog`).

| Tiled property | Recorded value |
|---|---|
| `1 Area` | `default` |
| `1 Name` | `--IN NETWORK--` |
| `1 Type` | `label` |
| `2 Area` | `Ponddrive1` |
| `2 Name` | `Ponddrive1` |
| `2 Type` | `Area` |
| `3 Area` | `PoliceStation` |
| `3 Name` | `PoliceStation` |
| `3 Type` | `Area` |
| `4 Area` | `Mall1` |
| `4 Name` | `Mall1` |
| `4 Type` | `Area` |
| `5 Area` | `Sewer` |
| `5 Name` | `Sewer` |
| `5 Type` | `Area` |
| … | 7 more properties in the actual TMX; inspect the object for the complete pool |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Custom Warp

**Actual example:** `areas/footbombZ.tmx` object ID `185`.

| Tiled property | Recorded value |
|---|---|
| `Direction` | `Down Right` |
| `Dont Teleport` | `false` |
| `Target Area` | `footbombZ` |
| `Target Object` | `183` |
| `Warp In` | `true` |
| `Warp Out` | `true` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Incoming Data` | `string` | Optional | `` |  |
| `Direction` | `string` | Optional | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Warp In` | `bool` | Optional | `False` |  |
| `Arrival Animation` | `string` | Optional | `` |  |
| `Dont Teleport` | `bool` | Optional | `False` |  |
| `Target Area` | `string` | Optional | `` |  |
| `Target Object` | `string` | Optional | `` |  |
| `Leave Animation` | `string` | Optional | `` |  |

**Observed-only custom fields:** `Next Waypoint 1`, `TO`, `Warp Out`.

[↑ Back to class index](#-index)

### Cutscene

Named cutscene definition. Trigger via radius or script.

**Actual example:** `areas/cutscene-test.tmx` object ID `215`.

| Tiled property | Recorded value |
|---|---|
| `Name` | `ShademanSpotting` |
| `Once` | `true` |
| `Start Step` | `201` |
| `Trigger Radius` | `0` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Name` | `string` | Required (schema) | `` |  |
| `Start Step` | `object` | Required (schema) | `` |  |
| `Trigger Radius` | `number` | Optional | `0` |  |
| `Once` | `bool` | Optional | `False` |  |

[↑ Back to class index](#-index)

### Cutscene Step

One action in a cutscene chain. Chain via Next Step; branch via Next N / Fail Next.

**Actual example:** `areas/cutscene-test.tmx` object ID `204` (name `Step04_Approach`).

| Tiled property | Recorded value |
|---|---|
| `Actor` | `142` |
| `End Animation` | `IDLE_DR` |
| `End Direction` | `Down Right` |
| `End Loop` | `true` |
| `Move Animation` | `WALK_DR` |
| `Move Direction` | `Down Right` |
| `Move Speed` | `2` |
| `Next Step` | `205` |
| `Type` | `Move Actor` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Type` | `string` | Required (schema) | `Wait` | enum CutsceneStepType: Wait, Move Actor, Set Pose, Show Message, Ask Quiz, Prompt Player, Play Sound, Fade Camera, Move Camera, Emit Event |
| `Next Step` | `object` | Optional | `` |  |
| `Next 1` | `object` | Conditional | `` | Only used when Type == 'Ask Quiz'. |
| `Next 2` | `object` | Conditional | `` | Only used when Type == 'Ask Quiz'. |
| `Next 3` | `object` | Conditional | `` | Only used when Type == 'Ask Quiz'. |
| `Fail Next` | `object` | Conditional | `` | Only used when Type == 'Prompt Player' with Expected set. |
| `Wait Seconds` | `number` | Conditional | `1` | Only used when Type == 'Wait'. |
| `Actor` | `object` | Conditional | `` | Only used by Move Actor and Set Pose. |
| `Target` | `object` | Conditional | `` | Only used by Move Actor and Move Camera. |
| `Target X` | `number` | Conditional | `0` | Only used when Target is empty and Type is Move Actor or Move Camera. If Target X/Y/Z are all empty, the step node's own Tiled position is used. |
| `Target Y` | `number` | Conditional | `0` | Only used when Target is empty and Type is Move Actor or Move Camera. If Target X/Y/Z are all empty, the step node's own Tiled position is used. |
| `Target Z` | `number` | Conditional | `0` | Only used when Target is empty and Type is Move Actor or Move Camera. If Target X/Y/Z are all empty, the step node's own Tiled position is used. |
| `Move Animation` | `string` | Conditional | `` | Only used by Move Actor. |
| `Move Direction` | `string` | Conditional | `` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right; Only used by Move Actor. |
| `Move Speed` | `number` | Conditional | `3` | Only used by Move Actor. |
| `End Animation` | `string` | Conditional | `` | Only used by Move Actor. |
| `End Direction` | `string` | Conditional | `` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right; Only used by Move Actor. |
| `End Hold Seconds` | `number` | Conditional | `0` | Only used by Move Actor. |
| `End Loop` | `bool` | Conditional | `True` | Only used by Move Actor. |
| `Animation` | `string` | Conditional | `` | Only used by Set Pose. |
| `Direction` | `string` | Conditional | `` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right; Only used by Set Pose. |
| `Loop` | `bool` | Conditional | `True` | Only used by Set Pose. |
| `Hold Seconds` | `number` | Conditional | `0` | Only used by Set Pose. |
| `Speaker` | `object` | Conditional | `` | Only used by Show Message, Ask Quiz, and Prompt Player. |
| `Mugshot Override` | `string` | Conditional | `` | Only used by Show Message, Ask Quiz, and Prompt Player. |
| `Text` | `string` | Conditional | `` | Only used by Show Message. |
| `Question` | `string` | Conditional | `` | Only used by Ask Quiz. |
| `Option 1` | `string` | Conditional | `` | Only used by Ask Quiz. |
| `Option 2` | `string` | Conditional | `` | Only used by Ask Quiz. |
| `Option 3` | `string` | Conditional | `` | Only used by Ask Quiz. |
| `Message` | `string` | Conditional | `` | Only used by Prompt Player. |
| `Expected` | `string` | Conditional | `` | Only used by Prompt Player. |
| `Sound Path` | `string` | Conditional | `` | Only used by Play Sound. |
| `Color R` | `number` | Conditional | `0` | Only used by Fade Camera. |
| `Color G` | `number` | Conditional | `0` | Only used by Fade Camera. |
| `Color B` | `number` | Conditional | `0` | Only used by Fade Camera. |
| `Color A` | `number` | Conditional | `255` | Only used by Fade Camera. |
| `Duration` | `number` | Conditional | `0.8` | Only used by Fade Camera and Move Camera. |
| `Event Name` | `string` | Conditional | `` | Only used by Emit Event. |

[↑ Back to class index](#-index)

### Dark Hole

Placed Liberation panel. Bot Config defines the overworld enemy, OW Encounter Config selects its battle, and Liberation Encounter Config selects panel liberatio

**Actual example:** `areas/DEBUGLIB.tmx` object ID `7`.

| Tiled property | Recorded value |
|---|---|
| `Boss ID 1` | `ShadeMan_02` |
| `Bot Config` | `115` |
| `Direction` | `Down Right` |
| `Liberation Encounter Config` | `111` |
| `OW Encounter Config` | `116` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Direction` | `string` | Optional | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Boss ID 1` | `string` | Optional | `` |  |
| `Bot Config` | `object` | Optional | `0` |  |
| `OW Encounter Config` | `object` | Optional | `0` |  |
| `Liberation Encounter Config` | `object` | Optional | `0` |  |

[↑ Back to class index](#-index)

### Dark Hole Buffed Virus

Buffed panel with external Bot Config and Encounter Config references. Only Direction and optional Boss ID 1..9 remain local.

**Actual example:** `areas/LiberationNormalMode.tmx` object ID `70`.

| Tiled property | Recorded value |
|---|---|
| `Boss ID 1` | `ShadeMan_01` |
| `Direction` | `Down Right` |
| `Bot Config` | `219` |
| `OW Encounter Config` | `220` |
| `Liberation Encounter Config` | `111` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Direction` | `string` | Optional | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Boss ID 1` | `string` | Optional | `` |  |
| `Bot Config` | `object` | Optional | `0` |  |
| `OW Encounter Config` | `object` | Optional | `0` |  |
| `Liberation Encounter Config` | `object` | Optional | `0` |  |

[↑ Back to class index](#-index)

### Dark Hole Encounter List

Reusable list of named encounters from this area's special_encounters section, used only when liberating a linked Dark Hole. Leave entries blank to ignore them.

**Actual example:** `areas/DEBUGLIB.tmx` object ID `110` (name `GLOBAL: Available encounter names (134)`).

| Tiled property | Recorded value |
|---|---|
| `Name 1` | `BigBrute` |
| `Name 10` | `Bladia` |
| `Name 100` | `RareChampy` |
| `Name 101` | `Ratty` |
| `Name 102` | `RayCannon` |
| `Name 103` | `Roll` |
| `Name 104` | `Scuttle` |
| `Name 105` | `Scuttler` |
| `Name 106` | `Scuttlest` |
| `Name 107` | `Scuttzer` |
| `Name 108` | `Scutz` |
| `Name 109` | `ShadeMan_Solo` |
| `Name 11` | `Bladia2` |
| `Name 110` | `ShadowManPoN` |
| `Name 111` | `Shaker` |
| … | 119 more properties in the actual TMX; inspect the object for the complete pool |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Dark Panel

**Actual example:** `areas/example liberation friendly.tmx` object ID `61`.

| Tiled property | Recorded value |
|---|---|
| `Boss` | `ShadeMan` |
| `Direction` | `Up Left` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Dialogue

Dialogue node. Many properties are type-specific; see the Conditional section.

**Actual example:** `areas/cutscene-test.tmx` object ID `195` (name `Shademan Dialogue`).

| Tiled property | Recorded value |
|---|---|
| `Dialogue Type` | `battle_npc` |
| `Encounter Name` | `BossTest` |
| `Failure Message` | `Oh No you failed!` |
| `Kick On Loss` | `false` |
| `Mugshot` | `shademan-exe5` |
| `Persist` | `true` |
| `Text 1` | `Think you can take me?` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Dialogue Type` | `string` | Optional | `first` | enum DialogueType: first, question, quiz, random, itemcheck, before, after, shop, password, quest_switch, quest_event, item, email, questcheck, battle_npc |
| `Event Name` | `string` | Optional | `` |  |
| `Mugshot` | `string` | Optional | `` |  |
| `Text 1` | `string` | Optional | `` |  |
| `Text 2` | `string` | Optional | `` |  |
| `Text 3` | `string` | Optional | `` |  |
| `Next 1` | `object` | Optional | `` |  |
| `Next 2` | `object` | Optional | `` |  |
| `Next 3` | `object` | Optional | `` |  |
| `Next 4` | `object` | Optional | `` |  |
| `Next 5` | `object` | Optional | `` |  |
| `Item 1` | `object` | Conditional | `` | Only used by Dialogue Type 'item', 'itemcheck', or 'shop'. |
| `Item 2` | `object` | Optional | `` |  |
| `Take Item` | `bool` | Conditional | `False` | Only used when Dialogue Type == 'itemcheck'. |
| `Date` | `string` | Conditional | `` | Only used by Dialogue Type 'before' or 'after'. |
| `Quest Name` | `string` | Conditional | `` | Only used by quest-related Dialogue Types. |
| `Event Value` | `string` | Conditional | `` | Only used by Dialogue Type 'quest_event'. |
| `Dont Notify` | `bool` | Conditional | `False` | Only used by Dialogue Type 'item' or 'email'. |
| `Email Id` | `string` | Conditional | `` | Only used when Dialogue Type == 'email'. |
| `Email Icon` | `number` | Conditional | `1` | Only used when Dialogue Type == 'email'. |
| `Email Title` | `string` | Conditional | `Mail` | Only used when Dialogue Type == 'email'. |
| `Email From` | `string` | Conditional | `???` | Only used when Dialogue Type == 'email'. |
| `Body 1` | `string` | Optional | `` |  |
| `Body 2` | `string` | Optional | `` |  |
| `Body 3` | `string` | Optional | `` |  |
| `Body 4` | `string` | Optional | `` |  |
| `Body 5` | `string` | Optional | `` |  |
| `Body 6` | `string` | Optional | `` |  |
| `Body 7` | `string` | Optional | `` |  |
| `Body 8` | `string` | Optional | `` |  |
| `Body 9` | `string` | Optional | `` |  |
| `Body 10` | `string` | Optional | `` |  |
| `Notify Delay` | `number` | Optional | `1.5` |  |
| `Notify Message` | `string` | Optional | `Looks like you got an e-mail.` |  |
| `Mug Texture Path` | `string` | Conditional | `` | Only used when Dialogue Type == 'email'. |
| `Mug Animation Path` | `string` | Conditional | `` | Only used when Dialogue Type == 'email'. |
| `Persist` | `bool` | Conditional | `True` | Only used when Dialogue Type == 'email'. |
| `Encounter Name` | `string` | Conditional | `` | Only used when Dialogue Type == 'battle_npc'. |
| `Failure Message` | `string` | Conditional | `` | Only used when Dialogue Type == 'battle_npc'. |
| `Kick On Loss` | `bool` | Conditional | `True` | Only used when Dialogue Type == 'battle_npc'. |

**Observed-only custom fields:** `Ability Item`, `Amount`, `Battle Lost`, `Battle Won`, `Direction`, `Item 3`, `Item 4`, `Item 5`, `Item 6`, `Liberation Map`, `No Money`.

[↑ Back to class index](#-index)

### dialogue

**Actual example:** `areas/christmas.tmx` object ID `80` (name `Ability Quiz 1`).

| Tiled property | Recorded value |
|---|---|
| `Dialogue Type` | `quiz` |
| `Next 1` | `81` |
| `Next 2` | `82` |
| `Next 3` | `87` |
| `Text 1` | `Burner` |
| `Text 2` | `Hex Sickle` |
| `Text 3` | `Next` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Encounter Config

Reusable battle selection. Fixed name, category, or optional numbered Name 1..9 / Weight 1..9; numbered fields are not prepopulated in the class.

**Actual example:** `areas/DEBUGLIB.tmx` object ID `111` (name `DH #7: Liberation encounter list`).

| Tiled property | Recorded value |
|---|---|
| `Encounter Category` | `special_encounters` |
| `Name 1` | `BigBrute` |
| `Name 2` | `BigBruteVar1` |
| `Name 3` | `BigBruteVar2` |
| `Name 4` | `BigBruteVar3` |
| `Name 5` | `Mettaur` |
| `Name 6` | `Roll` |
| `Weight 1` | `1` |
| `Weight 2` | `1` |
| `Weight 3` | `1` |
| `Weight 4` | `1` |
| `Weight 5` | `1` |
| `Weight 6` | `1` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Encounter Mode` | `string` | Optional | `Auto` | enum LiberationEncounterMode: Auto, Fixed, Pool, Category |
| `Encounter Category` | `string` | Optional | `Auto` | enum LiberationEncounterCategory: Auto, encounters, special_encounters, bosses |
| `Encounter Name` | `string` | Optional | `` |  |
| `Encounter Pool` | `object` | Optional | `0` |  |

**Observed-only custom fields:** `Name 1`, `Name 2`, `Name 3`, `Name 4`, `Name 5`, `Name 6`, `Weight 1`, `Weight 2`, `Weight 3`, `Weight 4`, `Weight 5`, `Weight 6`.

[↑ Back to class index](#-index)

### Endless Runner Spawn

**Actual example:** `areas/endless-runner.tmx` object ID `202`.

| Tiled property | Recorded value |
|---|---|
| `Direction` | `Down Right` |
| `Next Waypoint 1` | `204` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Endless Runner Trigger

**Actual example:** `areas/endless-runner.tmx` object ID `198`.

| Tiled property | Recorded value |
|---|---|
| `Warp Bot Too` | `true` |
| `Warp To` | `$instance:202` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Explosion Trigger

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Target` | `string` | Optional | `` |  |
| `Follow` | `bool` | Optional | `False` |  |
| `Once` | `bool` | Optional | `False` |  |

[↑ Back to class index](#-index)

### FootBomb Controller

Interaction actor for the FootBomb minigame.

**Actual example:** `areas/footbomb.tmx` object ID `150` (name `FootBomb Controller`).

| Tiled property | Recorded value |
|---|---|
| `Animation Name` | `` |
| `Asset Name` | `ref-prog` |
| `Direction` | `Down Right` |
| `Dont Face Player` | `false` |
| `Instance Map` | `footbomb` |
| `Mug Animation Name` | `mug` |
| `Mugshot` | `ref-prog-mug` |
| `Points to Win` | `5` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Direction` | `string` | Optional | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Asset Name` | `string` | Optional | `male-navi-exe6_teal` |  |
| `Animation Name` | `string` | Optional | `` |  |
| `Mugshot` | `string` | Optional | `` |  |
| `Mug Animation Name` | `string` | Optional | `` |  |
| `Dont Face Player` | `bool` | Optional | `False` |  |
| `Instance Map` | `string` | Optional | `footbomb` |  |
| `Points to Win` | `number` | Required (schema) | `10` |  |

[↑ Back to class index](#-index)

### FootBomb Ref

**Actual example:** `areas/footbombZ.tmx` object ID `170` (name `FootBomb Ref`).

| Tiled property | Recorded value |
|---|---|
| `Animation Name` | `` |
| `Asset Name` | `ref-prog` |
| `Declined Message` | `No problem. Come back when you're ready.` |
| `Dialogue Type` | `` |
| `Direction` | `Down Right` |
| `Dont Face Player` | `false` |
| `Instance Map` | `footbomb` |
| `Intro Message` | `Hey! Want to play a round of FootBomb?` |
| `Mug Animation Name` | `mug` |
| `Mugshot` | `ref-prog-mug` |
| `Points to Win` | `5` |
| `Question` | `Would you like to join a FootBomb party and enter the field?` |
| `Started Message` | `All right! I'll get your party onto the field.` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Home Warp

**Actual example:** `areas/default.tmx` object ID `4`.

| Tiled property | Recorded value |
|---|---|
| `Direction` | `Up Right` |
| `Warp In` | `true` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Indestructible Panel

Panel boss links use Boss ID 1 through optional Boss ID 9. Type selects All or Any, Shared waits for every Dark Hole.

**Actual example:** `areas/DEBUGLIB.tmx` object ID `53`.

| Tiled property | Recorded value |
|---|---|
| `Boss ID 1` | `ShadeMan_01` |
| `Boss ID 2` | `ShadeMan_02` |
| `Type` | `All` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Boss ID 1` | `string` | Optional | `` |  |
| `Type` | `string` | Optional | `All` | enum BossRequirementType: All, Any |
| `Shared` | `bool` | Optional | `False` |  |

**Observed-only custom fields:** `Boss ID 2`.

[↑ Back to class index](#-index)

### Interact Warp

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Incoming Data` | `string` | Optional | `` |  |
| `Direction` | `string` | Optional | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Warp In` | `bool` | Optional | `False` |  |
| `Arrival Animation` | `string` | Optional | `` |  |
| `Dont Teleport` | `bool` | Optional | `False` |  |
| `Target Area` | `string` | Optional | `` |  |
| `Target Object` | `string` | Optional | `` |  |
| `Leave Animation` | `string` | Optional | `` |  |

[↑ Back to class index](#-index)

### Item

Inventory or shop item reference.

**Actual example:** `areas/porttown2.tmx` object ID `222` (name `Bagel`).

| Tiled property | Recorded value |
|---|---|
| `Amount` | `999` |
| `Description` | `A plain bagel...` |
| `Name` | `Bagel` |
| `Price` | `1` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Name` | `string` | Optional | `` |  |
| `Type` | `string` | Optional | `item` | enum ItemType: item, keyitem, money, fragments, tokens |
| `Description` | `string` | Optional | `` |  |
| `Amount` | `number` | Optional | `1` |  |
| `Price` | `number` | Optional | `999999` |  |

[↑ Back to class index](#-index)

### Item Panel

**Actual example:** `areas/DEBUGLIB.tmx` object ID `49`.

| Tiled property | Recorded value |
|---|---|
| `Gate Key` | `1` |
| `Specific Loot` | `KEY` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### keyitem

**Actual example:** `areas/PoliceStation.tmx` object ID `71` (name `Fake Badge`).

| Tiled property | Recorded value |
|---|---|
| `Amount` | `999999999` |
| `Description` | `A fake offical badge that could fool many.` |
| `Name` | `Fake Badge` |
| `Price` | `1000` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Liberation Config

Configuration object for a liberation mission. Liberation Tileset, Max Order Points, and Encounter Music are read from this object. Target phase/player counts, 

**Actual example:** `areas/LiberationEasyMode.tmx` object ID `59` (name `Liberation Config #59`).

| Tiled property | Recorded value |
|---|---|
| `Encounter Music` | `60` |
| `Honor HPMem` | `true` |
| `Liberation Tileset` | `/server/assets/ezlibs-custom/nebulous-liberations/tiles/panels.tsx` |
| `Max Order Points` | `40` |
| `Minimum Target Phase Count` | `8` |
| `Respawn Area` | `default` |
| `Target Phase Count` | `10` |
| `Target Player Count` | `3` |
| `Victory Lap Song` | `/server/assets/exe4-hero.ogg` |
| `Waiting Area` | `default` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Respawn Area` | `string` | Optional | `` |  |
| `Waiting Area` | `string` | Optional | `` |  |
| `Liberation Tileset` | `string` | Optional | `` |  |
| `Max Order Points` | `number` | Optional | `9` |  |
| `Target Phase Count` | `number` | Optional | `13` |  |
| `Target Player Count` | `number` | Optional | `3` |  |
| `Minimum Target Phase Count` | `number` | Optional | `1` |  |
| `Victory Lap Song` | `string` | Optional | `` |  |
| `Encounter Music` | `object` | Optional | `` |  |
| `Honor HPMem` | `bool` | Optional | `False` |  |

[↑ Back to class index](#-index)

### Liberation Encounter Pool

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Liberation Enemy Config

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Spawns` | `string` | Optional | `` |  |
| `Max HP` | `int` | Optional | `0` |  |
| `Starting HP` | `int` | Optional | `0` |  |
| `OW Scale` | `float` | Optional | `0` |  |
| `Battle Scale` | `float` | Optional | `0` |  |
| `Battle Scale Scope` | `string` | Optional | `Auto` | enum LiberationBattleScaleScope: Auto, Matching, All |
| `OW Attack Damage` | `int` | Optional | `0` |  |
| `OW Damage Multiplier` | `float` | Optional | `0` |  |
| `OW Defense Multiplier` | `float` | Optional | `0` |  |
| `Battle Attack Multiplier` | `float` | Optional | `0` |  |
| `Battle Defense Multiplier` | `float` | Optional | `0` |  |
| `AI Type` | `string` | Optional | `Auto` | enum LiberationAIType: Auto, simple_charge, ranged, shockwave_line, patterned_attack, roll_heart_whip, shademan_ambush, bladia_strike |
| `OW Attack Shape` | `string` | Optional | `Auto` | enum LiberationAttackShape: Auto, line, arc, cone, cross, diamond |
| `OW Attack Range` | `int` | Optional | `0` |  |
| `OW Movement Mode` | `string` | Optional | `Auto` | enum LiberationMovementMode: Auto, stationary, approach, reposition |
| `OW Movement Tiles` | `int` | Optional | `-1` |  |
| `OW Telegraph Seconds` | `float` | Optional | `0` |  |
| `OW Windup Seconds` | `float` | Optional | `0` |  |
| `OW Step Seconds` | `float` | Optional | `0` |  |
| `Heal Percent Per Turn` | `float` | Optional | `-1` |  |
| `Heal Flat Per Turn` | `float` | Optional | `-1` |  |

[↑ Back to class index](#-index)

### Liberation Enemy Defaults

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Category` | `string` | Optional | `All` | enum LiberationEnemyCategory: All, Dark Hole, Buffed Virus, Boss |
| `Bot Config` | `object` | Optional | `0` |  |

[↑ Back to class index](#-index)

### Liberation Gate

Interactive gate that starts the liberation mission named by \`Liberation Map File Name\`.

**Actual example:** `areas/christmas.tmx` object ID `49` (name `GATE 2`).

| Tiled property | Recorded value |
|---|---|
| `Liberation Map File Name` | `testground` |
| `Liberation Map Name` | `PracticeArea2` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Liberation Map File Name` | `string` | Optional | `` |  |

**Observed-only custom fields:** `Liberation Map Name`.

[↑ Back to class index](#-index)

### Liberation Tutorial

**Actual example:** `areas/christmas.tmx` object ID `51` (name `Help Spawn`).

| Tiled property | Recorded value |
|---|---|
| `Direction` | `Down Left` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Location Trigger

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Event Name` | `string` | Optional | `` |  |
| `Name` | `string` | Optional | `` |  |

[↑ Back to class index](#-index)

### Music Definition

Reusable encounter music settings. Path is a song name relative to the encounter package's music directory, without the .mid extension. Empty Path disables the 

**Actual example:** `areas/DEBUGLIB.tmx` object ID `108` (name `GLOBAL: Encounter Music`).

| Tiled property | Recorded value |
|---|---|
| _(none)_ | Empty property set on this actual placement |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Path` | `string` | Optional | `` |  |
| `Loop Start` | `number` | Optional | `0` |  |
| `Loop End` | `number` | Optional | `0` |  |

[↑ Back to class index](#-index)

### Mystery Data

Pickup or event; behaviour branches on \`Type\`.

**Actual example:** `areas/ooo.tmx` object ID `39` (name `Shifting Key`).

| Tiled property | Recorded value |
|---|---|
| `Description` | `a key that changes shape from words` |
| `Name` | `Shftng Key` |
| `Once` | `true` |
| `Type` | `keyitem` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Locked` | `bool` | Optional | `False` |  |
| `Password Locked` | `string` | Optional | `` |  |
| `Once` | `bool` | Optional | `False` |  |
| `Type` | `string` | Optional | `item` | enum MysteryType: keyitem, item, money, random, quiz, fragments, tokens, encounter |
| `Name` | `string` | Optional | `` |  |
| `Description` | `string` | Optional | `` |  |
| `Amount` | `number` | Optional | `1` |  |
| `Quiz List` | `object` | Conditional | `` | Only used when Type == 'quiz'. |
| `Failure Message` | `string` | Optional | `` |  |
| `On Fail` | `string` | Optional | `retry` | enum QuizFailAction: retry, hide_once, hide_temp, explode |
| `Explosion Count` | `number` | Optional | `3` |  |
| `Reward Type` | `string` | Conditional | `item` | enum ItemType: item, keyitem, money, fragments, tokens; Only used when Type == 'quiz'. |
| `Reward Name` | `string` | Conditional | `` | Only used when Type == 'quiz'. |
| `Reward Amount` | `number` | Conditional | `1` | Only used when Type == 'quiz'. |
| `Reward Description` | `string` | Conditional | `` | Only used when Type == 'quiz'. |
| `Cost Type` | `string` | Optional | `` | enum CurrencyType: money, fragments, tokens |
| `Cost Amount` | `number` | Conditional | `1` | Only used when Cost Type is set. |
| `Cost Failure Message` | `string` | Conditional | `` | Only used when Cost Type is set. |
| `Next 1` | `object` | Optional | `` |  |
| `Next 2` | `object` | Optional | `` |  |
| `Next 3` | `object` | Optional | `` |  |
| `Next 4` | `object` | Optional | `` |  |
| `Next 5` | `object` | Optional | `` |  |
| `Next 6` | `object` | Optional | `` |  |
| `Next 7` | `object` | Optional | `` |  |
| `Next 8` | `object` | Optional | `` |  |
| `Next 9` | `object` | Optional | `` |  |
| `Next 10` | `object` | Optional | `` |  |

[↑ Back to class index](#-index)

### Mystery Datum

**Actual example:** `areas/ACDC1.tmx` object ID `53`.

| Tiled property | Recorded value |
|---|---|
| `Next 1` | `51` |
| `Type` | `random` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Mystery Option

**Actual example:** `areas/ACDC1.tmx` object ID `47` (name `MO013`).

| Tiled property | Recorded value |
|---|---|
| `Next 1` | `37` |
| `Next 2` | `37` |
| `Next 3` | `37` |
| `Next 4` | `38` |
| `Next 5` | `38` |
| `Next 6` | `38` |
| `Next 7` | `39` |
| `Next 8` | `39` |
| `Next 9` | `40` |
| `Once` | `false` |
| `Type` | `random` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### NPC

Placed non-player character. Set \`Template Only\` to use an NPC purely as a reference target for NPC Spawners without spawning it as a standalone NPC.

**Actual example:** `areas/ooo.tmx` object ID `51` (name `Cyan`).

| Tiled property | Recorded value |
|---|---|
| `Asset Name` | `ow` |
| `Dialogue Type` | `random` |
| `Direction` | `Down Left` |
| `Text 1` | `...? bah?` |
| `Text 10` | `Did you know in terms of virus breeding a Spikey is....Bah!` |
| `Text 11` | `Ota needed a shower after learning about Vaporeons but you did'nt hear from me..` |
| `Text 12` | `Can you stop poking me?... I mean Bah!` |
| `Text 13` | `GalaxyMan was originally a NormalNavi before being modified to exceed in combat by Fazer. / ` |
| `Text 14` | `Have you seen that Ballade guy yet? He's supposed to be strong but his operator hasn't even finished him...` |
| `Text 15` | `Wiseman is a huge nerd. He went on for 20 minutes about the code of CornShot.` |
| `Text 16` | `Auto's design doesn't really fit her function, because her abilities were added later!` |
| `Text 17` | `192.158.1.38.` |
| `Text 18` | `Bah......Bah? Baaaaaaah! *smile*` |
| `Text 19` | `ONB Shadow enemies appear and don't attack, but afterwords you hear noises at night; your phone lights up, and It's a text from your NetNavi - they need help. S` |
| `Text 2` | `*Stare*` |
| … | 16 more properties in the actual TMX; inspect the object for the complete pool |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Direction` | `string` | Required (schema) | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Asset Name` | `string` | Required (schema) | `` |  |
| `Animation Name` | `string` | Optional | `` |  |
| `Mug Animation Name` | `string` | Optional | `` |  |
| `Dont Face Player` | `bool` | Optional | `False` |  |
| `First Dialogue` | `object` | Optional | `` |  |
| `Cutscene` | `string` | Conditional | `` | Only used if a Cutscene with this Name exists in the area. |
| `Next Waypoint 1` | `object` | Optional | `` |  |
| `Player Exclusive` | `bool` | Optional | `False` |  |
| `Quest NPC` | `bool` | Optional | `False` |  |
| `Quest Exclusive` | `string` | Optional | `` |  |
| `Quest State` | `string` | Conditional | `active` | Only used when Quest Exclusive is set. |
| `Template Only` | `bool` | Optional | `False` |  |

**Observed-only custom fields:** `Date`, `Dialogue Type`, `Event Name`, `Item 1`, `Item 5`, `Mugshot`, `Next 1`, `Next 2`, `Quest Name`, `Take Item`, `Text 1`, `Text 10`, `Text 11`, `Text 12`, `Text 13`, `Text 14`, `Text 15`, `Text 16`, `Text 17`, `Text 18`, `Text 19`, `Text 2`, `Text 20`, `Text 21`, `Text 22`, `Text 23`, `Text 24`, `Text 25`, `Text 26`, `Text 27`, `Text 3`, `Text 4`, `Text 5`, `Text 6`, `Text 7`, `Text 8`, `Text 9`, `Wait Time`, `WaitingForU`, `Waypoint Type`, `accepted`, `punched`, `unaccepted`.

[↑ Back to class index](#-index)

### NPC Behavior

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Attached NPC` | `object` | Required (schema) | `` |  |
| `Behavior` | `string` | Optional | `Pushback` |  |
| `Enabled` | `bool` | Optional | `True` |  |
| `Collision Width` | `number` | Conditional | `1.5` | Used by Pushback behavior. |
| `Collision Height` | `number` | Conditional | `1.5` | Used by Pushback behavior. |
| `Push Distance` | `number` | Conditional | `1` | Used by Pushback behavior. |
| `Push Duration` | `number` | Conditional | `0.28` | Used by Pushback behavior. |
| `Push Cooldown` | `number` | Conditional | `0.75` | Used by Pushback behavior. |
| `Move Animation State` | `string` | Conditional | `MOVE` | Used by Pushback behavior. |

[↑ Back to class index](#-index)

### NPC Spawner

Spawns NPCs from a template object, lets them follow a waypoint path, and optionally warps them out when the path completes. Supports one-per-entry spawning (On

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `NPC Template` | `object` | Required (schema) | `` |  |
| `Trigger Radius` | `number` | Optional | `0` |  |
| `Spawn Mode` | `string` | Optional | `Once` | enum NPCSpawnMode: Once, Interval |
| `Spawn Interval` | `number` | Conditional | `3` | Only used when Spawn Mode == 'Interval'. |
| `Max Alive` | `number` | Conditional | `0` | Only used when Spawn Mode == 'Interval'; Once mode is implicitly limited to one NPC at a time. |
| `Once` | `bool` | Conditional | `False` | Only affects Once mode; Interval mode ignores it. |
| `Warp Out At End` | `bool` | Optional | `False` |  |
| `Warp Out Delay` | `number` | Conditional | `0` | Only used when Warp Out At End is true. |
| `Warp Out Animation` | `string` | Conditional | `` | Only used when Warp Out At End is true. |
| `Warp Out Animation Duration` | `number` | Conditional | `0.5` | Only used when Warp Out At End and Warp Out Animation are both set. |

[↑ Back to class index](#-index)

### OW Button

A pressable button. Unlocks checkpoints through a referenced Unlock Behavior. Optionally plays a cinematic camera pan on player-triggered unlocks via \`Cinemati

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Bot Details` | `object` | Required (schema) | `` |  |
| `Next 1` | `object` | Optional | `` |  |
| `Button Behavior` | `string` | Optional | `One-Time` | enum ButtonBehavior: Pressure Plate, One-Time, Toggle, Custom, Timed |
| `Script Path` | `file` | Conditional | `` | Only used when Button Behavior == 'Custom'. |
| `Trigger Object` | `object` | Optional | `` |  |
| `Button Activated Behavior` | `object` | Optional | `` |  |
| `Button Deactivated Behavior` | `object` | Optional | `` |  |
| `Button Chain Type` | `string` | Optional | `Any` | enum ButtonChainType: Any, Exclusive |
| `Trigger Type` | `string` | Conditional | `rect` | enum TriggerShape: rect, ellipse; Only used when Trigger Object is empty. |
| `Trigger Width` | `number` | Conditional | `4` | Only used when Trigger Object is empty. |
| `Trigger Height` | `number` | Conditional | `4` | Only used when Trigger Object is empty. |
| `Activated Time` | `number` | Conditional | `1` | Only used when Button Behavior == 'Timed'. |
| `Bots Can Trigger` | `bool` | Conditional | `False` | Ignored when Button Behavior == 'Custom'. |
| `Cinematic Unlock` | `bool` | Conditional | `False` | Only affects player-triggered unlocks. Ignored when Button Activated Behavior is empty or refers to a missing object. |
| `Cinematic Duration` | `number` | Conditional | `1` | Only used when Cinematic Unlock is true. |
| `Cinematic on Bot Trigger` | `bool` | Conditional | `False` | Only used when Cinematic Unlock is true. |

[↑ Back to class index](#-index)

### OW Button Group Member

Button that participates in a Button Group or Button Combo but never unlocks checkpoints on its own.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Bot Details` | `object` | Required (schema) | `` |  |
| `Button Behavior` | `string` | Optional | `One-Time` | enum ButtonBehavior: Pressure Plate, One-Time, Toggle, Custom, Timed |
| `Script Path` | `file` | Conditional | `` | Only used when Button Behavior == 'Custom'. |
| `Trigger Object` | `object` | Optional | `` |  |
| `Trigger Type` | `string` | Conditional | `rect` | enum TriggerShape: rect, ellipse; Only used when Trigger Object is empty. |
| `Trigger Width` | `number` | Conditional | `4` | Only used when Trigger Object is empty. |
| `Trigger Height` | `number` | Conditional | `4` | Only used when Trigger Object is empty. |
| `Activated Time` | `number` | Conditional | `1` | Only used when Button Behavior == 'Timed'. |
| `Bots Can Trigger` | `bool` | Conditional | `False` | Ignored when Button Behavior == 'Custom'. |

[↑ Back to class index](#-index)

### Panel Gate

**Actual example:** `areas/DEBUGLIB.tmx` object ID `44`.

| Tiled property | Recorded value |
|---|---|
| `Gate Key` | `1` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Passenger Train

**Actual example:** `areas/Chichi.tmx` object ID `23` (name `train`).

| Tiled property | Recorded value |
|---|---|
| `Color` | `Orange` |
| `Direction` | `Up Right` |
| `End` | `28, 2` |
| `Platform Z` | `3` |
| `Speed` | `1` |
| `Start` | `28, 29` |
| `Stop` | `28, 17` |
| `Train Z` | `0` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Point of Interest

**Actual example:** `areas/DEBUGLIB.tmx` object ID `62` (name `Point of Interest`).

| Tiled property | Recorded value |
|---|---|
| `isBoss` | `true` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Pushback NPC

NPC with a moving collision zone that pushes the player.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Direction` | `string` | Optional | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Asset Name` | `string` | Optional | `male-navi-exe6_teal` |  |
| `Animation Name` | `string` | Optional | `` |  |
| `Mug Animation Name` | `string` | Optional | `` |  |
| `Dont Face Player` | `bool` | Optional | `False` |  |
| `First Dialogue` | `object` | Optional | `` |  |
| `Next Waypoint 1` | `object` | Optional | `` |  |
| `Player Exclusive` | `bool` | Optional | `False` |  |
| `Quest NPC` | `bool` | Optional | `False` |  |
| `Quest Exclusive` | `string` | Optional | `` |  |
| `Quest State` | `string` | Optional | `active` |  |
| `Collision Enabled` | `bool` | Optional | `True` |  |
| `Collision Width` | `number` | Optional | `1.5` |  |
| `Collision Height` | `number` | Optional | `1.5` |  |
| `Push Distance` | `number` | Optional | `1` |  |
| `Push Duration` | `number` | Optional | `0.28` |  |
| `Push Cooldown` | `number` | Optional | `0.75` |  |
| `Move Animation State` | `string` | Optional | `MOVE` |  |
| `Template Only` | `bool` | Conditional | `False` | Only meaningful if the referenced spawner does not also need collision push behaviour on the spawned bot. |

[↑ Back to class index](#-index)

### Quiz List

Ordered chain of Quiz Question objects.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Next 1` | `object` | Optional | `` |  |
| `Next 2` | `object` | Optional | `` |  |
| `Next 3` | `object` | Optional | `` |  |
| `Next 4` | `object` | Optional | `` |  |
| `Next 5` | `object` | Optional | `` |  |
| `Next 6` | `object` | Optional | `` |  |
| `Next 7` | `object` | Optional | `` |  |
| `Next 8` | `object` | Optional | `` |  |
| `Next 9` | `object` | Optional | `` |  |
| `Next 10` | `object` | Optional | `` |  |

[↑ Back to class index](#-index)

### Quiz Question

Single quiz entry.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Question` | `string` | Optional | `` |  |
| `Option 1` | `string` | Optional | `` |  |
| `Option 2` | `string` | Optional | `` |  |
| `Option 3` | `string` | Optional | `` |  |
| `Correct Answer` | `number` | Optional | `1` |  |

[↑ Back to class index](#-index)

### Radius Encounter

**Actual example:** `areas/MasterPath.tmx` object ID `114` (name `TESTER`).

| Tiled property | Recorded value |
|---|---|
| `Name` | `Encounter2` |
| `Once` | `false` |
| `Path` | `` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Radius` | `number` | Optional | `1` |  |
| `Name` | `string` | Optional | `` |  |
| `Path` | `file` | Optional | `` |  |
| `Once` | `bool` | Optional | `False` |  |

[↑ Back to class index](#-index)

### Radius Warp

**Actual example:** `areas/ACDC1.tmx` object ID `82` (name `DenTown`).

| Tiled property | Recorded value |
|---|---|
| `Activation Radius` | `0.6` |
| `Arrival Animation` | `arrow_down_left_in` |
| `Leave Animation` | `arrow_down_left_out` |
| `Target Area` | `DenTown1` |
| `Target Object` | `1` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Incoming Data` | `string` | Optional | `` |  |
| `Direction` | `string` | Optional | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Warp In` | `bool` | Optional | `False` |  |
| `Arrival Animation` | `string` | Optional | `` |  |
| `Dont Teleport` | `bool` | Optional | `False` |  |
| `Activation Radius` | `number` | Optional | `1` |  |
| `Target Area` | `string` | Optional | `` |  |
| `Target Object` | `string` | Optional | `` |  |
| `Leave Animation` | `string` | Optional | `` |  |

[↑ Back to class index](#-index)

### Relock Behavior

Defines which checkpoint a button re-locks when it becomes inactive.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Relock This` | `object` | Required (schema) | `` |  |
| `Area Wide` | `bool` | Optional | `False` |  |

[↑ Back to class index](#-index)

### Runner Rectangle Encounter

**Actual example:** `areas/endless-runner.tmx` object ID `212`.

| Tiled property | Recorded value |
|---|---|
| `Encounter 1` | `BossTest` |
| `Encounter 2` | `BossTest` |
| `Encounter 3` | `BossTest` |
| `Pick Mode` | `random` |
| `Return Point Type` | `Endless Runner Spawn` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Rush Road

ezrushroads interaction object.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Rush Object` | `object` | Optional | `` |  |
| `Direction` | `string` | Optional | `Down Left` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |

[↑ Back to class index](#-index)

### Server Warp

**Actual example:** `areas/crimsonhp.tmx` object ID `324` (name `Gobby's somthing one`).

| Tiled property | Recorded value |
|---|---|
| `Address` | `keristero.xyz` |
| `Data` | `TheBlock_1` |
| `Direction` | `Down Left` |
| `Incoming Data` | `ReyOverhead_1` |
| `Port` | `9876` |
| `Warp In` | `true` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Incoming Data` | `string` | Optional | `` |  |
| `Direction` | `string` | Optional | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Warp In` | `bool` | Optional | `False` |  |
| `Arrival Animation` | `string` | Optional | `` |  |
| `Dont Teleport` | `bool` | Optional | `False` |  |
| `Address` | `string` | Optional | `` |  |
| `Port` | `number` | Optional | `0` |  |
| `Data` | `string` | Optional | `` |  |
| `Warp Out` | `bool` | Optional | `False` |  |

[↑ Back to class index](#-index)

### Shopping question

**Actual example:** `areas/porttown2.tmx` object ID `218` (name `Question`).

| Tiled property | Recorded value |
|---|---|
| `Dialogue Type` | `question` |
| `Next 1` | `219` |
| `Next 2` | `220` |
| `Text 1` | `Would you like to see my wares?~` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Spawn Point

Player arrival point for Liberation missions. The assigned player faces this direction after transfer; Next Spawn links to the next player's Spawn Point.

**Actual example:** `areas/DEBUGLIB.tmx` object ID `1` (name `Spawn`).

| Tiled property | Recorded value |
|---|---|
| `Facing Direction` | `Down Right` |
| `Next Spawn` | `2` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Next Spawn` | `object` | Optional | `` |  |
| `Facing Direction` | `string` | Optional | `Down` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |

[↑ Back to class index](#-index)

### Tournament Board

**Actual example:** `areas/default.tmx` object ID `274` (name `Tournament Board`).

| Tiled property | Recorded value |
|---|---|
| `Best Of` | `3` |
| `Board Background` | `blue_bn4` |
| `Board Type` | `hosted` |
| `Registration Lead Seconds` | `600` |
| `Tournament Every Hours` | `0` |
| `Tournament GP Reward` | `1` |
| `Tournament Hour Offset` | `0` |
| `Tournament Money Reward` | `15000` |
| `Tournament NPC Pool` | `open_strong` |
| `Tournament Name` | `Unlimited` |
| `Tournament PVP Mode` | `open` |
| `Tournament Start Minute` | `5` |
| `Tournament Start Second` | `0` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Trap Panel

**Actual example:** `areas/DEBUGLIB.tmx` object ID `39`.

| Tiled property | Recorded value |
|---|---|
| `Damage Dealt` | `10` |
| `Damage Trap` | `true` |

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Unlock Behavior

Defines which checkpoint a button unlocks when it becomes active.

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Unlock This` | `object` | Required (schema) | `` |  |
| `Unlock Permanently` | `bool` | Optional | `False` |  |
| `Area Wide` | `bool` | Optional | `False` |  |

[↑ Back to class index](#-index)

### Water Refill

**No example placement in the uploaded areas.** Use the schema list below; runtime behavior has not been verified against a map.

**No generated schema class found.** Fields shown above come from the maps, not a verified class definition.

[↑ Back to class index](#-index)

### Waypoint

Navigation node for NPCs. Move Animation handles travel; Wait Animation handles the arrival hold. Set Move Duration > 0 for scripted (jump-style) movement where

**Actual example:** `areas/endless-runner.tmx` object ID `210`.

| Tiled property | Recorded value |
|---|---|
| `Default Option` | `1` |
| `Direction` | `Up Left` |
| `Is Choice` | `true` |
| `Option 1` | `Straight` |
| `Option 2` | `Left Detour` |
| `Option 3` | `Right Detour` |
| `Prompt` | `Which way?` |
| `Target 1` | `206` |
| `Target 2` | `211` |
| `Target 3` | `214` |
| `Timeout` | `20` |
| `Wait Animation` | `IDLE_UL` |

| Schema property | Tiled type | Status | Default | Enumeration / condition |
|---|---|---|---|---|
| `Wait Time` | `number` | Optional | `0` |  |
| `Direction` | `string` | Optional | `` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right |
| `Waypoint Type` | `string` | Optional | `first` | enum WaypointType: first, random, before, after |
| `Date` | `string` | Conditional | `` | Only used when Waypoint Type is 'before' or 'after'. |
| `Move Animation` | `string` | Conditional | `` | Move Loop controls whether it restarts each cycle. For animations with intrinsic timing (jumps), also set Move Duration > 0 to sync position with the animation. |
| `Move Loop` | `bool` | Conditional | `True` | Only meaningful when Move Animation is set. |
| `Move Duration` | `number` | Conditional | `0` | Only meaningful when Move Animation is set. Leave 0 for walk cycles; set to the animation's total duration for one-shot arcs. |
| `Move Direction` | `string` | Conditional | `` | enum Direction: Up, Down, Left, Right, Up Left, Up Right, Down Left, Down Right; Ignored when Move Animation is set; the animation's encoded facing wins. |
| `Wait Animation` | `string` | Conditional | `` | Only visible when Wait Time > 0 (the pose is applied on arrival and immediately overridden once travel resumes). |
| `Wait Loop` | `bool` | Conditional | `True` | Only used when Wait Animation is set. |
| `Next Waypoint 1` | `object` | Optional | `` |  |
| `Next Waypoint 2` | `object` | Optional | `` |  |
| `Next Waypoint 3` | `object` | Optional | `` |  |
| `Next Waypoint 4` | `object` | Optional | `` |  |
| `Next Waypoint 5` | `object` | Optional | `` |  |

**Observed-only custom fields:** `Default Option`, `Is Choice`, `Option 1`, `Option 2`, `Option 3`, `Prompt`, `Target 1`, `Target 2`, `Target 3`, `Timeout`.

[↑ Back to class index](#-index)
