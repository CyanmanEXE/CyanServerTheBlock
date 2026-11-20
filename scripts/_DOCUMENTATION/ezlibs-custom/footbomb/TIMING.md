# ⚽ FootBomb Result Timing and Motion (current implementation)

This guide matches the current FootBomb catch-sync patch to `scripts/ezlibs-custom/footbomb/main.lua`, `result_timeline.lua`, and `constants.lua`. It does not change Tiled objects, match rules, role selection, or frame artwork.

## Core design

- `Net.animate_bot_properties` remains responsible for client-side interpolated position tracks. Movement is **not** driven by server-side per-tick polling.
- `ResultTimeline.projected_distance(a,b,tile_width,tile_height)` uses the inverse of `WorldAttachment.pixel_offset_to_map`'s isometric projection: `screen_dx=(x-y)*tile_width/2`, `screen_dy=(x+y)*tile_height/2`. Dividing the pixel distance by `tile_width/2` gives comparable **projected half-tile units** across all directions.
- `ResultTimeline.travel_duration(a,b,speed,tile_width,tile_height,minimum)` returns the natural duration and projected distance. The minimum is 0.12s to prevent zero-duration network tracks.
- The kicker's two walks use `RESULT_KICKER_WALK_UR_SPEED` and `RESULT_KICKER_WALK_U_SPEED`, both default 3 projected units/s. The walk animation state is set once per leg rather than duplicated immediately before movement.
- Ordinary ball flight (misses) uses **`RESULT_BOMB_MOVE_SPEED=9`** projected units/s, replacing the previous hidden `3×` multiplier. Successful catches may deliberately travel *more slowly* to meet the authored contact frame; they never accelerate beyond their configured natural speed.
- `ResultTimeline.plan_response(...)` freezes both actors' movement and contact timing before the response begins. Each direction combination uses the same planner.

## Match catch synchronization (current)

The previous planner used a short natural ball duration followed by a wait before launch. In-game, that looked like a pause followed by a near-instant snap into the defender's hand, particularly for matching-direction catches. The current plan *stretches the visible ball movement instead of delaying its launch*. This is intentional for catches only.

- `RESULT_CATCH_MIN_FLIGHT_SECONDS = 0.70` sets the minimum visible flight for any successful catch, including the stationary Up/Up center catch.
- `RESULT_CATCH_JUMP_CONTACT_RATIO = 0.70` places Left/Left and Right/Right contact at 70% of the authored **movement** interval of `FOOTBOMB_JUMP_LEFT`/`FOOTBOMB_JUMP_RIGHT`. The ratio is clamped to 0.50–0.90 by `catch_contact_elapsed()`.
- For a typical 1.0-second movement / 1.1-second overall jump, a matching catch meets the same *authored Ball point* at elapsed **0.70 seconds**. FootBomb computes the world-space defender position and frame-local Ball point at that same time.
- The code submits the defender jump before dispatching the ball track on matching catches. It uses `Net.animate_bot_properties` for both and passes the *planned* flight duration to `move_bot_smoothly()`; merely computing a longer duration without that override would have left the animation unchanged.
- `BOMB_CATCH_CONTACT` and subsequent Ball-point follow begin **after** the ball's planned movement completes. The follower uses the remaining authored jump time, then holds through the result phase.

Let `B` be natural flight duration at `RESULT_BOMB_MOVE_SPEED`, `M` the minimum catch flight, `J` the jump's movement duration, and `R` its contact ratio (default `0.70`):

| Case | Planned ball duration | Defender delay | Contact |
|---|---|---|---|
| Left/Left or Right/Right | `max(B, M, J×R)` | `max(0, duration−J×R)` | `duration` after ball start; `J×R` into defender jump |
| Up/Up center catch | `max(B, M)` | None | At the end of visible center flight |
| Different directions (miss) | `B` | None | No catch |

`bomb_delay` is now zero for normal catches: the player sees a readable moving ball instead of a long stationary pause followed by a very fast flight. When an unusually long flight is unavoidable, the defender's jump may start later so the ball is **not** sped up beyond natural speed.

A missing `Ball` point still falls back to the regular bomb target, while gameplay's winner rules remain unchanged. The plan does not attempt to infer real client network/animation latency; the new clocks and synchronization should be visually verified in an OpenNetBattle client.

## Smooth jump and attachment keyframes

