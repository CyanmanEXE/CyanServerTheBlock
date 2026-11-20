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
| `aligned_values` | table keyed by **1-based menu row index**, values `{label, value, reserve}` | With `stable_text=true`, line up arrows across editable rows and center values in a common reserved width. Mutate `.value` in horizontal/confirm callbacks. `reserve` is the widest expected value, e.g. `"999"` or `"Off"`. |
| `on_horizontal` | function `(index0, delta, options)` | Called on Left (`-1`) or Right (`+1`) press/repeat. `index0` is the zero-based current row; update the *menu-owned* `options` table and return `true` to repaint only changed text |
| `on_confirm` | function `(index0, options)` | Return `true` to consume Confirm and remain in the same menu; return `false`/`nil` to use the normal selected-result behavior |

With `stable_text=true`, vertical navigation, horizontal adjustments, and consumed Confirm actions retain the existing header/body panel allocations. The menu still closes normally on Cancel, an accepted selection, disconnect, or loss of its PlayerInterface control session. Existing callers that omit these options retain their prior behavior.

**Example: aligned numeric/toggle rows**

```lua
local current_score = 10
local grace = true
local fields = {
    [1] = { label = "Winning Score:", value = "10", reserve = "999" },
    [2] = { label = "Grace:", value = "On", reserve = "Off" },
}
local choice = Async.await(OptionMenu.select(player_id, {
    "Winning Score:", "Grace:", "Start Match", "Cancel",
}, "Setup", {
    stable_text = true,
    aligned_values = fields,
    on_horizontal = function(index0, delta)
        if index0 == 0 then
            current_score = math.max(1, math.min(999, current_score + delta))
            fields[1].value = tostring(current_score)
            return true
        elseif index0 == 1 then
            grace = delta > 0
            fields[2].value = grace and "On" or "Off"
            return true
        end
        return false
    end,
    on_confirm = function(index0)
        return index0 <= 1 -- keep editing settings, not selecting them
    end,
}))
-- choice == 2: Start Match; choice == 3: Cancel
```

`aligned_values` is optional, and has no effect unless `stable_text = true`. Each editable row has a shared maximum label width, fixed `<` and `>` arrow positions, and a value centered using the same `TextLayout.measureLine` metrics as normal glyph rendering. A reserve of `"999"` provides three slots without forcing literal zero padding. Keep `.value` no wider than `.reserve`, and constrain the input accordingly; the panel is measured once at creation. Other rows, Liberation interactions, and non-stable menus are unchanged. **No additional background draw or reposition is performed on edits.**

The first callback parameter is the same zero-based index convention used by `select()` results; `options` itself remains Lua's normal 1-based list. The shared menu continues to use the existing PlayerInterface input session, input guard, release/repeat edges, font system, and 9-slice assets.
