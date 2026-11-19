# 📁 `ezlibs-custom/nebulous-liberations/liberations/option_menu`

[🏠 Documentation home](../../../../index.md) · [⬆ Parent folder](../index.md)

## 🗂️ Contents
- [Child references](#-child-references)
- [Guides and additional material](#-guides-and-additional-material)

## 📂 Child references

| Folder / Lua script | Reference |
|---|---|
| — | No child folders |

## 📚 Guides and additional material

| Document | Description |
|---|---|
| — | No separate guides |

> 📅 Rebuilt from the supplied snapshot on 2026-11-19. Source-verified function signatures live in each script reference. Historical guides remain available alongside them.


## 🕹️ Persistent adjustable rows (November 19, 2026)

**Source:** `scripts/ezlibs-custom/nebulous-liberations/liberations/option_menu.lua` — `OptionMenu.select(player_id, options, title, config)`.

The existing option menu remains backwards-compatible. Extra `config` fields are optional:

| Field | Type | Meaning |
|---|---|---|
| `stable_text` | boolean | Use persistent 9-slice panels and update glyph sprites in-place instead of rebuilding panel children during navigation |
| `width_samples` | array of strings | Additional measurement examples evaluated at menu creation; reserve space for the longest possible dynamic label |
| `on_horizontal` | function `(index0, delta, options)` | Called on Left (`-1`) or Right (`+1`) press/repeat. `index0` is the zero-based current row; update the *menu-owned* `options` table and return `true` to repaint only changed text |
| `on_confirm` | function `(index0, options)` | Return `true` to consume Confirm and remain in the same menu; return `false`/`nil` to use the normal selected-result behavior |

With `stable_text=true`, vertical navigation, horizontal adjustments, and consumed Confirm actions retain the existing header/body panel allocations. The menu still closes normally on Cancel, an accepted selection, disconnect, or loss of its PlayerInterface control session. Existing callers that omit these options retain their prior behavior.

**Example: configurable numeric row**

```lua
local current_score = 10
local choice = Async.await(OptionMenu.select(player_id, {
    "Winning Score: < 10 >", "Start Match", "Cancel",
}, "Setup", {
    stable_text = true,
    width_samples = { "Winning Score: < 9999 >" },
    on_horizontal = function(index0, delta, options)
        if index0 ~= 0 then return false end
        current_score = math.max(1, current_score + delta)
        options[1] = "Winning Score: < " .. current_score .. " >"
        return true
    end,
    on_confirm = function(index0)
        return index0 == 0 -- keep editing rather than select row
    end,
}))
-- choice == 1: Start Match; choice == 2: Cancel
```

The first callback parameter is the same zero-based index convention used by `select()` results; `options` itself remains Lua's normal 1-based list. The shared menu continues to use the existing PlayerInterface input session, input guard, release/repeat edges, font system, and 9-slice assets.
