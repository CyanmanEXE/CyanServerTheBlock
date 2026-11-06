-- enemy_templates.lua
--
-- Enemy behaviour, health, and assets live here. Encounters do NOT live
-- here: they are always resolved from the area's Liberation Encounters
-- custom property via PanelEncounters.resolve_encounter(base_area_id),
-- which routes through ezencounters. Do not add a per-template encounter
-- path — it will be ignored by instance.lua.
local EnemySelection = require("scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_selection")
local EnemyHelpers = require("scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers")
local GuardInterception = require("scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception")
local Preloader = require("scripts/ezlibs-custom/nebulous-liberations/liberations/preloader")
local Constants = require("scripts/ezlibs-custom/nebulous-liberations/liberations/constants")
local Direction = require("scripts/libs/direction")

local EnemyTemplates = {}

-- Register a template
function EnemyTemplates.register(name, template)
    EnemyTemplates[name] = template
end

-- Create an enemy instance from a template
function EnemyTemplates.create(instance, position, direction, template_name, spawn_options)
    local template = EnemyTemplates[template_name]
    if not template then
        error("Unknown enemy template: " .. template_name)
    end
    local enemy = {
        instance = instance,
        id = nil,
        -- Preserve the ezencounters enemy_packages alias (the key used in
        -- data.enemies[index].name). Display names are not guaranteed to be
        -- identical to that alias, so battle HP must match against this key.
        template_name = template_name,
        battle_name = template.battle_name,
        default_ow_bot_encounter_name = template.default_ow_bot_encounter_name,
        health = template.health,
        max_health = template.max_health,
        -- Preserve the enemy's intended world scale across movement. A
        -- spawn-specific scale overrides the template scale; normal is 1.0.
        scale = tonumber(spawn_options and spawn_options.scale)
            or tonumber(template.scale)
            or 1.0,
        x = math.floor(position.x),
        y = math.floor(position.y),
        z = math.floor(position.z),
        selection = EnemySelection:new(instance),
        mug = template.mug,
        is_boss = (spawn_options and spawn_options.is_boss == true) or template.is_boss or false,
        is_special_encounter = template.is_special_encounter or false,
        ai_type = template.ai_type or "simple_charge",
        ai_params = template.ai_params or {},
        -- These fields are read from `self` at runtime (spawn, attack,
        -- death) and must be copied explicitly; the enemy instance table
        -- does not otherwise inherit from the template.
        texture_path = template.texture_path,
        animation_path = template.animation_path,
        attack_texture = template.attack_texture,
        attack_animation_path = template.attack_animation_path,
        attack_damage = template.attack_damage,
        death_message = template.death_message,
        preload_assets = template.preload_assets,
        auto_face_player = spawn_options == nil or spawn_options.auto_face_player ~= false,
    }
    if enemy.scale <= 0 or enemy.scale ~= enemy.scale
        or enemy.scale == math.huge or enemy.scale == -math.huge then
        enemy.scale = 1.0
    end
    setmetatable(enemy, EnemyTemplates.metatable)
    EnemyTemplates.metatable.__index = EnemyTemplates.metatable

    -- Set up selection shape
    local shape = template.shape or { {1} }
    local offset_x = template.shape_offset_x or 0
    local offset_y = template.shape_offset_y or -1
    enemy.selection:set_shape(shape, offset_x, offset_y)

    -- Preload assets
    if template.preload_assets then
        for _, asset in ipairs(template.preload_assets) do
            Preloader.add_asset(asset)
        end
    end

    enemy:spawn(direction)
    return enemy
end

-- Metatable with default methods
EnemyTemplates.metatable = {
    spawn = function(self, direction)
        local closest_session = EnemyHelpers.find_closest_player_session(self.instance, self)
        if self.auto_face_player and closest_session and closest_session.player then
            local player = closest_session.player
            direction = Direction.diagonal_from_offset(
                player.x - (self.x + .5),
                player.y - (self.y + .5)
            )
        end

        self.direction = direction
        self.id = Net.create_bot({
            texture_path = self.texture_path,
            animation_path = self.animation_path,
            area_id = self.instance.area_id,
            direction = direction,
            warp_in = false,
            x = self.x + .5,
            y = self.y + .5,
            z = self.z
        })
        local color = self.is_boss and EnemyHelpers.boss_minimap_color or EnemyHelpers.guardian_minimap_marker
        Net.set_bot_minimap_color(self.id, color)
    end,
    get_death_message = function(self)
        return self.death_message or "Gyaaaaahh!!"
    end,
    take_turn = function(self)
        -- Use the AI type to determine behaviour
        if self.ai_type == "simple_charge" then
            return EnemyTemplates.ai.simple_charge(self)
        elseif self.ai_type == "ranged" then
            return EnemyTemplates.ai.ranged(self)
        elseif self.ai_type == "shockwave_line" then
            return EnemyTemplates.ai.shockwave_line(self)
        else
            return Async.create_promise(function(resolve) resolve() end)
        end
    end,
}
local function sign(a)
  if a < 0 then
    return -1
  end

  return 1
