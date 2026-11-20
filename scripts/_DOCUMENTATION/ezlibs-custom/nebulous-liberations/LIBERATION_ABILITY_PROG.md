# 🟡 Liberation Ability Prog — Gold Shop

> Dedicated Tiled NPC class implemented by `scripts/ezlibs-custom/nebulous-liberations/liberations/ability_shop.lua`.
>
> Uses the existing `scripts/net-games/menuAPI/main.lua` `scroll_list`, its built-in `gold` palette, and `ezmemory` persistent key-item inventory. It does **not** use native `Net.open_shop` or the blue Liberation option-menu skin.

## 📑 Contents

1. [Purpose and behavior](#purpose-and-behavior)
2. [Tiled object definition](#tiled-object-definition)
3. [Optional price and ownership behavior](#optional-price-and-ownership-behavior)
4. [Examples](#examples)
5. [Migrating existing maps](#migrating-existing-maps)
6. [Runtime and integration](#runtime-and-integration)
7. [Updated ownership, equipment and mission actions](#updated-ownership-equipment-and-mission-actions-2026-11-20)
8. [Validation](#validation)

## Purpose and behavior

- **Class/type:** `Liberation Ability Prog` (not plain `NPC` or `Dialogue`). The general `eznpcs` handler spawns the Gold Prog and supplies a synthetic `Liberation Ability Shop` event without requiring a `First Dialogue` object.
- **Sprite:** `prog-gold`, using the existing `assets/ezlibs-assets/eznpcs/sheet/prog-gold.png` / `.animation`.
- **Menu:** controller-driven BN-style scroll list. The menu title, ability names, prices, and frame use a golden tint; the rows have a right-hand value column. Cancel closes it; menu input focus and cleanup are managed by `PlayerInterface` through `MenuAPI`.
- **Ability inventory:** `ezmemory` key items. Only one Liberation ability can be equipped at a time, matching the old `Grant Liberation Mission Ability` event. Choosing a different ability removes the old one and grants the new one.
- **Owned:** if the ability is currently **equipped**, the right column shows `Owned`. Previously purchased/earned (but not equipped) abilities instead show `Unlocked`; these can be re-equipped for free.
- **Unpriced/free:** if `Enable Costs` is false or absent, an unowned ability displays **no right-column text**. When it is true and a price is `0` or omitted, the column shows `Free`.
- **Paid:** if `Enable Costs` is true and `Cost N` is positive, the right column shows that amount with a `Z` suffix; the shop charges `ezmemory` Zenny only on first acquisition when the player has sufficient funds. Insufficient funds do not change inventory.

## Tiled object definition

Place a regular Tiled **Object** at the Prog's overworld position, then assign the class `Liberation Ability Prog`. Use the updated `scripts/ezlibs-scripts/ezlibs-types.json` in your Tiled project. The same definition is in `generate-ezlibs-tiled.lua` and the regenerated runtime schema/reference.

| Property | Tiled type | Required? | Default | Meaning |
|---|---|---|---|---|
| `Direction` | `Direction` enum | Yes | `Down` | Initial facing (`Up Left`, `Up Right`, etc.) |
| `Asset Name` | string | Yes | `prog-gold` | Gold Prog overworld sprite asset basename |
| `Ability 1` | string | Conditional | empty | First offered canonical Liberation ability ID. At least one of `Ability 1`–`Ability 13` must be valid. |
| `Ability 2`–`Ability 13` | string | No | empty | Additional offered abilities, in the order authored |
| `Welcome Text` | string | No | empty | Gold-framed greeting with dark-gold glyphs, dismissed before the shop opens |
| `Enable Costs` | bool | No | `false` | Enables prices and payment for this Prog |
| `Cost 1`–`Cost 13` | int | No | `0` | Price corresponding to `Ability N`, only used when costs are enabled |
| `Requires Unlock 1`–`Requires Unlock 13` | bool | No | `false` | When true, the ability is `Locked` until explicitly unlocked by a quest/award |
| `Animation Name` | string | No | empty | Existing eznpcs animation override |
| `Mug Animation Name` | string | No | empty | Existing eznpcs mug animation override |
| `Dont Face Player` | bool | No | `false` | Existing eznpcs orientation behavior |
| `Player Exclusive` | bool | No | `false` | Per-player NPC visibility |
| `Quest NPC` / `Quest Exclusive` / `Quest State` | bool/string/string | No | false/empty/active | Existing eznpcs quest gating |
| `Template Only` | bool | No | `false` | Excluded from ordinary spawning, for NPC Spawner templates |

**Accepted canonical ability IDs:** `HeroSwrd`, `WideSwrd`, `OldSaber`, `Guard`, `HevyShld`, `HexSickle`, `NumGadgt`, `GutsHamr`, `ShdwShoe`, `CrosBmb`, `Burner`, `Blaster`, `Bazooka`. Unknown/duplicate IDs are omitted from the shop and logged. `Cost N` is attached to the same-numbered ability slot, not to the ability name globally.

## Optional price and ownership behavior

| Player state | Enable Costs? | Cost N | Right-hand text | On selection |
|---|---|---:|---|---|
| Not unlocked, not quest-gated | false/absent | Any | **blank** | Unlocks and equips free |
| Not unlocked, not quest-gated | true | 0/absent | `Free` | Unlocks and equips free |
| Not unlocked, not quest-gated | true | 250 | `250 Z` | Charges once; unlocks and equips |
| Previously unlocked, not equipped | Either | Any | `Unlocked` | Re-equips free |
| Currently equipped | Either | Any | `Owned` | No action |
| Quest-gated and not yet unlocked | Either | Any | `Locked` | Not selectable until external unlock |

## Examples

### Example A — completely free shop

```text
Object name: Ability Prog
Object type/class: Liberation Ability Prog
Position: (x, y, z) — place in Tiled
Direction: Up Right
Asset Name: prog-gold
Ability 1: HeroSwrd
Ability 2: WideSwrd
Ability 3: ShdwShoe
Enable Costs: false   # optional; false by default
```

**Before ownership:**

```text
Gold Shop
  Hero Sword
  Wide Sword
  Shadow Shoe
  Cancel
```

**After choosing WideSwrd:**

```text
Gold Shop
  Hero Sword
  Wide Sword     Owned
  Shadow Shoe
  Cancel
```

### Example B — priced shop

```text
Object name: Ability Prog
Object type/class: Liberation Ability Prog
Direction: Up Left
Asset Name: prog-gold
Ability 1: GutsHamr
Cost 1: 500
Ability 2: OldSaber
Cost 2: 1000
Ability 3: NumGadgt
Cost 3: 0
Enable Costs: true
```

The right column shows `500 Z`, `1000 Z`, and `Free` for unowned items. For the equipped ability, it shows `Owned` instead.

## Migrating existing maps

This patch includes `tools/migrate_liberation_ability_progs.lua`. **Back up your server** and run from the server root:

```bash
lua tools/migrate_liberation_ability_progs.lua --dry-run
lua tools/migrate_liberation_ability_progs.lua
```

On Windows, use a Lua interpreter in Command Prompt (`lua tools\migrate_liberation_ability_progs.lua`), or edit the six Prog objects manually in Tiled.

The migrator handles only `NPC` objects named `Ability Prog` in existing `areas/default.tmx`, `areas/christmas.tmx`, and `areas/ooo.tmx`. It follows the *actual linked* old quiz/grant objects to derive offered IDs, adds `Ability N`/`Enable Costs=false`, changes the type, and preserves all other objects and tile layers **byte-for-byte**. Each modified map gets a `.tmx.ability-prog.bak` backup. The old dialogue nodes remain in the file but are no longer entered from the new subtype.

Existing placements identified in the uploaded areas archive:

| Area | Object ID | Migrated abilities |
|---|---:|---|
| `default` | 202 | `GutsHamr`, `OldSaber`, `NumGadgt` |
| `default` | 215 | `HeroSwrd`, `WideSwrd`, `ShdwShoe` |
| `default` | 228 | `Burner`, `HexSickle`, `Blaster` |
| `christmas` | 79 | `Burner`, `HexSickle`, `Blaster` |
| `ooo` | 313 | `HeroSwrd`, `WideSwrd`, `ShdwShoe` |
| `ooo` | 328 | `GutsHamr`, `OldSaber`, `NumGadgt` |

`default.tmx` has had other independent edits (including the FootBomb train destination); **do not overwrite it with an older snapshot**. Run the migrator on your current file instead.

## Runtime and integration

- New module: `scripts/ezlibs-custom/nebulous-liberations/liberations/ability_shop.lua`
- Registry: `scripts/events/eznpcs_events.lua` registers `Liberation Ability Shop` via `eznpcs.add_event`. The original quiz/grant event remains unchanged for backward compatibility.
- `scripts/ezlibs-scripts/eznpcs/eznpcs.lua` adds the new class to the standard NPC spawn, interaction and template paths. It supplies a synthetic Dialogue event so `First Dialogue` is not required.
- Source of truth: `scripts/ezlibs-scripts/generate-ezlibs-tiled.lua`; generated Tiled and runtime files must be kept together.
- Uses `MenuAPI.open`, `MenuAPI.set_rows`, `MenuAPI.close`, `ezmemory.get_player_money`, `ezmemory.spend_player_money`, and `ezmemory`'s existing persistent item APIs. No new engine calls were invented.


## Updated ownership, equipment and mission actions (2026-11-20)

The current implementation separates **what the player has unlocked** from **what is equipped**:

- **Equipped**: a single Liberation ability inventory item. Its Gold Prog row shows **`Owned`** and it is the ability selected by `liberations/ability.lua` at mission session creation.
- **Unlocked**: a permanent `ezmemory` record at `player_memory.liberation_abilities.unlocked[ability_id]`. A previously purchased or earned ability shows **`Unlocked`** and can be equipped again without paying.
- **Not unlocked**: with `Enable Costs=false`, the value column remains blank; with `Enable Costs=true`, it shows `Free` or `<cost> Z`. The first successful equip unlocks it permanently.
- **Earned/quest-restricted**: optional `Requires Unlock N=true` shows **`Locked`** until a quest or another script calls `Shop.unlock(player_id, ability_id)` (or `ability_ownership.unlock`). Unlocking does not charge or equip the item; the player can then return and equip it for free. Each `Requires Unlock N` applies to the matching `Ability N`.

The same `ability_ownership` module handles catalog and legacy inventories. It synchronizes existing equipped items into unlock records when the Gold Prog is opened; it cannot reconstruct an already removed item that was never recorded. `Shop.grant` accepts canonical ability IDs and the legacy aliases `HexScyth` (alias for HexSickle) and `LongSwrd` (a separate legacy two-panel ability), and replaces the current item using the actual `ezmemory.give_player_item` / `remove_player_item` APIs. The grant happens before removal and attempts rollback if removal fails; a paid shop refunds the attempted charge if the grant fails.

**Current mission abilities:** `HeroSwrd` has its own 3-tile vertical shape (distinct from the default 2-tile `LongSwrd`). `CrosBmb`, `Burner`, `Blaster`, and `Bazooka` have been restored from the original user-supplied definitions. The existing encounter router from the current server is preserved rather than reverting to the older area-name table.

| Ability (shop ID) | Mission ability | Order Points | Targeting shape / behavior |
|---|---|---:|---|
| `HeroSwrd` | `HeroSwrd` | 2 | Three vertical panels; battle |
| `WideSwrd` | `WideSwrd` | 1 | Three horizontal panels; battle |
| `OldSaber` | `ScrenDiv` | 3 | Screen Divide; battle (current server setting) |
| `Guard` / `HevyShld` | `Guard` | Passive | Guard interception |
| `HexSickle` | `HexSickle` | 1 | Three horizontal panels; battle (current server setting) |
| `NumGadgt` | `NumberSearch` | 1 | 2×3 search; item/trap search (current server setting) |
| `GutsHamr` | `GutsWave` | 1 | Five vertical panels; destroys items (current server setting) |
| `ShdwShoe` | `Shadowstep` | Passive | Liberation Shadowstep effect |
| `CrosBmb` | `CrosBmb` | 2 | Cross of five panels; battle |
| `Burner` | `Burner` | 4 | 3×3 panels; battle; removes traps/destroys items |
| `Blaster` | `Blaster` | 1 | T-shape; battle |
| `Bazooka` | `Bazooka` | 2 | 5×5 panels; direct liberation; removes traps/destroys items |

`PanelSearch` in the ability module remains a pre-existing placeholder and is not listed as a Gold Prog shop offering.

### Quest unlock example (Lua)

```lua
local Shop = require("scripts/ezlibs-custom/nebulous-liberations/liberations/ability_shop")
-- After the player's quest reward has been verified:
local ok, err = Shop.unlock(player_id, "CrosBmb")
-- The Gold Prog can now show "Unlocked" and let the player equip it.
```

### Quest-gated Tiled example

```text
Type/Class: Liberation Ability Prog
Asset Name: prog-gold
Direction: Down Left
Ability 1: CrosBmb
Requires Unlock 1: true
Ability 2: Burner
Cost 2: 750
Enable Costs: true
```

Here Cross Bomb is quest-gated; Burner is purchasable once, then permanently unlocked for free re-equipping. These are optional behaviors; existing `default.tmx` progs with costs disabled and no gating remain free.

## Validation

Offline tests verify the no-cost blank label, `Owned` precedence, priced purchases, lack of money behavior, source map migration, unchanged TMX tile layer bodies, and script syntax. A live client check is still needed for final gold tint appearance and input handoff.


## `default.tmx` Gold Shop configuration (13 abilities)

Tiled objects **202, 215, and 228** are now `Liberation Ability Prog` objects. They retain their positions, `prog-gold` sprites, and directions. Every shop lists all 13 abilities from the canonical `ability_shop.lua` catalog in the order below.

| Slot | Ability ID | Name |
|---:|---|---|
| 1 | `HeroSwrd` | Hero Sword |
| 2 | `WideSwrd` | Wide Sword |
| 3 | `OldSaber` | Old Saber |
| 4 | `Guard` | Guard |
| 5 | `HevyShld` | Heavy Shield |
| 6 | `HexSickle` | Hex Sickle |
| 7 | `NumGadgt` | Num Gadget |
| 8 | `GutsHamr` | Guts Hammer |
| 9 | `ShdwShoe` | Shadow Shoe |
| 10 | `CrosBmb` | Cross Bomb |
| 11 | `Burner` | Burner |
| 12 | `Blaster` | Blaster |
| 13 | `Bazooka` | Bazooka |

**Required**: `Ability 1` and a valid `Asset Name`; `Direction` is required by the generated Tiled class. **Optional**: `Ability 2`–`Ability 13`, `Welcome Text`, `Enable Costs` (defaults to false), and `Cost 1`–`Cost 13` (defaults to 0). If `Enable Costs` is false, unowned rows have a blank value column; the currently held ability shows **Owned**. When costs are enabled, zero is shown as **Free**.

The Gold Shop reads ability IDs rather than legacy First Dialogue object references. Old quiz/grant Dialogue objects remain untouched as historical map objects but are no longer reached from these three Progs.

To add a future 14th catalog ability, the reader and Tiled schema must be extended together; do not add arbitrary property names without changing the schema.
