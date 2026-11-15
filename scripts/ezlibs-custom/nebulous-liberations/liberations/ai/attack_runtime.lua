-- Shared attack primitives for pattern-driven and established Liberation OW
-- attacks. Temporary visuals are Net bots; this module guarantees their
-- texture/animation dependencies precede creation and their animation phase
-- continues uninterrupted across movement steps.
local Preloader = require("scripts/ezlibs-custom/nebulous-liberations/liberations/preloader")
local Guard = require("scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception")
local Assets = require("scripts/ezlibs-custom/nebulous-liberations/liberations/ai/attack_assets")
local Runtime = {}
local spawned_effects = {}  -- bot ID -> { area, animation, lift, position }
-- Liberation uses the same isometric projection compensation for floating HP
-- indicator bots: +1 Z requires +0.5 on BOTH world axes to keep the sprite
-- centered over the same ground tile. These are VISUAL coordinates only.
local EFFECT_Z_LIFT = 1
local MIN_STEP_SECONDS = 0.34
local function effect_coords(x,y,z,lift)
    lift = lift or EFFECT_Z_LIFT
    return x + lift/2, y + lift/2, z + lift
end
local logged_spawns = {}    -- one diagnostic per state+texture+mission

local function label(enemy)
    return enemy and (enemy.template_name or enemy.battle_name) or "unnamed enemy"
end

function Runtime.ensure_effect(enemy, texture_path, animation_path, source)
    if not enemy or not enemy.instance then return false end
    local paths = {}
    if type(texture_path) == "string" then paths[texture_path] = source or "effect.texture" end
    if type(animation_path) == "string" then paths[animation_path] = source or "effect.animation" end
    if not next(paths) then return false end
    local ready = Preloader.ensure_paths(enemy.instance.area_id, paths, label(enemy))
    return ready == true
end

local function animate_effect(id, state)
    if state == nil or state == "" then return true end
    -- The real Net API accepts an explicit state and optional loop flag.
    -- Request it immediately after bot creation. Do NOT replay the same
    -- state on subsequent tile movements, or multi-frame animations freeze.
    local ok, err = pcall(Net.animate_bot, id, state, false)
    if not ok or err == false then
        print("[NL_ASSET][EFFECT_ANIMATION_FAILED]", "bot", tostring(id),
            "state", tostring(state), "error", tostring(err))
        return false
    end
    return true
end

function Runtime.spawn_effect(enemy, args)
    if type(args) ~= "table" or not enemy or not enemy.instance then return nil end
    if not Runtime.ensure_effect(enemy, args.texture_path, args.animation_path, "effect spawn") then
        print("[NL_ASSET][EFFECT_SKIPPED]", label(enemy),
            tostring(args.texture_path), tostring(args.animation_path))
        return nil
    end
    if args.animation and not Preloader.validate_animation_state(
        enemy.instance.area_id, args.animation_path, args.animation, label(enemy)) then
        print("[NL_ASSET][EFFECT_SKIPPED_MISSING_STATE]", label(enemy),
            tostring(args.animation_path), tostring(args.animation))
        return nil
    end
    -- Attack effects are visual-only. Z=ground+1 draws them over players;
    -- offsetting X/Y by +0.5 (the same z/2 correction used by HP digits)
    -- compensates the isometric projection so the center remains on target.
    -- Falling snowballs can start at +8 Z but share the +1 Z landing anchor.
    -- Build a new table rather than mutating the caller's original position.
    local ground_z = tonumber(enemy.z) or 0
    local in_z = tonumber(args.z) or ground_z
    local ground_x,ground_y = tonumber(args.x) or 0,tonumber(args.y) or 0
    local render_x,render_y,render_z=effect_coords(ground_x,ground_y,ground_z)
    if in_z > ground_z + EFFECT_Z_LIFT + 0.001 then
        -- Preserve falling-bot start altitude, anchored on the same tile.
        render_z = in_z
    end
    local bot_args = {}
    for k,v in pairs(args) do bot_args[k] = v end
    bot_args.x,bot_args.y,bot_args.z=render_x,render_y,render_z
    if bot_args.solid == nil then bot_args.solid = false end
    local ok, id = pcall(Net.create_bot, bot_args)
    if not ok or id == nil or id == false then
        print("[NL_ASSET][EFFECT_BOT_CREATE_FAILED]", label(enemy),
            "area", tostring(args.area_id), "state", tostring(args.animation),
            "texture", tostring(args.texture_path),
            "animation_path", tostring(args.animation_path),
            "error", tostring(id))
        return nil
    end
    spawned_effects[id] = { area = args.area_id, animation = args.animation,
        z_lift = EFFECT_Z_LIFT, x = render_x, y = render_y, z = render_z }
    -- The `animation` field in Net.create_bot is supported, but explicitly
    -- calling animate_bot keeps the state deterministic on client versions
    -- that initially render an IDLE/default state for new actors.
    if args.animation and not animate_effect(id, args.animation) then
        spawned_effects[id] = nil
        Net.remove_bot(id, false)
        return nil
    end
    local key = tostring(args.area_id) .. "|" .. tostring(args.animation_path)
        .. "|" .. tostring(args.animation)
    if not logged_spawns[key] then
        logged_spawns[key] = true
        print("[NL_ASSET][EFFECT_BOT_READY]", "enemy", label(enemy),
            "bot", tostring(id), "area", tostring(args.area_id),
            "state", tostring(args.animation),
            "texture", tostring(args.texture_path),
            "animation", tostring(args.animation_path),
            "ground", tostring(ground_x), tostring(ground_y), tostring(ground_z),
            "render", tostring(render_x), tostring(render_y), tostring(render_z))
    end
    return id
