# `displayer.lua`

> **Source:** `scripts/displayer/displayer.lua`  
> **Source lines:** 613  
> **Functions detected:** 114  
> **Table declarations detected:** 36

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

- `scripts/displayer/font-system` — line 34
- `scripts/displayer/text-display` — line 35
- `scripts/displayer/timer-display` — line 36
- `scripts/displayer/nameplate` — line 37
- `scripts/displayer/scrolling-text-list` — line 39
- `scripts/displayer/scrolling-sprite-list` — line 40
- `scripts/displayer/timer-system` — line 41
- `scripts/displayer/sliced-sprite` — line 42
- `scripts/boom/main` — line 70

## Events

- `Net:on("player_join", function(event) ...)` — line 59. The event name is taken directly from this source.
- `Net:on("player_disconnect", function(event) ...)` — line 571. The event name is taken directly from this source.

## Functions

| Line | Function / method | Parameters as declared |
|---:|---|---|
| 21 | `Displayer:init` | `(none)` |
| 68 | `Displayer:_setupBuilderAPI` | `(none)` |
| 73 | `api.glyph` | `overrides` |
| 80 | `api.staticText` | `overrides` |
| 87 | `api.marquee` | `overrides` |
| 95 | `api.textBox` | `overrides` |
| 104 | `api.timerDisplay` | `overrides` |
| 118 | `api.textList` | `overrides` |
| 127 | `api.spriteList` | `overrides` |
| 136 | `api.backdrop` | `x, y, width, height, padding_x, padding_y, r, g, b, opacity, a` |
| 143 | `api.spriteDef` | `texture_path, anim_path, anim_state, overrides` |
| 187 | `api.sliceStyle9` | `texture_path, anim_path, overrides` |
| 202 | `api.sliceStyle3` | `texture_path, anim_path, states, orientation` |
| 219 | `api.sliceStyle5` | `texture_path, anim_path, states, orientation` |
| 238 | `api.text` | `mode, overrides` |
| 254 | `api.textPanelStyle` | `kind, parts, orientation` |
| 261 | `panelPadding` | `value, vertical` |
| 283 | `api.panelPadding` | `value, vertical` |
| 287 | `api.panelChildPadding` | `value, vertical` |
| 294 | `api.textPanelOptions` | `overrides` |
| 328 | `api.rowPanelOptions` | `overrides` |
| 336 | `api.columnPanelOptions` | `overrides` |
| 344 | `api.gridPanelOptions` | `columns, overrides` |
| 353 | `api.textPanel` | `text, style, options` |
| 357 | `api.panelTextChild` | `text, overrides` |
| 364 | `api.panelSpritesChild` | `sprites, overrides` |
| 379 | `Displayer:_setupFontAPI` | `(none)` |
| 381 | `api.drawGlyph` | `player_id, font_name, char, x, y, options` |
| 384 | `api.updateGlyph` | `player_id, instance_id, updates` |
| 387 | `api.eraseGlyph` | `player_id, instance_id` |
| 390 | `api.getGlyphDimensions` | `font_name, char` |
| 393 | `api.allocateAllFontsForPlayer` | `player_id` |
| 401 | `Displayer:_setupTextAPI` | `(none)` |
| 403 | `api.draw` | `pid, tid, text, x, y, o` |
| 404 | `api.drawStatic` | `pid, tid, text, x, y, o` |
| 405 | `api.removeStatic` | `pid, tid` |
| 406 | `api.drawMarquee` | `pid, mid, text, y, o` |
| 407 | `api.removeMarquee` | `pid, mid` |
| 408 | `api.createTextBox` | `pid, bid, text, x, y, w, h, o` |
| 409 | `api.advanceTextBox` | `pid, bid` |
| 410 | `api.closeTextBox` | `pid, bid` |
| 411 | `api.getTextBoxState` | `pid, bid` |
| 412 | `api.getTextBoxData` | `pid, bid` |
| 413 | `api.setKeepAlive` | `pid, bid, keep` |
| 419 | `Displayer:_setupTimerDisplayAPI` | `(none)` |
| 421 | `api.createPlayerTimer` | `pid, did, x, y, o` |
| 422 | `api.createPlayerCountdown` | `pid, did, x, y, o` |
| 423 | `api.createGlobalTimer` | `did, x, y, o` |
| 424 | `api.createGlobalCountdown` | `did, x, y, o` |
| 425 | `api.remove` | `pid, did` |
| 426 | `api.setPosition` | `pid, did, x, y` |
| 432 | `Displayer:_setupNameplateAPI` | `(none)` |
| 434 | `api.attach` | `pid, pd, bid, bd, cfg` |
| 435 | `api.erase` | `pid, pd, bd` |
| 436 | `api.begin_close` | `pid, pd, bd, cfg` |
| 442 | `Displayer:_setupScrollingTextAPI` | `(none)` |
| 444 | `api.createList` | `pid, lid, x, y, w, h, cfg` |
| 445 | `api.addText` | `pid, lid, text` |
| 446 | `api.setTexts` | `pid, lid, texts` |
| 447 | `api.getState` | `pid, lid` |
| 448 | `api.setSpeed` | `pid, lid, s` |
| 449 | `api.removeList` | `pid, lid` |
| 450 | `api.setPosition` | `pid, lid, x, y` |
| 456 | `Displayer:_setupScrollingSpriteAPI` | `(none)` |
| 458 | `api.createList` | `pid, lid, x, y, w, h, cfg` |
| 459 | `api.addSprite` | `pid, lid, d` |
| 460 | `api.setSprites` | `pid, lid, s` |
| 461 | `api.getState` | `pid, lid` |
| 462 | `api.setSpeed` | `pid, lid, s` |
| 463 | `api.removeList` | `pid, lid` |
| 464 | `api.setPosition` | `pid, lid, x, y` |
| 470 | `Displayer:_setupTimerAPI` | `(none)` |
| 472 | `api.createPlayerTimer` | `p, t, d, cb, l` |
| 473 | `api.createPlayerCountdown` | `p, c, d, cb, l` |
| 474 | `api.pausePlayerTimer` | `p, t` |
| 475 | `api.resumePlayerTimer` | `p, t` |
| 476 | `api.pausePlayerCountdown` | `p, c` |
| 477 | `api.resumePlayerCountdown` | `p, c` |
| 478 | `api.removePlayerTimer` | `p, t` |
| 479 | `api.removePlayerCountdown` | `p, c` |
| 480 | `api.getPlayerTimer` | `p, t` |
| 481 | `api.getPlayerCountdown` | `p, c` |
| 482 | `api.createGlobalTimer` | `t, d, cb, l` |
| 483 | `api.createGlobalCountdown` | `c, d, cb, l` |
| 484 | `api.pauseGlobalTimer` | `t` |
| 485 | `api.resumeGlobalTimer` | `t` |
| 486 | `api.pauseGlobalCountdown` | `c` |
| 487 | `api.resumeGlobalCountdown` | `c` |
| 488 | `api.removeGlobalTimer` | `t` |
| 489 | `api.removeGlobalCountdown` | `c` |
| 490 | `api.getGlobalTimer` | `t` |
| 491 | `api.getGlobalCountdown` | `c` |
| 492 | `api.getAllGlobalTimers` | `(none)` |
| 493 | `api.getAllGlobalCountdowns` | `(none)` |
| 494 | `api.clearAllGlobalTimers` | `(none)` |
| 495 | `api.clearAllGlobalCountdowns` | `(none)` |
| 501 | `Displayer:_setupTextPanelAPI` | `(none)` |
| 504 | `api.create` | `player_id, panel_id, text, x, y, style, options` |
| 514 | `api.createWithChildren` | `player_id, panel_id, x, y, style, options` |
| 524 | `api.updateText` | `player_id, panel_id, newText` |
| 531 | `api.setChildren` | `player_id, panel_id, children` |
| 538 | `api.setPosition` | `player_id, panel_id, x, y` |
| 545 | `api.setOptions` | `player_id, panel_id, newOptions` |
| 552 | `api.getSize` | `player_id, panel_id` |
| 558 | `api.remove` | `player_id, panel_id` |
| 566 | `api.get` | `player_id, panel_id` |
| 585 | `Displayer:_setupSlicedSpriteAPI` | `(none)` |
| 587 | `api.draw3` | `pid, lid, x, y, w, h, style, o` |
| 588 | `api.draw5` | `pid, lid, x, y, w, h, style, o` |
| 589 | `api.draw9` | `pid, lid, x, y, w, h, style, o` |
| 590 | `api.erase` | `pid, lid` |
| 591 | `api.drawTextPanel` | `pid, lid, x, y, text, style, options` |
| 597 | `Displayer:formatTime` | `seconds, is_countdown` |
| 607 | `Displayer:getScreenDimensions` | `(none)` |

