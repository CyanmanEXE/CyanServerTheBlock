# `constants.lua`

> **Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/constants.lua`  
> **Source lines:** 155  
> **Functions detected:** 0  
> **Table declarations detected:** 10

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

constants.lua Centralised definitions for custom properties and constants used in liberations.

## Dependencies

- No `require(...)` dependency was detected.

## Events

- No direct `Net:on(...)` registration was detected.

## Functions

No named function declarations were detected. This file may contain data, inline callbacks, or executable setup code.

## Tables and data structures

### `Constants` *(line 3)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `Constants.Defaults` *(line 7)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `MaxOrderPoints` | number literal | `9` |

### `Constants.CustomProperties` *(line 12)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `RespawnArea` | string literal | `"Respawn Area"` |
| `WaitingArea` | string literal | `"Waiting Area"` |
| `LiberationMapFileName` | string literal | `"Liberation Map File Name"` |
| `LiberationTileset` | string literal | `"Liberation Tileset"` |
| `MaxOrderPoints` | string literal | `"Max Order Points"` |
| `LiberationEncounters` | string literal | `"Liberation Encounters"` |
| `TargetPhaseCount` | string literal | `"Target Phase Count"` |
| `TargetPlayerCount` | string literal | `"Target Player Count"` |
| `MinimumTargetPhaseCount` | string literal | `"Minimum Target Phase Count"` |
| `BackgroundTexture` | string literal | `"Background Texture"` |
| `BackgroundAnimation` | string literal | `"Background Animation"` |
| `BackgroundVelX` | string literal | `"Background Vel X"` |
| `BackgroundVelY` | string literal | `"Background Vel Y"` |
| `Song` | string literal | `"Song"` |
| `VictoryLapSong` | string literal | `"Victory Lap Song"` |
| `HonorHPMem` | string literal | `"Honor HPMem"` |
| `Compress` | string literal | `"Compress"` |
| `Decompress` | string literal | `"Decompress"` |
| `Boss` | string literal | `"Boss"` |
| `BossID` | string literal | `"Boss ID"` |
| `BossID1` | string literal | `"Boss ID 1"` |
| `BossID2` | string literal | `"Boss ID 2"` |
| `Type` | string literal | `"Type"` |
| `SpawnMode` | string literal | `"Spawn Mode"` |
| `TriggerBoss` | string literal | `"Trigger Boss"` |
| `SpawnOffsetX` | string literal | `"Spawn Offset X"` |
| `SpawnOffsetY` | string literal | `"Spawn Offset Y"` |
| `SpawnOffsetZ` | string literal | `"Spawn Offset Z"` |
| `AutoFacePlayer` | string literal | `"Auto Face Player"` |
| `BossHealthOverride` | string literal | `"Boss Health Override"` |
| `SpawnEnabled` | string literal | `"Spawn Enabled"` |
| `BossDisplayName` | string literal | `"Boss Display Name"` |
| `Shared` | string literal | `"Shared"` |
| `Spawns` | string literal | `"Spawns"` |
| `Direction` | string literal | `"Direction"` |
| `GateKey` | string literal | `"Gate Key"` |
| `GateID` | string literal | `"Gate ID"` |
| `isBoss` | string literal | `"isBoss"` |
| `Message` | string literal | `"Message"` |
| `EncounterPath` | string literal | `"Encounter Path"` |
| `SpecificLoot` | string literal | `"Specific Loot"` |
| `DamageTrap` | string literal | `"Damage Trap"` |
| `StunTrap` | string literal | `"Stun Trap"` |
| `TrapMessage` | string literal | `"Trap Message"` |
| `DamageDealt` | string literal | `"Damage Dealt"` |
| `Money` | string literal | `"Money"` |
| `NextSpawn` | string literal | `"Next Spawn"` |
| `GateToRemove` | string literal | `"Gate To Remove"` |
| `LiberationMapName` | string literal | `"Liberation Map Name"` |

### `Constants.PanelTypes` *(line 65)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `DarkPanel` | string literal | `"Dark Panel"` |
| `DarkHole` | string literal | `"Dark Hole"` |
| `IndestructiblePanel` | string literal | `"Indestructible Panel"` |
| `ItemPanel` | string literal | `"Item Panel"` |
| `PanelGate` | string literal | `"Panel Gate"` |
| `BonusPanel` | string literal | `"Bonus Panel"` |
| `TrapPanel` | string literal | `"Trap Panel"` |

### `Constants.LiberatablePanelTypes` *(line 76)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `Constants.PanelTypes.DarkPanel` |
| `[2]` | expression/reference | `Constants.PanelTypes.ItemPanel` |
| `[3]` | expression/reference | `Constants.PanelTypes.DarkHole` |
| `[4]` | expression/reference | `Constants.PanelTypes.BonusPanel` |
| `[5]` | expression/reference | `Constants.PanelTypes.TrapPanel` |

### `Constants.WalkablePanelTypes` *(line 85)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `Constants.PanelTypes.DarkPanel` |
| `[2]` | expression/reference | `Constants.PanelTypes.ItemPanel` |
| `[3]` | expression/reference | `Constants.PanelTypes.TrapPanel` |

### `Constants.ShadowstepPanelTypes` *(line 92)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | expression/reference | `Constants.PanelTypes.DarkPanel` |
| `[2]` | expression/reference | `Constants.PanelTypes.ItemPanel` |
| `[3]` | expression/reference | `Constants.PanelTypes.TrapPanel` |

### `Constants.LootAnimations` *(line 99)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `Heart` | string literal | `"HEART"` |
| `Chip` | string literal | `"CHIP"` |
| `Money` | string literal | `"MONEY"` |
| `BugFrag` | string literal | `"BUGFRAG"` |
| `OrderPoint` | string literal | `"ORDER_POINT"` |
| `Invincibility` | string literal | `"INVINCIBILITY"` |
| `MajorHit` | string literal | `"MAJOR_HIT"` |
| `Key` | string literal | `"KEY"` |

### `Constants.AbilityIDs` *(line 111)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `LongSwrd` | string literal | `"LongSwrd"` |
| `WideSwrd` | string literal | `"WideSwrd"` |
| `OldSaber` | string literal | `"OldSaber"` |
| `HevyShld` | string literal | `"HevyShld"` |
| `HexScyth` | string literal | `"HexScyth"` |
| `NumGadgt` | string literal | `"NumGadgt"` |
| `GutsHamr` | string literal | `"GutsHamr"` |
| `ShdwShoe` | string literal | `"ShdwShoe"` |

### `Constants.PreloadAssets` *(line 123)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/options-ui.png"` |
| `[2]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/options-ui.animation"` |
| `[3]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/attack indicator.png"` |
| `[4]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/attack indicator.tsx"` |
| `[5]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/Liberation Collision.png"` |
| `[6]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/Liberation Collision.tsx"` |
| `[7]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/selected tile.png"` |
| `[8]` | string literal | `"/server/assets/ezlibs-custom/nebulous-liberations/selected tile.tsx"` |
| `[9]` | string literal | `"/server/assets/NebuLibsAssets/bots/blur.png"` |
| `[10]` | string literal | `"/server/assets/NebuLibsAssets/bots/blur.animation"` |
| `[11]` | string literal | `"/server/assets/NebuLibsAssets/bots/explosion.png"` |
| `[12]` | string literal | `"/server/assets/NebuLibsAssets/bots/explosion.animation"` |
| `[13]` | string literal | `"/server/assets/NebuLibsAssets/bots/paralyze.png"` |
| `[14]` | string literal | `"/server/assets/NebuLibsAssets/bots/paralyze.animation"` |
| `[15]` | string literal | `"/server/assets/NebuLibsAssets/bots/recover.png"` |
| `[16]` | string literal | `"/server/assets/NebuLibsAssets/bots/recover.animation"` |
| `[17]` | string literal | `"/server/assets/NebuLibsAssets/bots/item.png"` |
| `[18]` | string literal | `"/server/assets/NebuLibsAssets/bots/item.animation"` |
| `[19]` | string literal | `"/server/assets/NebuLibsAssets/sound effects/hurt.ogg"` |
| `[20]` | string literal | `"/server/assets/NebuLibsAssets/sound effects/explode.ogg"` |
| `[21]` | string literal | `"/server/assets/NebuLibsAssets/sound effects/paralyze.ogg"` |
| `[22]` | string literal | `"/server/assets/NebuLibsAssets/sound effects/recover.ogg"` |
| `[23]` | string literal | `"/server/assets/net-games/meters/liberation-order-points/base-guage-3slice.png"` |
| `[24]` | string literal | `"/server/assets/net-games/meters/liberation-order-points/base-guage-3slice.animation"` |
| `[25]` | string literal | `"/server/assets/net-games/meters/liberation-order-points/points-3slice.png"` |
| `[26]` | string literal | `"/server/assets/net-games/meters/liberation-order-points/points-3slice.animation"` |
| `[27]` | string literal | `"/server/assets/net-games/meters/liberation-order-points/point-total-3slice.png"` |
| `[28]` | string literal | `"/server/assets/net-games/meters/liberation-order-points/point-total-3slice.animation"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/ezlibs-custom/nebulous-liberations/liberations/constants.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
