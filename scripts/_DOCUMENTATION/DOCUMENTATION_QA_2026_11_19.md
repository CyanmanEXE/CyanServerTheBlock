> 🗃️ **Prior snapshot / historical context.** For the current runtime folder layout and module paths, use the [PlayerInterface migration guide](player-interface/MIGRATION.md) and [source inventory](SOURCE_INVENTORY.md).

# 🔎 Documentation and code QA — November 19, 2026

[🏠 Documentation home](index.md) · [📊 Source inventory](SOURCE_INVENTORY.md) · [🗺️ Tiled catalog](areas/TILED_OBJECT_REFERENCE.md)

## Source scope

- Inspected user-uploaded `scripts(4).zip` containing `scripts/`, plus `encounters/` and 69 `.tmx` areas from `encounters_areas_assets.zip`.
- Generated source-linked `index.md` references for 317 Lua source files (292 files under `scripts/` **after** adding `scripts/player-interface/main.lua`, plus 25 encounter Lua files).
- Documented 50 Tiled classes in the generated `ezlibs-tiled-schema.lua`, and 46 distinct actual TMX object types; classes not present in the uploaded areas are labeled accordingly.
- Retained earlier authored guides for domain context, added direct links to current source references, and rebuilt documentation navigational indexes so all script and guide files remain reachable from the root documentation index.

## Static and isolated runtime verification

| Check | Result | Limitation |
|---|---|---|
| ZIP integrity of the two provided inputs | Passed | Neither input archive was modified |
| Lua 5.4 parser load check across `scripts/**/*.lua` | 292/292 pass | The live server uses a separate Lua runtime; this does not run ONB network calls |
| PlayerManager delegation + free-camera area guard mock | Passed | Does not emulate the real client or native camera events |
| Tiled schema extraction | 50 classes, 30 enumerations | A class declaration does not guarantee a runtime consumer |
| TMX extraction | 69 areas, 46 actual object classes | Static examples only; no map gameplay execution |
| Documentation link audit | Root and new module navigation generated; relative links checked | External URLs and runtime asset references are not local markdown links |

## What was changed

The Lua patch adds a single `player-manager/main.lua` entry point without duplicate registrations, blocks the free camera in `liberation_` maps, and gives every mission participant a separate `liberation:intro` named capture and camera timer. All existing InputController, CameraController, and PlayerControl internals are retained. See [startup audit](ezlibs-custom/nebulous-liberations/STARTUP_INPUT_LOCK.md) for the reproduction hypothesis and player-facing checks.

## Known remaining verification

- Test an actual ONB client: solo/party start without any button presses, menu Cancel, enemy turn, loot, battle exit, return-to-lobby, disconnect and reentry.
- Historical authored guides may still describe older behavior; the regenerated source API indexes and new Tiled catalog take precedence for current parameter names, links and map class defaults.
- A Lua-source grep found direct `Net.lock_player_input`/`unlock_player_input` calls in `scripts/events/eznpcs_events.lua`. They were not refactored here because their dialogue handoff lifecycle needs separate runtime tests.
- `CameraDuration` is read; `CameraEase` is mentioned in a source comment but not consumed by `camera_sequence.lua`.
- The duration-based camera release is not backed by a client completion acknowledgement in the inspected Net API calls.