end

function Runtime.spawn_named(enemy, name, state, direction, x, y, z)
    local tex, anim = Assets.effect_paths(name)
    if not tex or not anim then return nil end
    return Runtime.spawn_effect(enemy, {
        texture_path = tex, animation_path = anim, animation = state,
        direction = direction, area_id = enemy.instance.area_id,
        warp_in = false, x = x + 0.5, y = y + 0.5, z = z,
    })
end

function Runtime.move_effect(enemy, id, x, y, z, animation, seconds)
    if id == nil or not enemy or not enemy.instance then return false end
    local target_area = enemy.instance.area_id
    local info = spawned_effects[id]
    if not info then
        print("[NL_ASSET][EFFECT_MOVE_UNTRACKED]", tostring(id))
        return false
    end
    local current_area = info.area
    if type(Net.get_bot_area) == "function" then
        local ok, area = pcall(Net.get_bot_area, id)
        if ok and area ~= nil then current_area = area end
    end
    if current_area ~= target_area then
        -- Attack projectiles should stay in their mission instance. Never
        -- transfer to another area as part of ordinary travel (a warp).
        print("[NL_ASSET][EFFECT_CROSS_AREA_BLOCKED]", tostring(id),
            tostring(current_area), tostring(target_area))
        return false
    end
    local duration = math.max(MIN_STEP_SECONDS, tonumber(seconds) or MIN_STEP_SECONDS)
    if duration ~= duration or duration == math.huge then duration=MIN_STEP_SECONDS end
    local target_x,target_y,target_z=effect_coords(x,y,z,info.z_lift)
    if type(Net.animate_bot_properties) ~= "function" then
        -- A discrete Net.move_bot() would visibly teleport one entire tile.
        -- Refuse instead of silently introducing a warp on older servers.
        print("[NL_ASSET][EFFECT_KEYFRAMES_UNAVAILABLE]", tostring(id))
        return false
    end
    local frames = {{
        properties = {
            {property="X", ease="Linear", value=target_x},
            {property="Y", ease="Linear", value=target_y},
            {property="Z", ease="Linear", value=target_z},
        },
        duration = duration,
    }}
    local ok, result = pcall(Net.animate_bot_properties, id, frames)
    if not ok or result == false then
        print("[NL_ASSET][EFFECT_KEYFRAME_FAILED]", tostring(id), tostring(result))
        return false
    end
    info.x,info.y,info.z=target_x,target_y,target_z
    if animation and info.animation ~= animation then
        if not animate_effect(id,animation) then return false end
        info.animation=animation
    end
    return true, duration
end

function Runtime.remove_effect(id)
    if id == nil then return end
    spawned_effects[id] = nil
    Net.remove_bot(id, false)
end

-- Reusable falling effect (BlizzardMan) through the existing Net API.
function Runtime.animate_falling_effect(id, destination_z, duration)
    if id == nil or type(Net.animate_bot_properties) ~= "function" then return end
    Net.animate_bot_properties(id, {{
        properties = {{ property = "Z", ease = "Linear", value = destination_z }},
        duration = duration or 0.5,
    }})
end
function Runtime.begin_telegraph(selection) selection:indicate() end
function Runtime.end_telegraph(selection) selection:remove_indicators() end
function Runtime.prepare(enemy, sessions, duration)
    return Guard.prepare_attack(enemy.instance, enemy, sessions, duration)
end
function Runtime.impact(enemy, records, damage)
    if not records or #records == 0 then return end
    Guard.apply_damage(records, damage or enemy.attack_damage or 10, enemy)
    Guard.finish_attack(enemy.instance, records)
end
function Runtime.finish_empty(enemy)
    Guard.finish_attack(enemy.instance, {})
end
return Runtime