- Defender jump movement uses a 5-value neutral (linear progress) profile on the existing small Bezier arc. The arc is sampled at 0.05s intervals and converted into one client-side keyframe track. The **author's animation-frame durations are preserved**.
- The Ball point offsets from successive authored Navi frames are linearly blended over each frame duration, then converted to map offsets using `WorldAttachment.pixel_offset_to_map`.
- Attachment position keyframes are sampled at 0.05s rather than only frame boundaries. This avoids a single half-second frame producing one abrupt follower segment.
- `anti_jitter=false` for moving Ball attachments; static overlays may still use world-attachment quantization where appropriate.
- The landing END pose is set at its authored final-frame boundary and reasserted once after 0.08s, rather than reasserted approximately 12 times during the result hold.

## Configuration reference

In `scripts/ezlibs-custom/footbomb/constants.lua`:

| Property | Default | Purpose |
|---|---:|---|
| `GAMEPLAY.RESULT_KICKER_WALK_UR_SPEED` | `3` | Kicker first walk speed in projected half-tile units/sec |
| `GAMEPLAY.RESULT_KICKER_WALK_U_SPEED` | `3` | Kicker second walk speed in same units/sec |
| `GAMEPLAY.RESULT_BOMB_MOVE_SPEED` | `9` | Base ball speed in projected units/sec; ordinary misses use this exactly |
| `GAMEPLAY.RESULT_CATCH_MIN_FLIGHT_SECONDS` | `0.70` | Minimum visible ball flight for any successful catch |
| `GAMEPLAY.RESULT_CATCH_JUMP_CONTACT_RATIO` | `0.70` | Portion of authored jump movement elapsed when a matching Left/Right catch contacts the Ball point |
| `GAMEPLAY.RESULT_DEFENDER_JUMP_SPEED` | `5` | Neutral path progress; jump duration remains authored in `.animation` |
| `GAMEPLAY.RESULT_JUMP_SAMPLE_SECONDS` | `0.05` | Spatial keyframe spacing for the defender arc |
| `GAMEPLAY.RESULT_ATTACHMENT_SAMPLE_SECONDS` | `0.05` | Spatial keyframe spacing for the ball follower |
| `GAMEPLAY.RESULT_END_POSE_REASSERT_SECONDS` | `0.08` | One-time safety reassert delay on END pose |
| `GAMEPLAY.RESULT_BALL_Z_LIFT` | `4` | Z offset for the attached ball (unchanged) |
| `DIAGNOSTICS.RUN_RESULT_TIMING_DIAGNOSTICS` | `false` | Per-sample attachment logs when debugging |

**Do not modify the jump animation states merely to adjust movement speed.** They determine when the sprite changes pose and the movement-to-landing boundary. Changing only a speed value does not retime authored Navi frames. The projected distance metric changes the relationship between map coordinates and on-screen speed by design.

## Source APIs (all pure except the main runtime)

- `ResultTimeline.state_timing(state)` → authored movement/final-frame timing
- `ResultTimeline.projected_distance(a,b,tile_width,tile_height)` → projected XY distance; Z is deliberately excluded
- `ResultTimeline.travel_duration(a,b,speed,tile_width,tile_height,minimum)` → duration, projected distance
- `ResultTimeline.catch_contact_elapsed(jump_movement_duration, ratio)` → elapsed time and normalized ratio shared by target sampling and planning
- `ResultTimeline.plan_response(options)` → complete plan (natural and applied bomb duration, contact ratio/time, delays, completion time)
- `ResultTimeline.sample_times(first,last,step)` → deterministic uniformly spaced relative times

## Validation and diagnostics

Run `texlua scripts/ezlibs-custom/footbomb/tests/test_result_timeline.lua` from the server root. The isolated test checks the nine direction combinations, projection consistency, short/long catch alignment, fallback paths, animation clock, and sample spacing. `texlua` is used for offline tests only; production code remains Lua-compatible with the server's existing Lua APIs.

During an in-game round, search for `TIMING_PLAN:` in FootBomb logs. Each record includes the two directions, projected distance, configured ball speed, **natural_bomb_duration**, **bomb_duration**, **catch_minimum_duration**, **contact_ratio**, ball/defender delays, contact time, completion duration, and tile dimensions. Compare `natural_bomb_duration` and `bomb_duration` to confirm a fast catch was stretched as planned. Turn on `RUN_RESULT_TIMING_DIAGNOSTICS` only while investigating Ball attachment interpolation, to avoid excessive per-sample logging during gameplay.

### Live checks still required

Verify with OpenNetBattle clients: Left/Left, Left/Up, Left/Right, Up/Left, Up/Up, Up/Right, Right/Left, Right/Up, Right/Right; repeat with different Navis, especially matching catches. Compare perceived travel speed, catch contact, landing poses, and SFX against this plan. Offline tests cannot establish network delivery latency or actual client frame timing.