end
-- AI implementations
EnemyTemplates.ai = {}

function EnemyTemplates.ai.simple_charge(self)
    local co = coroutine.create(function()
        local closest_session = EnemyHelpers.find_closest_player_session(self.instance, self)
        if not closest_session then return end
        local player = closest_session.player
        local distance = EnemyHelpers.chebyshev_tile_distance(self, player.x, player.y)
        if distance > 4 then return end

        local xdiff = math.floor(player.x) - self.x
        local ydiff = math.floor(player.y) - self.y

        local function attempt_axis(xstep, ystep, diff)
            return Async.create_promise(function(resolve)
                local step = (xstep ~= 0 and sign(xdiff)) or (ystep ~= 0 and sign(ydiff)) or 0
                local limit = math.min(math.abs(diff), 2)
                local offset = 0
                for i = limit, 1, -1 do
                    if EnemyHelpers.can_move_to(self.instance, self.x + xstep * i, self.y + ystep * i, self.z, self) then
                        offset = i
                        break
                    end
                end
                if offset == 0 then
                    resolve(false)
                    return
                end
                local targetx = self.x + xstep * offset
                local targety = self.y + ystep * offset
                EnemyHelpers.face_position(self, targetx + .5, targety + .5)
                local target_direction = Direction.diagonal_from_offset(player.x - (targetx + .5), player.y - (targety + .5))
                EnemyHelpers.move(self.instance, self, targetx, targety, self.z, target_direction).and_then(function()
                    resolve(true)
                end)
            end)
        end

        if (ydiff == 0 or math.abs(xdiff) < math.abs(ydiff)) and xdiff ~= 0 then
            if not Async.await(attempt_axis(xdiff > 0 and 1 or -1, 0, xdiff)) then
                Async.await(attempt_axis(0, ydiff > 0 and 1 or -1, ydiff))
            end
        elseif ydiff ~= 0 then
            if not Async.await(attempt_axis(0, ydiff > 0 and 1 or -1, ydiff)) then
                Async.await(attempt_axis(xdiff > 0 and 1 or -1, 0, xdiff))
            end
        end

        self.selection:move(self, Net.get_bot_direction(self.id))
        local caught_sessions = self.selection:detect_player_sessions()
        if #caught_sessions > 0 then
            local closest = EnemyHelpers.find_closest_player_session(self.instance, self)
            EnemyHelpers.face_position(self, closest.player.x, closest.player.y)
            self.selection:indicate()
            Async.await(Async.sleep(1))
            local attack_records = GuardInterception.prepare_attack(self.instance, self, caught_sessions, 0.5)
            EnemyHelpers.play_attack_animation(self)
            local spawned_bots = {}
            for _, record in ipairs(attack_records) do
                local position = record.visual_position
                if position then
                local bot_id = Net.create_bot({
                    texture_path = self.attack_texture or "/server/assets/NebuLibsAssets/bots/beast breath.png",
                    animation_path = self.attack_animation_path or "/server/assets/NebuLibsAssets/bots/beast breath.animation",
                    animation = "ANIMATE",
                    area_id = self.instance.area_id,
                    warp_in = false,
                    x = position.x + 1/32,
                    y = position.y + 1/32,
                    z = position.z
                })
                table.insert(spawned_bots, bot_id)
                end
            end
            Async.await(Async.sleep(.5))
            for _, player in ipairs(self.instance.players) do
                Net.shake_player_camera(player.id, 2, .5)
            end
            GuardInterception.apply_damage(attack_records, self.attack_damage or 20, self)
            GuardInterception.finish_attack(self.instance, attack_records)
            Async.await(Async.sleep(.5))
            for _, bot_id in ipairs(spawned_bots) do
                Net.remove_bot(bot_id, false)
            end
            Async.await(Async.sleep(1))
            self.selection:remove_indicators()
        end
    end)
    return Async.promisify(co)