### Function notes

- **`Displayer:init()`** *(source line 21)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:_setupBuilderAPI()`** — --------------------------------------------------------------------------- Builder API --------------------------------------------------------------------------- *(source line 68)*
- **`api.glyph(overrides)`** *(source line 73)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.staticText(overrides)`** *(source line 80)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.marquee(overrides)`** *(source line 87)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.textBox(overrides)`** *(source line 95)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.timerDisplay(overrides)`** *(source line 104)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.textList(overrides)`** *(source line 118)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.spriteList(overrides)`** *(source line 127)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.backdrop(x, y, width, height, padding_x, padding_y, r, g, b, opacity, a)`** *(source line 136)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.spriteDef(texture_path, anim_path, anim_state, overrides)`** *(source line 143)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.sliceStyle9(texture_path, anim_path, overrides)`** *(source line 187)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.sliceStyle3(texture_path, anim_path, states, orientation)`** *(source line 202)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.sliceStyle5(texture_path, anim_path, states, orientation)`** *(source line 219)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.text(mode, overrides)`** *(source line 238)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.textPanelStyle(kind, parts, orientation)`** *(source line 254)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`panelPadding(value, vertical)`** — Normalize panel/child padding into the edge shape consumed by sliced-sprite.lua. Accepts a uniform number or an edge table such as { horizontal = 6, vertical = 8 } / { left=6, right=6, top=8, bottom=8 }. *(source line 261)*
- **`api.panelPadding(value, vertical)`** *(source line 283)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.panelChildPadding(value, vertical)`** *(source line 287)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.textPanelOptions(overrides)`** — - Build options for text/sliced panels. `layout` accepts vertical/column, - horizontal/row, or grid. Spacing and padding are included in auto-size. - `children` is an array of descriptors from panelTextChild/panelSpritesChild. *(source line 294)*
- **`api.rowPanelOptions(overrides)`** *(source line 328)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.columnPanelOptions(overrides)`** *(source line 336)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.gridPanelOptions(columns, overrides)`** *(source line 344)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.textPanel(text, style, options)`** *(source line 353)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.panelTextChild(text, overrides)`** *(source line 357)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.panelSpritesChild(sprites, overrides)`** *(source line 364)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:_setupFontAPI()`** — --------------------------------------------------------------------------- Font API --------------------------------------------------------------------------- *(source line 379)*
- **`api.drawGlyph(player_id, font_name, char, x, y, options)`** *(source line 381)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.updateGlyph(player_id, instance_id, updates)`** *(source line 384)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.eraseGlyph(player_id, instance_id)`** *(source line 387)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getGlyphDimensions(font_name, char)`** *(source line 390)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.allocateAllFontsForPlayer(player_id)`** *(source line 393)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:_setupTextAPI()`** — --------------------------------------------------------------------------- Text API --------------------------------------------------------------------------- *(source line 401)*
- **`api.draw(pid, tid, text, x, y, o)`** *(source line 403)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.drawStatic(pid, tid, text, x, y, o)`** *(source line 404)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.removeStatic(pid, tid)`** *(source line 405)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.drawMarquee(pid, mid, text, y, o)`** *(source line 406)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.removeMarquee(pid, mid)`** *(source line 407)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.createTextBox(pid, bid, text, x, y, w, h, o)`** *(source line 408)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.advanceTextBox(pid, bid)`** *(source line 409)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.closeTextBox(pid, bid)`** *(source line 410)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getTextBoxState(pid, bid)`** *(source line 411)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getTextBoxData(pid, bid)`** *(source line 412)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setKeepAlive(pid, bid, keep)`** *(source line 413)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:_setupTimerDisplayAPI()`** — --------------------------------------------------------------------------- Timer Display API --------------------------------------------------------------------------- *(source line 419)*
- **`api.createPlayerTimer(pid, did, x, y, o)`** *(source line 421)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.createPlayerCountdown(pid, did, x, y, o)`** *(source line 422)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.createGlobalTimer(did, x, y, o)`** *(source line 423)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.createGlobalCountdown(did, x, y, o)`** *(source line 424)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.remove(pid, did)`** *(source line 425)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setPosition(pid, did, x, y)`** *(source line 426)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:_setupNameplateAPI()`** — --------------------------------------------------------------------------- Nameplate API --------------------------------------------------------------------------- *(source line 432)*
- **`api.attach(pid, pd, bid, bd, cfg)`** *(source line 434)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.erase(pid, pd, bd)`** *(source line 435)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.begin_close(pid, pd, bd, cfg)`** *(source line 436)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:_setupScrollingTextAPI()`** — --------------------------------------------------------------------------- Scrolling Text List API --------------------------------------------------------------------------- *(source line 442)*
- **`api.createList(pid, lid, x, y, w, h, cfg)`** *(source line 444)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.addText(pid, lid, text)`** *(source line 445)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setTexts(pid, lid, texts)`** *(source line 446)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getState(pid, lid)`** *(source line 447)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setSpeed(pid, lid, s)`** *(source line 448)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.removeList(pid, lid)`** *(source line 449)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setPosition(pid, lid, x, y)`** *(source line 450)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:_setupScrollingSpriteAPI()`** — --------------------------------------------------------------------------- Scrolling Sprite List API --------------------------------------------------------------------------- *(source line 456)*
- **`api.createList(pid, lid, x, y, w, h, cfg)`** *(source line 458)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.addSprite(pid, lid, d)`** *(source line 459)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setSprites(pid, lid, s)`** *(source line 460)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getState(pid, lid)`** *(source line 461)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setSpeed(pid, lid, s)`** *(source line 462)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.removeList(pid, lid)`** *(source line 463)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setPosition(pid, lid, x, y)`** *(source line 464)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:_setupTimerAPI()`** — --------------------------------------------------------------------------- Timer System API --------------------------------------------------------------------------- *(source line 470)*
- **`api.createPlayerTimer(p, t, d, cb, l)`** *(source line 472)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.createPlayerCountdown(p, c, d, cb, l)`** *(source line 473)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.pausePlayerTimer(p, t)`** *(source line 474)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.resumePlayerTimer(p, t)`** *(source line 475)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.pausePlayerCountdown(p, c)`** *(source line 476)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.resumePlayerCountdown(p, c)`** *(source line 477)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.removePlayerTimer(p, t)`** *(source line 478)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.removePlayerCountdown(p, c)`** *(source line 479)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getPlayerTimer(p, t)`** *(source line 480)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getPlayerCountdown(p, c)`** *(source line 481)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.createGlobalTimer(t, d, cb, l)`** *(source line 482)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.createGlobalCountdown(c, d, cb, l)`** *(source line 483)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.pauseGlobalTimer(t)`** *(source line 484)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.resumeGlobalTimer(t)`** *(source line 485)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.pauseGlobalCountdown(c)`** *(source line 486)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.resumeGlobalCountdown(c)`** *(source line 487)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.removeGlobalTimer(t)`** *(source line 488)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.removeGlobalCountdown(c)`** *(source line 489)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getGlobalTimer(t)`** *(source line 490)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getGlobalCountdown(c)`** *(source line 491)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getAllGlobalTimers()`** *(source line 492)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getAllGlobalCountdowns()`** *(source line 493)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.clearAllGlobalTimers()`** *(source line 494)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.clearAllGlobalCountdowns()`** *(source line 495)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:_setupTextPanelAPI()`** — --------------------------------------------------------------------------- Text Panel API --------------------------------------------------------------------------- *(source line 501)*
- **`api.create(player_id, panel_id, text, x, y, style, options)`** *(source line 504)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.createWithChildren(player_id, panel_id, x, y, style, options)`** *(source line 514)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.updateText(player_id, panel_id, newText)`** *(source line 524)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setChildren(player_id, panel_id, children)`** *(source line 531)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setPosition(player_id, panel_id, x, y)`** *(source line 538)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.setOptions(player_id, panel_id, newOptions)`** *(source line 545)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.getSize(player_id, panel_id)`** *(source line 552)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.remove(player_id, panel_id)`** *(source line 558)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.get(player_id, panel_id)`** *(source line 566)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:_setupSlicedSpriteAPI()`** — --------------------------------------------------------------------------- Sliced Sprite API --------------------------------------------------------------------------- *(source line 585)*
- **`api.draw3(pid, lid, x, y, w, h, style, o)`** *(source line 587)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.draw5(pid, lid, x, y, w, h, style, o)`** *(source line 588)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.draw9(pid, lid, x, y, w, h, style, o)`** *(source line 589)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.erase(pid, lid)`** *(source line 590)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`api.drawTextPanel(pid, lid, x, y, text, style, options)`** *(source line 591)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.
- **`Displayer:formatTime(seconds, is_countdown)`** — --------------------------------------------------------------------------- Utility --------------------------------------------------------------------------- *(source line 597)*
- **`Displayer:getScreenDimensions()`** *(source line 607)*: No adjacent explanatory comment was present. Parameter names are documented verbatim; consult the implementation for validation, mutation, and return details.

## Tables and data structures

### `Displayer` *(line 8)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.Font` *(line 22)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.Text` *(line 23)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.TimerDisplay` *(line 24)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.Nameplate` *(line 25)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.ScrollingText` *(line 26)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.ScrollingSprite` *(line 27)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.Timer` *(line 28)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.TextPanel` *(line 29)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.SlicedPanel` *(line 30)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.SlicedSprite` *(line 31)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `self.Builder` *(line 32)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `anim_cache` *(line 71)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `opts` *(line 74)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `opacity` | number literal | `255` |
| `a` | number literal | `255` |
| `ro` | number literal | `0` |
| `color_mode` | number literal | `0` |

### `opts` *(line 81)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `opacity` | number literal | `255` |
| `a` | number literal | `255` |
| `ro` | number literal | `0` |
| `color_mode` | number literal | `0` |

### `opts` *(line 88)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `speed` | number literal | `60` |
| `loops` | nil | `nil` |
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `opacity` | number literal | `255` |
| `a` | number literal | `255` |
| `ro` | number literal | `0` |
| `color_mode` | number literal | `0` |
| `updateChar` | nil | `nil` |

### `opts` *(line 96)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `speed` | number literal | `30` |
| `type_sound` | nil | `nil` |
| `type_sound_min_dt` | number literal | `0.1` |
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `opacity` | number literal | `255` |
| `a` | number literal | `255` |
| `ro` | number literal | `0` |
| `color_mode` | number literal | `0` |

### `opts` *(line 105)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `color` | table | `{ r = 255, g = 255, b = 255 }` |
| `opacity` | number literal | `255` |
| `a` | number literal | `255` |
| `ro` | number literal | `0` |
| `color_mode` | number literal | `0` |

### `color` *(line 106)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |

### `opts.color` *(line 111)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `v.r or 255` |
| `g` | expression/reference | `v.g or 255` |
| `b` | expression/reference | `v.b or 255` |

### `opts` *(line 119)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `1.0` |
| `z_order` | number literal | `100` |
| `scroll_speed` | number literal | `30` |
| `line_spacing` | number literal | `15` |
| `entry_delay` | number literal | `1.0` |
| `loop` | boolean literal | `false` |
| `destroy_when_finished` | boolean literal | `true` |
| `destroy_delay` | number literal | `1.0` |
| `backdrop` | nil | `nil` |
| `texts` | table | `{}` |

### `opts` *(line 128)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `x` | number literal | `0` |
| `y` | number literal | `0` |
| `width` | number literal | `200` |
| `height` | number literal | `100` |
| `z_order` | number literal | `100` |
| `scroll_speed` | number literal | `30` |
| `entry_delay` | number literal | `1.0` |
| `max_columns` | number literal | `1` |
| `column_spacing` | number literal | `5` |
| `row_spacing` | number literal | `5` |
| `align` | string literal | `"left"` |
| `backdrop` | nil | `nil` |
| `sprites` | table | `{}` |

### `def` *(line 150)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `texture_path` | expression/reference | `texture_path` |
| `anim_path` | expression/reference | `anim_path or ""` |
| `anim_state` | expression/reference | `anim_state or ""` |
| `ox` | number literal | `0` |
| `oy` | number literal | `0` |
| `sx` | number literal | `2` |
| `sy` | number literal | `2` |
| `width` | number literal | `16` |
| `height` | number literal | `16` |
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `opacity` | number literal | `255` |
| `a` | number literal | `255` |
| `ro` | number literal | `0` |
| `color_mode` | number literal | `0` |

### `default_states` *(line 189)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `top_left` | string literal | `"CORNER_UL"` |
| `top` | string literal | `"EDGE_UC"` |
| `top_right` | string literal | `"CORNER_UR"` |
| `left` | string literal | `"EDGE_CL"` |
| `center` | string literal | `"CENTER"` |
| `right` | string literal | `"EDGE_RC"` |
| `bottom_left` | string literal | `"CORNER_LL"` |
| `bottom` | string literal | `"EDGE_LC"` |
| `bottom_right` | string literal | `"CORNER_LR"` |

### `parts` *(line 194)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `parts` *(line 211)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ anim_state = states[1] or defaults[1] }` |
| `[2]` | table | `{ anim_state = states[2] or defaults[2] }` |
| `[3]` | table | `{ anim_state = states[3] or defaults[3] }` |

