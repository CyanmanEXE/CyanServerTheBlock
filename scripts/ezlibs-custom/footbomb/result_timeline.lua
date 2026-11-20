-- Pure timing helpers for FootBomb's result sequence.
-- This module deliberately does not animate actors or wait on async tasks;
-- it calculates timing boundaries from authored animation data and gameplay
-- travel estimates so callers can coordinate their own event-driven tracks.
local ResultTimeline = {}

function ResultTimeline.state_timing(state)
    local frames = state and state.framelist
    if type(frames) ~= "table" or #frames < 2 then
        return nil, "state needs at least two frames (movement plus landing hold)"
    end

    local total_duration = 0
    local movement_duration = 0
    for index, frame in ipairs(frames) do
        local frame_duration = math.max(0, tonumber(frame.duration) or 0)
        total_duration = total_duration + frame_duration
        if index < #frames then
            movement_duration = movement_duration + frame_duration
        end
    end

    if movement_duration <= 0 then
        return nil, "movement frames have no positive duration"
    end
    if total_duration <= 0 then
        return nil, "animation state has no positive duration"
    end

    return {
        frame_count = #frames,
        total_duration = total_duration,
        movement_duration = movement_duration,
        final_frame_duration = math.max(0, tonumber(frames[#frames].duration) or 0),
        final_frame_start = movement_duration,
    }
end

function ResultTimeline.shared_response_duration(options)
    options = options or {}
    -- The response waits for the authored jump animation to finish, while
    -- the defender's movement ends at the movement-frame boundary.
    local jump_duration = math.max(0, tonumber(options.jump_animation_duration)
        or tonumber(options.jump_movement_duration) or 0)
    local defender_duration = math.max(0, tonumber(options.defender_travel_duration) or 0)
    local bomb_duration = math.max(0, tonumber(options.bomb_travel_duration) or 0)
    local matching_jump = options.matching_jump == true
    local center_catch = options.center_catch == true
    local minimum = math.max(0, tonumber(options.minimum_duration) or 0.12)

    -- In catch cases, bomb travel is fitted to the shared timeline later using
    -- the exact attachment point. For ordinary throws, it constrains duration.
    local effective_bomb_duration = (matching_jump or center_catch) and 0 or bomb_duration
    return math.max(minimum, jump_duration, defender_duration, effective_bomb_duration)
end


-- The inverse of WorldAttachment.pixel_offset_to_map('isometric'):
-- screen_dx = (map_dx - map_dy) * tile_width / 2;
-- screen_dy = (map_dx + map_dy) * tile_height / 2.
-- Normalize to half a tile width so existing speed settings remain small
-- map-like units/s while equal on-screen distances take equal time.
function ResultTimeline.projected_distance(a, b, tile_width, tile_height)
    if type(a) ~= "table" or type(b) ~= "table" then return nil end
    local ax, ay = tonumber(a.x), tonumber(a.y)
    local bx, by = tonumber(b.x), tonumber(b.y)
    if not ax or not ay or not bx or not by then return nil end
    tile_width = math.max(1, tonumber(tile_width) or 64)
    tile_height = math.max(1, tonumber(tile_height) or 32)
    local dx, dy = bx - ax, by - ay
    local screen_x = (dx - dy) * tile_width * 0.5
    local screen_y = (dx + dy) * tile_height * 0.5
    return math.sqrt(screen_x * screen_x + screen_y * screen_y) / (tile_width * 0.5)
end

function ResultTimeline.travel_duration(a, b, speed, tile_width, tile_height, minimum)
    local distance = ResultTimeline.projected_distance(a, b, tile_width, tile_height)
    if not distance then return nil, "invalid movement endpoints" end
    speed = tonumber(speed)
    if not speed or speed <= 0 then return nil, "speed must be positive" end
    return math.max(tonumber(minimum) or 0.12, distance / speed), distance
end

-- Compute the intended elapsed point in the defender's authored jump. Both
-- catch-target sampling and the response planner must use this same point.
function ResultTimeline.catch_contact_elapsed(jump_movement_duration, ratio)
    local duration = math.max(0, tonumber(jump_movement_duration) or 0)
    ratio = tonumber(ratio) or 0.70
    ratio = math.max(0.5, math.min(0.9, ratio))
    return duration * ratio, ratio
end

-- Plan ONE launch. A successful catch has a readable minimum ball-flight
-- window. A short natural flight is stretched (never sped up) to that window,
-- and jumping catches meet the same authored Ball point at the chosen contact
-- fraction. For unusually long flights, the defender may launch later rather
-- than accelerating the ball. Misses always retain their natural speed.
function ResultTimeline.plan_response(options)
    options = options or {}
    local matching = options.matching_jump == true and type(options.catch_target) == "table"
    local center = options.center_catch == true and type(options.catch_target) == "table"
    local destination = (matching or center) and options.catch_target or options.bomb_target
    local minimum = math.max(0.001, tonumber(options.minimum_duration) or 0.12)
    local bomb_duration, distance_or_error = ResultTimeline.travel_duration(
        options.bomb_start, destination, options.bomb_speed,
        options.tile_width, options.tile_height, minimum
    )
    if not bomb_duration then return nil, distance_or_error end
    local natural_bomb_duration = bomb_duration
    local catch_minimum = math.max(minimum,
        tonumber(options.catch_minimum_duration) or 0.70)
    local jump_movement = math.max(0, tonumber(options.jump_movement_duration) or 0)
    local jump_animation = math.max(jump_movement,
        tonumber(options.jump_animation_duration) or jump_movement)
    local contact_elapsed, contact_ratio, bomb_delay, defender_delay = 0, nil, 0, 0
    if matching then
        if jump_movement <= 0 then return nil, "matching jump missing movement duration" end
        contact_elapsed, contact_ratio = ResultTimeline.catch_contact_elapsed(
            jump_movement, options.catch_contact_ratio)
        -- Most shots are so short that their natural duration is below the
        -- midpoint of the jump. Stretch the movement itself, not a pre-launch
        -- pause followed by a nearly instantaneous catch.
        bomb_duration = math.max(bomb_duration, catch_minimum, contact_elapsed)
        defender_delay = math.max(0, bomb_duration - contact_elapsed)
    elseif center then
        -- Up/Up has no jump but should not instantly switch to caught.
        bomb_duration = math.max(bomb_duration, catch_minimum)
    end
    local contact_time = bomb_delay + bomb_duration
    local defender_end = defender_delay + jump_animation
    local ball_end = matching and (contact_time + jump_animation - contact_elapsed)
        or contact_time
    local response_duration = math.max(minimum, defender_end, ball_end)
    return {
        bomb_destination = destination,
        bomb_duration = bomb_duration,
        natural_bomb_duration = natural_bomb_duration,
        catch_minimum_duration = (matching or center) and catch_minimum or nil,
        bomb_distance = distance_or_error,
        bomb_delay = bomb_delay,
        defender_delay = defender_delay,
        contact_elapsed = contact_elapsed,
        contact_ratio = contact_ratio,
        contact_time = contact_time,
        defender_end = defender_end,
        ball_end = ball_end,
        response_duration = response_duration,
        matching_jump = matching,
        center_catch = center,
    }
end

-- Uniform time samples for a position-only Net.animate_bot_properties track.
-- Guaranteed positive segment durations and an exact final endpoint.
function ResultTimeline.sample_times(first, last, step)
    first = tonumber(first) or 0
    last = math.max(first, tonumber(last) or first)
    step = math.max(0.01, tonumber(step) or 0.05)
    local intervals = math.max(1, math.ceil((last - first) / step))
    intervals = math.min(intervals, 128)
    local samples = {first}
    for index = 1, intervals do
        samples[#samples + 1] = first + (last - first) * (index / intervals)
    end
    return samples
end

return ResultTimeline