end

function EnemyTemplates.ai.ranged(self)
    -- placeholder
    return Async.create_promise(function(resolve) resolve() end)
end

-- Register default templates
EnemyTemplates.register("BigBrute", {
    battle_name = "BigBrute",
    health = 120,
    max_health = 120,
    texture_path = "/server/assets/NebuLibsAssets/bots/bigbrute.png",
    animation_path = "/server/assets/NebuLibsAssets/bots/bigbrute.animation",
    shape = { {1,1,1}, {1,0,1}, {1,1,1} },
    shape_offset_x = 0,
    shape_offset_y = -2,
    attack_damage = 20,
    attack_texture = "/server/assets/NebuLibsAssets/bots/beast breath.png",
    attack_animation_path = "/server/assets/NebuLibsAssets/bots/beast breath.animation",
    ai_type = "simple_charge",
    is_special_encounter = true,
    preload_assets = { "/server/assets/NebuLibsAssets/bots/bigbrute.animation","/server/assets/NebuLibsAssets/bots/beast breath.png", "/server/assets/NebuLibsAssets/bots/beast breath.animation","/server/assets/NebuLibsAssets/bots/bigbrute.png", },
})

EnemyTemplates.register("BlizzardMan", {
    battle_name = "BlizzardMan",
    health = 400,
    max_health = 400,
    texture_path = "/server/assets/NebuLibsAssets/bots/blizzardman.png",
    animation_path = "/server/assets/NebuLibsAssets/bots/blizzardman.animation",
    shape = { {1,1,1}, {1,0,1}, {1,1,1}, {1,1,1} },
    shape_offset_x = 0,
    shape_offset_y = -2,
    attack_damage = 40,
    attack_texture = "/server/assets/NebuLibsAssets/bots/snowball.png",
    attack_animation_path = "/server/assets/NebuLibsAssets/bots/snowball.animation",
    ai_type = "simple_charge",
    is_boss = true,
    mug = {
        texture_path = "/server/assets/NebuLibsAssets/mugs/blizzardman.png",
        animation_path = "/server/assets/NebuLibsAssets/mugs/blizzardman.animation",
    },
    death_message = "Woosh!\nI can't believe\nit. I can't lose.\nNOOOO!",
    preload_assets = { "/server/assets/NebuLibsAssets/bots/snowball.png", "/server/assets/NebuLibsAssets/bots/snowball.animation" },
})

EnemyTemplates.register("ShadeMan", {
    battle_name = "ShadeMan",
    health = 600,
    max_health = 600,
    texture_path = "/server/assets/NebuLibsAssets/bots/shademan.png",
    animation_path = "/server/assets/NebuLibsAssets/bots/shademan.animation",
    shape = { {1} },
    shape_offset_x = 0,
    shape_offset_y = -1,
    attack_damage = 60,
    ai_type = "ranged",  -- custom AI will be implemented separately
    is_boss = true,
    mug = {
        texture_path = "/server/assets/NebuLibsAssets/mugs/shademan.png",
        animation_path = "/server/assets/NebuLibsAssets/mugs/shademan.animation",
    },
    death_message = "Grr! I can't\nbelieve I've been\ndisgraced again...!\nGyaaaahh!!",
    preload_assets = { "/server/assets/NebuLibsAssets/bots/shademan.animation", "/server/assets/NebuLibsAssets/bots/shademan.png", "/server/assets/NebuLibsAssets/mugs/shademan.png","/server/assets/NebuLibsAssets/mugs/shademan.animation",}
})