### `parts` *(line 228)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `[1]` | table | `{ anim_state = states[1] or defaults[1] }` |
| `[2]` | table | `{ anim_state = states[2] or defaults[2], stretch = true }` |
| `[3]` | table | `{ anim_state = states[3] or defaults[3] }` |
| `[4]` | table | `{ anim_state = states[4] or defaults[4], stretch = true }` |
| `[5]` | table | `{ anim_state = states[5] or defaults[5] }` |

### `base` *(line 239)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `mode` | expression/reference | `mode` |
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `2.0` |
| `z` | number literal | `100` |
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `opacity` | number literal | `255` |
| `a` | number literal | `255` |
| `ro` | number literal | `0` |
| `color_mode` | number literal | `0` |
| `halign` | string literal | `"left"` |
| `valign` | string literal | `"top"` |
| `width` | nil | `nil` |
| `height` | nil | `nil` |
| `perChar` | nil | `nil` |

### `opts` *(line 295)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `font` | string literal | `"THICK"` |
| `scale` | number literal | `2.0` |
| `color` | table | `{ r = 255, g = 255, b = 255, a = 255 }` |
| `halign` | string literal | `"left"` |
| `valign` | string literal | `"top"` |
| `line_spacing` | number literal | `0` |
| `padding` | number literal | `8` |
| `child_padding` | number literal | `0` |
| `auto_size` | boolean literal | `true` |
| `width` | nil | `nil` |
| `height` | nil | `nil` |
| `max_width` | nil | `nil` |
| `max_height` | nil | `nil` |
| `z` | number literal | `100` |
| `slice_scale` | number literal | `1.0` |
| `slice_options` | table | `{}` |
| `overflow` | string literal | `"wrap"` |
| `layout` | string literal | `"vertical"` |
| `spacing` | number literal | `0` |
| `main_axis_spacing` | nil | `nil` |
| `cross_axis_spacing` | number literal | `0` |
| `main_axis_alignment` | string literal | `"start"` |
| `cross_axis_alignment` | string literal | `"center"` |
| `columns` | number literal | `2` |
| `column_spacing` | nil | `nil` |
| `row_spacing` | nil | `nil` |
| `horizontal_alignment` | string literal | `"start"` |
| `vertical_alignment` | string literal | `"start"` |
| `children` | nil | `nil` |

