# ⚔️ Nebulous Liberations — Tiled setup recipes and field requirements

[🏠 Documentation home](../index.md) · [🗺️ Full Tiled class catalog](TILED_OBJECT_REFERENCE.md) · [🧩 Liberation Lua reference](../ezlibs-custom/nebulous-liberations/index.md) · [🎮 PlayerManager](../player-interface/history/manager/README.md)

> **Evidence:** Current `scripts/ezlibs-custom/nebulous-liberations/main.lua`, `liberations/{instance,validation,enemy_config,constants,loot,camera_sequence}.lua`, the generated Tiled schema and exact property values from `areas/DEBUGLIB.tmx`, `areas/LiberationNormalMode.tmx` and `areas/default.tmx`. Examples marked **actual** reproduce objects in those files. Source-verified requirements can be stricter than class-editor defaults.

## 🗂️ Contents

- [Required mission objects](#-required-mission-objects)
- [Start and return gates](#-start-and-return-gates)
- [Enemies, bosses, and encounter references](#-enemies-bosses-and-encounter-references)
- [HP, battle scale, AI overrides](#-hp-battle-scale-ai-overrides)
- [Panels and unlocks](#-panels-and-unlocks)
- [Camera and music](#-camera-and-music)
- [Validation and testing](#-validation-and-testing)

## 🏁 Required mission objects

| Object type / field | Requirement | Source behavior |
|---|---|---|
| `Liberation Config` object | **Required** | `Mission:new` finds `Liberation Tileset` only on this typed object |
| `Liberation Config` → `Liberation Tileset` | **Required, nonempty**, and resolvable by `Net.get_tileset` | Missing or invalid tileset prevents mission initialization |
| `Spawn Point` object named exactly `Spawn` | **Required** | `Mission:get_spawn_position()` uses `Net.get_object_by_name(instance, "Spawn")`; launcher rejects a missing spawn |
| `Spawn Point` → `Facing Direction` | Optional, defaults to `Down` in the launcher | Eight supported directions: `Up`, `Down`, `Left`, `Right`, `Up Left`, `Up Right`, `Down Left`, `Down Right` |
| `Spawn Point` → `Next Spawn` | Optional, **warning** if absent | Use an **object reference** to another `Spawn Point` for party spawn chains; otherwise fallback is the named `Spawn` |
| `Liberation Config` → `Respawn Area`, `Waiting Area` | Optional at the class level; recommended on a playable map | Used for return destination and lobby/party registration. Missing destination may fall back to a loaded `default` area |
| `Liberation Config` → `Max Order Points` | Optional, defaults to the supplied cap or `9` | Positive integer cap for the per-player order points gauge |
| `Liberation Config` → `Target Phase Count`, `Target Player Count`, `Minimum Target Phase Count` | Optional | Mission's phase scaling reads values with defaults from `Net.get_area_custom_property`; see runtime values rather than assuming a particular TMX property is mirrored to the area |
| `Liberation Config` → `Honor HPMem`, `Victory Lap Song`, `Encounter Music` | Optional | The latter references a `Music Definition` object, not an arbitrary encounter-name string |

**Actual DEBUGLIB mission configuration:**

| Tiled object | Type | Actual properties |
|---|---|---|
| `#75` named `GLOBAL: Liberation Config` | `Liberation Config` | `Liberation Tileset=/server/assets/ezlibs-custom/nebulous-liberations/tiles/panels.tsx`, `Max Order Points=40`, `Respawn Area=default`, `Waiting Area=default`, `Target Phase Count=10`, `Target Player Count=8`, `Minimum Target Phase Count=1`, `Honor HPMem=true`, `Encounter Music=108` |
| `#1` named `Spawn` | `Spawn Point` | `Facing Direction=Down Right`, `Next Spawn=2` |
| `#2` named `Spawn2` | `Spawn Point` | `Facing Direction=Down Right`, `Next Spawn=3` |
| `#108` | `Music Definition` | No properties explicitly set on this actual object; check its tileset/asset definition before expecting custom music |

For the tileset to work, the TSX must also be included in the loaded area. The uploaded assets archive includes `assets/ezlibs-custom/nebulous-liberations/tiles/panels.tsx`; this **does not** independently prove that the installed server deploys assets at the expected `/server/assets/...` path.

## 🚪 Start and return gates

| Object | Required fields | Optional fields / notes | Actual placement |
|---|---|---|---|
| `Liberation Gate` in a waiting map | **One valid target**: `Liberation Map File Name` or legacy `Liberation Map Name` | `Name` controls map presentation; the runtime uses the property, not the name, as the mission reference | `areas/default.tmx` object `#185`, `Liberation Map File Name=DEBUGLIB` |
| `Spawn Point` named `Liberation Respawn` | Needed only if explicitly targeting that return position | The cleanup code also tries an area's default spawn; missing respawn falls back when possible | `areas/default.tmx` object `#187` |
| `NPC` / `Dialogue` launcher | Existing eznpcs flow: the `Dialogue` must dispatch `Event Name=Liberation Mission Selector` | Event handling comes from `mission_selector.lua`; separate from gate interaction | See `scripts/_DOCUMENTATION/ezlibs-custom/nebulous-liberations/GOLDEN_PROG_MISSIONS.md`, but confirm object IDs in your current map |

The mission area is the base map ID (`DEBUGLIB`), **not** the dynamically generated `liberation_<player>` instance ID. The instance is created and transferred automatically.

## 👾 Enemies, bosses, and encounter references

Use a placed `Dark Hole`, `Dark Hole Buffed Virus`, or `Boss Dark Panel` with separate reusable `Bot Config` and `Encounter Config` objects. Fields typed `object` must reference the **Tiled numeric object ID** of another object **in the same area**, not its display name.

| Object | Required for functional spawning | Optional settings | Actual DEBUGLIB reference |
|---|---|---|---|
| `Dark Hole` | A resolvable `Spawns` template, usually via `Bot Config` | `Direction`, `Boss ID 1` through `Boss ID 9`, `OW Encounter Config`, `Liberation Encounter Config` | `#7` uses `Bot Config=115`, `OW Encounter Config=116`, `Liberation Encounter Config=111`, `Boss ID 1=ShadeMan_02`, `Direction=Down Right` |
| `Dark Hole Buffed Virus` | Same as Dark Hole: a resolvable overworld bot template | Same typed links; independent max HP and scale from its referenced Bot Config | `#126` uses `Bot Config=124`, `OW Encounter Config=125`, `Direction=Down Right` |
| `Boss Dark Panel` | A resolvable `Spawns` template; unique boss group (default object ID, or `Boss ID`) | `Auto Face Player`, `Direction`, `OW Encounter Config`, `Spawn Mode`, `Trigger Boss`, offsets | `#61` uses `Boss ID=ShadeMan_01`, `Bot Config=117`, `OW Encounter Config=118`, `Direction=Up Left`, `Auto Face Player=true` |
| `Bot Config` | **`Spawns` nonempty when referenced for enemy spawning** (the validator errors without a template) | HP, scales, AI, attack/damage modifiers, regeneration | `#115` uses `Spawns=BigBrute` |
| `Encounter Config` | Conditional: `Encounter Name` for a fixed named encounter or valid `Name #` entries for a pool | `Encounter Mode`, `Encounter Category`, `Encounter Pool`, positive `Weight #` | `#125` uses `Encounter Category=special_encounters`, `Encounter Mode=Fixed`, `Encounter Name=Mettaur` |

### Actual fixed encounter example (`DEBUGLIB.tmx`)

**Placed `Dark Hole Buffed Virus` #126:**

```text
Object type: Dark Hole Buffed Virus
Name: TEST - Mettaur - 0.75x - 40HP
Bot Config: 124                 (object reference)
OW Encounter Config: 125        (object reference)
Direction: Down Right
```

**Referenced `Bot Config` #124:**

```text
Object type: Bot Config
Spawns: Mettaur
Max HP: 40
Starting HP: 40
OW Scale: 0.75
Battle Scale: 0.75
Battle Scale Scope: Matching
AI Type: shockwave_line
OW Attack Damage: 20
Battle Attack Multiplier: 1
Battle Defense Multiplier: 1
Heal Percent Per Turn: 0
```

**Referenced `Encounter Config` #125:**

```text
Object type: Encounter Config
Encounter Mode: Fixed
Encounter Category: special_encounters
Encounter Name: Mettaur
```

Every value above is present in the actual map. Replace only the referenced IDs if you copy these objects into another map.

### Actual weighted-pool chain (`DEBUGLIB.tmx`)

`Dark Hole #7` → `OW Encounter Config #116` → `Encounter Pool #113`. `#116` uses `Encounter Mode=Pool`, `Encounter Category=special_encounters`, `Encounter Name=BigBrute`, `Encounter Pool=113`. `#113` uses `Name 1=BigBrute`, `Weight 1=1` and the same category.

**Numbered fields:** `Name 1` through `Name 9` and corresponding `Weight 1` through `Weight 9` are optional manual properties on **new** `Encounter Config` objects. Positive weights are required **when provided**; a weight without a matching nonempty name produces a warning. Names/weights beyond 9 are reported as excessive or ignored by the current normalizer. Legacy `Dark Hole Encounter List`/`Liberation Encounter Pool` objects have a separate compatibility reader.

**Boss relationship:** `Boss ID` identifies a boss group; `Boss ID 1` etc. on Dark Holes or Indestructible Panels associate them with that group. `Boss Dark Panel` `Spawn Mode` defaults to `Immediate`; supported alternatives are `On Dark Hole Cleared`, `Manual`, `After Boss Defeated`. **`Trigger Boss` is conditionally required for `After Boss Defeated`** (validated by `validation.lua`). `Indestructible Panel` `Type` is `All` or `Any` for its multiple boss references.

## 📊 HP, battle scale, AI overrides

| `Bot Config` property | Required? | Current resolution (`enemy_config.lua`) |
|---|---|---|
| `Spawns` | Required for a spawned enemy | Selects a registered overworld enemy template; it is **not** the encounter name |
| `Max HP`, `Starting HP` | Optional | Positive numbers override inherited HP; starting HP is capped at resolved max HP |
| `OW Scale` | Optional | Positive scale override; fallback to legacy `scale` or inherited values |
| `Battle Scale` | Optional | Positive override; otherwise defaults to resolved OW Scale |
| `Battle Scale Scope` | Optional | `All` explicitly opts into all enemies in battle; other values resolve as `Matching` |
| `OW Attack Damage`, `OW Damage Multiplier`, `OW Defense Multiplier` | Optional | Positive numbers override relevant overworld statistics |
| `Battle Attack Multiplier`, `Battle Defense Multiplier` | Optional | Positive numbers override battle modifiers |
| `AI Type` | Optional | `Auto` or one of the schema's enemy AI profiles; the runtime validator currently lists fewer enum values than the Tiled editor, so check the validator for the chosen type |
| `OW Attack Shape`, `OW Attack Range`, `OW Movement Mode`, `OW Movement Tiles` | Optional | Override a template's own attack/movement profile; `OW Movement Tiles=0` explicitly allows no movement |
| `OW Telegraph Seconds`, `OW Windup Seconds`, `OW Step Seconds` | Optional | Positive numbers override action timing |
| `Heal Percent Per Turn`, `Heal Flat Per Turn` | Optional | `-1` is inherit; `0` is explicitly disabled; boss default percentage is `10` if no value resolves |

**Examples in this actual DEBUGLIB map:** Mettaur bot configurations `#124` (`0.75`, 40 HP), `#128` (`1.5`, 240 HP), `#132` (`2`, 1200 HP). The map also includes other virus tests and per-template scaling. These are **configuration values**, not proof of correct ONB battle-client rendering.

`EnemyConfig.resolve` uses: placed object fields → referenced `Bot Config` → category-specific `Liberation Enemy Defaults` → global defaults. Encounter settings may also come from referenced `OW Encounter Config`. Non-positive legacy HP/scale overrides normally do not become active values; healing explicitly treats zero as meaningful.

## 🟫 Panels and unlocks

| Object | Required / conditional fields | Optional settings | Actual map example |
|---|---|---|---|
| `Dark Panel` | No typed custom property required; needs registered panel GID/shape | Legacy boss/directive fields exist | Many unconfigured placements in `DEBUGLIB.tmx` |
| `Item Panel` | None for randomized loot; `Specific Loot` when forcing a drop | `Gate Key` when a `KEY` should unlock a matching gate, `Money` when appropriate | `DEBUGLIB #41` `Specific Loot=ORDER_POINT`; `LiberationNormalMode #36` `Specific Loot=KEY, Gate Key=1` |
| `Panel Gate` | **`Gate Key` required** (validator errors if missing) | `Gate ID` optionally groups gate-associated camera points | `DEBUGLIB #44` `Gate Key=1` |
| `Trap Panel` | A meaningful trap setting for trap behavior | `Damage Trap`, `Damage Dealt`, `Stun Trap`, `Trap Message` | `DEBUGLIB #39` `Damage Trap=true, Damage Dealt=10`; `#40` `Stun Trap=true` |
| `Bonus Panel` | None required at class level | `Order Point`, `Money` | `DEBUGLIB #67` `Order Point=8` |
| `Indestructible Panel` | Condition-dependent boss IDs if boss-gated | `Boss ID 1…9`, `Type=All/Any` | `DEBUGLIB #53` `Boss ID 1=ShadeMan_01, Boss ID 2=ShadeMan_02, Type=All` |
| `Dark Hole` | See enemy configuration table | `Boss ID 1…9` to associate clearing with a boss | `DEBUGLIB #7` |
| `Dark Hole Buffed Virus` | See enemy configuration table | Additional persistent enemy bot testing | `DEBUGLIB #126` |

The `KEY` loot code displays its message, resolves matching gates, removes them, and then starts the associated camera-point sequence. This ordering is enforced by `liberations/loot.lua` and is important when editing gate-key object references.

## 📷 Camera and music

| Object / field | Required? | How it behaves |
|---|---|---|
| `Point of Interest` | Optional | `Mission:begin` reads the mission's points of interest and schedules camera slides. `DEBUGLIB` objects `#62` (`isBoss=true`) and `#63` (`isBoss=false`) are actual examples |
| `Point of Interest` → `CameraDuration` | Optional | `camera_sequence.lua` accepts a numeric seconds override per point (fallback slide time `0.5`) |
| `Point of Interest` → `CameraEase` | Optional map property, **currently not read** by `camera_sequence.lua` | Do not assume easing changes based on this field |
| `Liberation Config` → `Encounter Music` | Optional object reference | Refers to a `Music Definition` in the same base map (`DEBUGLIB #75` references `#108`) |
| `Music Definition` → `Path`, `Loop Start`, `Loop End` | Optional in code; use for configured sound | The definition is read from referenced object's custom properties |
| `Liberation Config` → `Victory Lap Song` | Optional path string | Used by mission configuration |

Mission startup now uses a separate per-player `liberation:intro` input capture. An existing free camera is deactivated before starting scripted movement, and the return to player tracking is requested after that player's sequence timer completes. Automatic free-camera activation is blocked while in an instanced `liberation_` map.

## ✅ Validation and testing

`liberations/validation.lua` reports errors/warnings about missing templates, wrong-class object references, unsupported enums, numeric negatives (except the healing `-1` sentinel), missing gate keys, invalid weighted entries, duplicate boss IDs, and missing spawn links. Its top-level report is diagnostic: an invalid object may still be skipped or handled by the runtime fallback, so do not equate a logged warning with a hard mission-load failure.

Before calling the map ready, verify that the loaded area contains a valid `Liberation Config` and `Spawn`, every linked object ID resolves **within that map**, its `Spawns` template is supported, encounter names exist in the base area's encounter table, and the specific battle package is provisioned. Test solo and party starts, menu Cancel, gate-key acquisition, boss triggers, and the intro with no buttons pressed. Consult the [source-derived Tiled catalog](TILED_OBJECT_REFERENCE.md) for every other object class and all editor-provided properties.