-- Mettaur's overworld shockwave attack. This uses the Liberation selection
-- system, not the client-side Mettaur battle mod. The selection is a straight
-- three-tile line in the bot's current isometric direction.
-- These overworld sprites use the native 48x56 animation frames and are
-- intentionally NOT resized to BigBrute's previous bot appearance.
local METTAUR_OW_TEXTURE = "/server/assets/ezlibs-custom/nebulous-liberations/mettaur_ow.png"
local METTAUR_OW_ANIMATION = "/server/assets/ezlibs-custom/nebulous-liberations/mettaur_ow.animation"
local SHOCKWAVE_TEXTURE = "/server/assets/ezlibs-custom/nebulous-liberations/shockwaves_all_directions.png"
local SHOCKWAVE_ANIMATION = "/server/assets/ezlibs-custom/nebulous-liberations/shockwaves_all_directions.animation"
local SHOCKWAVE_DIRECTION = {
    [Direction.UP_LEFT] = { suffix = "UL", dx = -1, dy = 0 },
    [Direction.UP_RIGHT] = { suffix = "UR", dx = 0, dy = -1 },
    [Direction.DOWN_RIGHT] = { suffix = "DR", dx = 1, dy = 0 },
    [Direction.DOWN_LEFT] = { suffix = "DL", dx = 0, dy = 1 },
}
local SHOCKWAVE_RANGE = 3
local SHOCKWAVE_STEP_SECONDS = 0.12
local SHOCKWAVE_FRAME_SECONDS = {0.09, 0.10, 0.11, 0.125, 0.125, 0.13}
-- All four ATTACK_* states in mettaur_ow.animation have eight frames:
-- 0.10 + 0.10 + 0.10 + 0.09 + 0.09 + 0.13 + 0.10 + 0.12 = 0.83s.
-- Allow one small network/frame margin before starting the first shockwave.
-- Keep this value synchronized if those animation frame durations change.
local METTAUR_ATTACK_ANIMATION_SECONDS = 0.83 + 0.05

local function has_terrain_tile(instance, x, y, z)
    -- Net.get_tile can fail outside the map, so guard against the end of a
    -- straight line reaching the map boundary.
    local ok, tile = pcall(Net.get_tile, instance.area_id, x, y, z)
    return ok and type(tile) == "table" and type(tile.gid) == "number" and tile.gid > 0
end

-- A shockwave is one straight three-tile ray in the direction the Mettaur
-- faces. The normal enemy turn loop calls this once; no client battle AI is
-- involved. First try to align with the target by moving to a nearby valid
-- enemy-owned panel, then always play the attack (a miss still has visuals).
local function aligned_shockwave_direction(x, y, target_x, target_y)
    local dx, dy = target_x - x, target_y - y
    if dx == 0 and dy < 0 and -dy <= SHOCKWAVE_RANGE then
        return Direction.UP_RIGHT, -dy
    elseif dx == 0 and dy > 0 and dy <= SHOCKWAVE_RANGE then
        return Direction.DOWN_LEFT, dy
    elseif dy == 0 and dx < 0 and -dx <= SHOCKWAVE_RANGE then
        return Direction.UP_LEFT, -dx
    elseif dy == 0 and dx > 0 and dx <= SHOCKWAVE_RANGE then
        return Direction.DOWN_RIGHT, dx
    end
    return nil, nil
end

local function find_shockwave_firing_position(self, target)
    local tx = math.floor(target.x)
    local ty = math.floor(target.y)
    local best, best_score

    -- Reposition by at most two tiles per turn. EnemyHelpers.move already
    -- handles teleport animation and enemy bot facing/scale restoration.
    for offset_y = -2, 2 do
        for offset_x = -2, 2 do
            local x = self.x + offset_x
            local y = self.y + offset_y
            local direction, distance = aligned_shockwave_direction(x, y, tx, ty)
            if direction then
                local movable = (offset_x == 0 and offset_y == 0)
                    or EnemyHelpers.can_move_to(self.instance, x, y, self.z, self)
                if movable then
                    local travel = SHOCKWAVE_DIRECTION[direction]
                    local clear = true
                    for step = 1, distance do
                        if not has_terrain_tile(self.instance,
                            x + travel.dx * step, y + travel.dy * step, self.z) then
                            clear = false
                            break
                        end
                    end
                    if clear then
                        local travel_distance = math.abs(offset_x) + math.abs(offset_y)
                        local score = travel_distance * 10 + distance
                        if best_score == nil or score < best_score then
                            best = { x = x, y = y, direction = direction }
                            best_score = score
                        end
                    end
                end
            end
        end
    end
    return best
end