### `color` *(line 297)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | number literal | `255` |
| `g` | number literal | `255` |
| `b` | number literal | `255` |
| `a` | number literal | `255` |

### `opts.color` *(line 313)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `r` | expression/reference | `v.r or 255` |
| `g` | expression/reference | `v.g or 255` |
| `b` | expression/reference | `v.b or 255` |
| `a` | expression/reference | `v.a or 255` |

### `opts` *(line 330)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `opts` *(line 338)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `opts` *(line 346)*

Table initializer detected; no simple direct-level keys could be statically enumerated.

### `child` *(line 358)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `kind` | string literal | `"text"` |
| `text` | expression/reference | `text` |

### `child` *(line 365)*

| Field / key | Value category | Initializer expression (source) |
|---|---|---|
| `kind` | string literal | `"sprites"` |
| `sprites` | expression/reference | `sprites or {}` |
| `sprite_scale` | number literal | `1.0` |
| `columns` | number literal | `1` |
| `column_spacing` | number literal | `5` |
| `row_spacing` | number literal | `5` |
| `sprite_align` | string literal | `"center"` |

## Implementation notes

- This reference is generated from the exact archived source `scripts/displayer/displayer.lua`.
- Function signatures preserve the parameter names and ordering found in the source. Lua varargs appear as `...`.
- Return values, table mutation, network side effects, and error behavior should be interpreted from the implementation; no behavior is inferred where the source does not establish it.
- Line numbers refer to the archived source file, not this Markdown file.
