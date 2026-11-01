# `core.lua`

> **Source:** `scripts/libs/stardust/core.lua`  
> **Source lines:** 625  
> **Functions detected:** 55  
> **Table declarations detected:** 12

## Contents

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Events](#events)
- [Functions](#functions)
- [Tables and data structures](#tables-and-data-structures)
- [Implementation notes](#implementation-notes)

## Overview

[[

## Dependencies

- No `require(...)` dependency was detected.

## Events

- `Net:on("tick", function(event) ...)` — line 618. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 37 | `linear` | `x` |
| 38 | `square` | `x` |
| 39 | `cubic` | `x` |
| 41 | `vec_one` | `(none)` |
| 48 | `vec_zero` | `(none)` |
| 55 | `ensure_val_or` | `c, val` |
| 63 | `ensure_vector_or` | `v, val` |
| 79 | `ensure_config` | `c` |
| 101 | `resolve_mode` | `m` |
| 109 | `system` | `opts` |
| 132 | `lerp_scalar` | `w, s1, s2` |
| 138 | `lerp_integer` | `w, s1, s2` |
| 142 | `lerp_vec` | `w1, w2, v1, v2` |
| 149 | `rand_scalar` | `s1, s2` |
| 153 | `rand_vec` | `v1, v2` |
| 157 | `respawn` | `sys, p` |
| 252 | `tick_ani` | `sys, p` |
| 316 | `t.config` | `self, opts` |
| 335 | `t.spawn` | `self, a, b` |
| 342 | `t.frames` | `self, a, b` |
| 349 | `t.start_x` | `self, a, b` |
| 356 | `t.start_y` | `self, a, b` |
| 363 | `t.vel_x` | `self, a, b, mode` |
| 372 | `t.vel_y` | `self, a, b, mode` |
| 381 | `t.acc_x` | `self, a, b, mode` |
| 390 | `t.acc_y` | `self, a, b, mode` |
| 399 | `t.scl_x` | `self, a, b, mode` |
| 408 | `t.scl_y` | `self, a, b, mode` |
| 417 | `t.ach` | `self, a, b, mode` |
| 426 | `t.rch` | `self, a, b, mode` |
| 435 | `t.gch` | `self, a, b, mode` |
| 444 | `t.bch` | `self, a, b, mode` |
| 453 | `t.fco_x` | `self, a, b` |
| 460 | `t.fco_y` | `self, a, b` |
| 467 | `t.delay` | `self, a, b` |
| 475 | `t.limit` | `self, limit` |
| 480 | `t.rand_fco` | `self` |
| 484 | `t.rand_acc` | `self` |
| 488 | `t.rand_vel` | `self` |
| 492 | `t.rand_pos` | `self` |
| 496 | `t.rand_scl` | `self` |
| 500 | `t.rand_cnt` | `self` |
| 504 | `t.rand_rot` | `self` |
| 509 | `t.rand_ach` | `self` |
| 513 | `t.rand_rch` | `self` |
| 517 | `t.rand_gch` | `self` |
| 521 | `t.rand_bch` | `self` |
| 525 | `t.rand_spn` | `self` |
| 529 | `t.rand_del` | `self` |
| 533 | `t.tick` | `self` |
| 565 | `t.apply` | `self, force` |
| 575 | `t.build` | `self` |
| 583 | `t.destroy` | `self` |
| 587 | `t.gen` | `self, count` |
| 605 | `t.for_each` | `self, fn` |

### Function notes

- **`linear(x)`** *(source line 37)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`square(x)`** *(source line 38)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`cubic(x)`** *(source line 39)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`vec_one()`** *(source line 41)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`vec_zero()`** *(source line 48)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_val_or(c, val)`** *(source line 55)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_vector_or(v, val)`** *(source line 63)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`ensure_config(c)`** *(source line 79)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`resolve_mode(m)`** *(source line 101)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`system(opts)`** *(source line 109)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`lerp_scalar(w, s1, s2)`** *(source line 132)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`lerp_integer(w, s1, s2)`** *(source line 138)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`lerp_vec(w1, w2, v1, v2)`** *(source line 142)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`rand_scalar(s1, s2)`** *(source line 149)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`rand_vec(v1, v2)`** *(source line 153)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`respawn(sys, p)`** *(source line 157)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`tick_ani(sys, p)`** *(source line 252)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.config(self, opts)`** *(source line 316)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.spawn(self, a, b)`** *(source line 335)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.frames(self, a, b)`** *(source line 342)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.start_x(self, a, b)`** *(source line 349)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.start_y(self, a, b)`** *(source line 356)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.vel_x(self, a, b, mode)`** *(source line 363)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.vel_y(self, a, b, mode)`** *(source line 372)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.acc_x(self, a, b, mode)`** *(source line 381)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.acc_y(self, a, b, mode)`** *(source line 390)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.scl_x(self, a, b, mode)`** *(source line 399)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.scl_y(self, a, b, mode)`** *(source line 408)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.ach(self, a, b, mode)`** *(source line 417)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rch(self, a, b, mode)`** *(source line 426)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.gch(self, a, b, mode)`** *(source line 435)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.bch(self, a, b, mode)`** *(source line 444)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.fco_x(self, a, b)`** *(source line 453)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.fco_y(self, a, b)`** *(source line 460)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.delay(self, a, b)`** *(source line 467)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.limit(self, limit)`** *(source line 475)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_fco(self)`** *(source line 480)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_acc(self)`** *(source line 484)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_vel(self)`** *(source line 488)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_pos(self)`** *(source line 492)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_scl(self)`** *(source line 496)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_cnt(self)`** *(source line 500)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_rot(self)`** *(source line 504)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_ach(self)`** *(source line 509)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_rch(self)`** *(source line 513)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_gch(self)`** *(source line 517)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_bch(self)`** *(source line 521)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_spn(self)`** *(source line 525)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.rand_del(self)`** *(source line 529)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.tick(self)`** *(source line 533)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.apply(self, force)`** *(source line 565)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.build(self)`** *(source line 575)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.destroy(self)`** *(source line 583)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.gen(self, count)`** *(source line 587)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`t.for_each(self, fn)`** *(source line 605)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `system_set` *(line 32)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `Presets` *(line 34)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `random` | string literal | `'random'` |
| `linear` | function | `function(x) return x end` |
| `square` | function | `function(x) return x*x end` |
| `cubic` | function | `function(x) return x*x*x end` |

### `v` *(line 66)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `c` *(line 82)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `t` *(line 111)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `upp` | table | `{}` |
| `low` | table | `{}` |
| `liv` | table | `{}` |
| `len` | number literal | `0` |
| `del` | number literal | `0` |
| `lim` | number literal | `1` |
| `ani` | table | `{ vel_x=Presets.random, acc_x=Presets.random, scl_x=Presets.random, vel_y=Presets.random, acc_y=Presets.random, scl_y=Presets.random, rot=Pr…` |

### `upp` *(line 112)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `low` *(line 113)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `liv` *(line 114)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `ani` *(line 118)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `vel_x` | expression/reference | `Presets.random` |
| `acc_x` | expression/reference | `Presets.random` |
| `scl_x` | expression/reference | `Presets.random` |
| `vel_y` | expression/reference | `Presets.random` |
| `acc_y` | expression/reference | `Presets.random` |
| `scl_y` | expression/reference | `Presets.random` |
| `rot` | expression/reference | `Presets.random` |
| `ach` | expression/reference | `Presets.random` |
| `rch` | expression/reference | `Presets.random` |
| `gch` | expression/reference | `Presets.random` |
| `bch` | expression/reference | `Presets.random` |

### `v` *(line 144)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | expression/reference | `v2.x - v1.x` |
| `y` | expression/reference | `v2.y - v1.y` |

### `opts` *(line 319)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `next` *(line 541)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

## Implementation notes

- This reference is generated from the exact archived source `scripts/libs/stardust/core.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