function EnemyTemplates.ai.shockwave_line(self)
    local co = coroutine.create(function()
        local closest = EnemyHelpers.find_closest_player_session(self.instance, self)
        if not closest or not closest.player then return end
        local target = closest.player
        local firing_position = find_shockwave_firing_position(self, target)

        if firing_position and
            (firing_position.x ~= self.x or firing_position.y ~= self.y) then
            Async.await(EnemyHelpers.move(self.instance, self,
                firing_position.x, firing_position.y, self.z,
                firing_position.direction))
        end

        -- If an aligned firing position exists, use that exact axis. When
        -- no such position is reachable, launch toward the nearest player
        -- anyway: don't silently skip the turn just because the player is
        -- outside the three-tile hitbox.
        local direction
        if firing_position then
            direction = firing_position.direction
            Net.set_bot_direction(self.id, direction)
        else
            EnemyHelpers.face_position(self, target.x, target.y)
            direction = Net.get_bot_direction(self.id)
        end
        local travel = SHOCKWAVE_DIRECTION[direction]
        if not travel then return end
        self.direction = direction
        self.selection:move(self, direction)

        self.selection:indicate()
        Async.await(Async.sleep(0.5))

        local caught_sessions = self.selection:detect_player_sessions()
        EnemyHelpers.play_attack_animation(self)
        -- Net.animate_bot initiates the animation without awaiting its frames.
        -- Complete Mettaur's entire directional pickaxe swing before spawning
        -- shockwaves. The attack remains within the same enemy turn.
        Async.await(Async.sleep(METTAUR_ATTACK_ANIMATION_SECONDS))

        -- Start Guard interception when the shockwave begins, not at the start
        -- of the wind-up; otherwise the Guard can return before impact.
        local records = nil
        if #caught_sessions > 0 then
            records = GuardInterception.prepare_attack(
                self.instance, self, caught_sessions,
                SHOCKWAVE_RANGE * SHOCKWAVE_STEP_SECONDS)
        end

        local spawned_bots = {}
        for distance = 1, SHOCKWAVE_RANGE do
            local x = self.x + travel.dx * distance
            local y = self.y + travel.dy * distance
            if not has_terrain_tile(self.instance, x, y, self.z) then
                break
            end
            local bot_id = Net.create_bot({
                texture_path = SHOCKWAVE_TEXTURE,
                animation_path = SHOCKWAVE_ANIMATION,
                animation = "SHOCKWAVE_" .. travel.suffix,
                direction = direction,
                area_id = self.instance.area_id,
                warp_in = false,
                x = x + 0.5,
                y = y + 0.5,
                z = self.z,
            })
            if bot_id then
                spawned_bots[#spawned_bots + 1] = bot_id
            end
            Async.await(Async.sleep(SHOCKWAVE_STEP_SECONDS))
        end

        if records then
            GuardInterception.apply_damage(records, self.attack_damage or 20, self)
            GuardInterception.finish_attack(self.instance, records)
        end

        local remaining = 0
        for _, duration in ipairs(SHOCKWAVE_FRAME_SECONDS) do
            remaining = remaining + duration
        end
        Async.await(Async.sleep(remaining))
        for _, bot_id in ipairs(spawned_bots) do
            Net.remove_bot(bot_id, false)
        end
        self.selection:remove_indicators()
    end)
    return Async.promisify(co)
end

-- Register the assets before an instance clones/preloads its area. This is
-- deliberately done at module load, rather than only when Mettaur spawns.
Preloader.add_asset(SHOCKWAVE_TEXTURE)
Preloader.add_asset(SHOCKWAVE_ANIMATION)
-- Registration occurs before instances clone their areas; supplying both
-- files here lets the OW bot use its new skin immediately on spawn.
Preloader.add_asset(METTAUR_OW_TEXTURE)
Preloader.add_asset(METTAUR_OW_ANIMATION)

EnemyTemplates.register("Mettaur", {
    battle_name = "Mettaur",
    default_ow_bot_encounter_name = "Mettaur",
    is_special_encounter = true,
    -- Matches the registered V1 Mettaur character mod's base health.
    health = 40,
    max_health = 40,
    -- Native-resolution Mettaur overworld sheet (four directional idle/attack
    -- states). The client-side battle character is configured separately.
    texture_path = METTAUR_OW_TEXTURE,
    animation_path = METTAUR_OW_ANIMATION,
    ai_type = "shockwave_line",
    attack_damage = 20,
    attack_texture = SHOCKWAVE_TEXTURE,
    attack_animation_path = SHOCKWAVE_ANIMATION,
    -- 1x3 unbroken line forward. The Selection module rotates it for each
    -- of UL, UR, DR and DL; this is not a square/AOE attack.
    shape = { {1}, {1}, {1} },
    shape_offset_x = 0,
    shape_offset_y = 0,
})

return EnemyTemplates