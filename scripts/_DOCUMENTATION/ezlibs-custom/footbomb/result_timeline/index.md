# 📁 `ezlibs-custom/footbomb/result_timeline`

[🏠 Documentation home](../../../index.md) · [⬆ Parent folder](../index.md)

## 🗂️ Contents
- [Child references](#-child-references)
- [Guides and additional material](#-guides-and-additional-material)

## 🧮 Current planner API

`projected_distance`, `travel_duration`, `catch_contact_elapsed`, `plan_response`, and `sample_times` are implemented in `result_timeline.lua`. Successful catches use a minimum visible flight window and an authored jump contact ratio; misses preserve natural projected speed. See the [complete planner guide](../TIMING.md) for parameters, return fields, formulas, and tests. `shared_response_duration()` remains in the file for compatibility, but the current result path uses `plan_response()`.

## 📂 Child references

| Folder / Lua script | Reference |
|---|---|
| — | No child folders |

## 📚 Guides and additional material

| Document | Description |
|---|---|
| — | No separate guides |

> 📅 Rebuilt from the supplied snapshot on 2026-11-19. Source-verified function signatures live in each script reference. Historical guides remain available alongside them.
