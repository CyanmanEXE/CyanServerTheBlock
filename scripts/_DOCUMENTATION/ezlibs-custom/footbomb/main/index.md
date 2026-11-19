# 📁 `ezlibs-custom/footbomb/main`

[🏠 Documentation home](../../../index.md) · [⬆ Parent folder](../index.md)

## 🗂️ Contents
- [Child references](#-child-references)
- [Guides and additional material](#-guides-and-additional-material)

## 🔎 Current area-identity API

The FootBomb main module now exports `FootBomb.get_area_role(area_id)` and `FootBomb.get_area_diagnostic(area_id)`, and delegates source recognition and player-transfer tracing to the new [`area_observer.lua` module](../area_observer/index.md). See [`AREA_SETUP.md`](../AREA_SETUP.md) for all current Tiled object requirements.

## 🎮 Current referee interaction

`begin_interaction` calls [`RefereeMenu.select_mode`](../referee_menu/index.md), and delegates host score/Grace configuration to `RefereeMenu.configure`. It awaits `Async.message_player` with the referee mugshot for the four-page explanation and only shows the menu again after the last dismissal. `make_instance(..., rules)` receives host-selected `points_to_win` and `grace_enabled`, with both values persisted to instance metadata and bot state. PvP waiting matches store the host's `rules` table for the second player.

The existing match-point evaluator is unchanged when Grace is on; Grace off completes as soon as one side reaches the target. The referee no longer uses `Async.quiz_player` for its pre-match options. In-match skin confirmation remains independent and still uses its existing quiz.

## 📂 Child references

| Folder / Lua script | Reference |
|---|---|
| — | No child folders |

## 📚 Guides and additional material

| Document | Description |
|---|---|
| — | No separate guides |

> 📅 Rebuilt from the supplied snapshot on 2026-11-19. Source-verified function signatures live in each script reference. Historical guides remain available alongside them.
