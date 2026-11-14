-- Mettaur overworld template and directional shockwave AI.
-- Registered by enemy_templates.lua after its shared AI helpers are defined.
-- No separate enemy constructor: EnemyTemplates.create handles instance lifecycle.
local EnemyHelpers = require("scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers")
local GuardInterception = require("scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception")
local Direction = require("scripts/libs/direction")

return function(EnemyTemplates)
-- Mettaur's overworld shockwave attack. This uses the Liberation selection
-- system, not the client-side Mettaur battle mod. The selection is a straight
-- three-tile line in the bot's current isometric direction.
-- These overworld sprites use the native 48x56 animation frames and are
-- intentionally NOT resized to BigBrute's previous bot appearance.
local METTAUR_OW_TEXTURE = "/server/assets/ezlibs-custom/nebulous-liberations/bots/npcs/mettaur_ow.png"
local METTAUR_OW_ANIMATION = "/server/assets/ezlibs-custom/nebulous-liberations/bots/npcs/mettaur_ow.animation"
local SHOCKWAVE_TEXTURE = "/server/assets/ezlibs-custom/nebulous-liberations/bots/attacks/shockwave.png"
local SHOCKWAVE_ANIMATION = "/server/assets/ezlibs-custom/nebulous-liberations/bots/attacks/shockwave.animation"
local SHOCKWAVE_DIRECTION = {
    [Direction.UP_LEFT] = { suffix = "UL", dx = -1, dy = 0 },
    [Direction.UP_RIGHT] = { suffix = "UR", dx = 0, dy = -1 },
    [Direction.DOWN_RIGHT] = { suffix = "DR", dx = 1, dy = 0 },
    [Direction.DOWN_LEFT] = { suffix = "DL", dx = 0, dy = 1 },
}
local SHOCKWAVE_RANGE = 3
local SHOCKWAVE_STEP_SECONDS = 0.24
-- All four ATTACK_* states in mettaur_ow.animation total 0.83s.
-- Switch to the authored HOLD_* frame just BEFORE that state expires so
-- there is no one-frame return to IDLE between swing and shockwave.
local METTAUR_ATTACK_ANIMATION_SECONDS = 0.82

local function has_terrain_tile(instance, x, y, z)
    -- Net.get_tile can fail outside the map, so guard against the end of a
    -- straight line reaching the map boundary.
    local ok, tile = pcall(Net.get_tile, instance.area_id, x, y, z)
    return ok and type(tile) == "table" and type(tile.gid) == "number" and tile.gid > 0
end

-- A shockwave is one straight three-tile ray in the direction the Mettaur
-- faces. The normal enemy turn loop calls this once; no client battle AI is
-- involved. Try to align with ANY active player by using a nearby valid
-- enemy-owned panel; skip the attack if no target can actually be hit.
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

-- Evaluate ALL active players, not only the nearest: an adjacent player
-- can be off-axis while a different player is reachable with a shockwave.
local function find_shockwave_firing_position(self)
    local best, best_score
    for _, session in pairs(self.instance.player_sessions or {}) do
        local target = session and session.player
        if session and (session.health or 0) > 0 and target
            and math.floor(target.z) == math.floor(self.z) then
            local tx, ty = math.floor(target.x), math.floor(target.y)
            for offset_y = -2, 2 do
                for offset_x = -2, 2 do
                    local x, y = self.x + offset_x, self.y + offset_y
                    local direction, distance = aligned_shockwave_direction(x, y, tx, ty)
                    if direction then
                        local movable = (offset_x == 0 and offset_y == 0)
                            or EnemyHelpers.can_move_to(self.instance, x, y, self.z, self)
                        if movable then
                            local travel = SHOCKWAVE_DIRECTION[direction]
                            local clear = true
                            for step = 1, distance do
                                if not has_terrain_tile(self.instance,
                                    x + travel.dx * step,
                                    y + travel.dy * step, self.z) then
                                    clear = false
                                    break
                                end
                            end
                            if clear then
                                local score = (math.abs(offset_x) + math.abs(offset_y)) * 10 + distance
                                if best_score == nil or score < best_score then
                                    best = { x = x, y = y, direction = direction }
                                    best_score = score
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return best
end

local function sessions_at_shockwave_step(self, direction, sessions)
    local groups = {}
    local travel = SHOCKWAVE_DIRECTION[direction]
    if not travel then return groups end
    for _, session in ipairs(sessions) do
        local player = session.player
        if player and math.floor(player.z) == self.z then
            local dx = math.floor(player.x) - self.x
            local dy = math.floor(player.y) - self.y
            local step
            if travel.dx ~= 0 and dy == 0 then
                step = dx / travel.dx
            elseif travel.dy ~= 0 and dx == 0 then
                step = dy / travel.dy
            end
            if step and step >= 1 and step <= SHOCKWAVE_RANGE
                and step == math.floor(step) then
                groups[step] = groups[step] or {}
                groups[step][#groups[step] + 1] = session
            end
        end
    end
    return groups
end

function EnemyTemplates.ai.shockwave_line(self)
    local co = coroutine.create(function()
        local firing_position = find_shockwave_firing_position(self)
        if not firing_position then
            -- No reachable player in a three-panel ray: DO NOT attack.
            return
        end
        local direction = firing_position.direction
        local travel = SHOCKWAVE_DIRECTION[direction]
        if firing_position.x ~= self.x or firing_position.y ~= self.y then
            Async.await(EnemyHelpers.move(self.instance, self,
                firing_position.x, firing_position.y, self.z, direction))
        end
        Net.set_bot_direction(self.id, direction)
        self.direction = direction
        self.selection:move(self, direction)
        if #self.selection:detect_player_sessions() == 0 then return end

        self.selection:indicate()
        Async.await(Async.sleep(0.5))
        local caught_sessions = self.selection:detect_player_sessions()
        if #caught_sessions == 0 then
            self.selection:remove_indicators()
            return
        end

        EnemyHelpers.play_attack_animation(self)
        Async.await(Async.sleep(METTAUR_ATTACK_ANIMATION_SECONDS))
        EnemyHelpers.hold_attack_animation(self)

        local groups = sessions_at_shockwave_step(self, direction, caught_sessions)
        local records_by_step = {}
        for step = 1, SHOCKWAVE_RANGE do
            if groups[step] then
                records_by_step[step] = GuardInterception.prepare_attack(
                    self.instance, self, groups[step], step * SHOCKWAVE_STEP_SECONDS)
            end
        end

        -- One projectile, transferred to each consecutive panel. The prior
        -- version created three persistent sprites that overlapped visually.
        local projectile_id
        for step = 1, SHOCKWAVE_RANGE do
            local x, y = self.x + travel.dx * step, self.y + travel.dy * step
            if not has_terrain_tile(self.instance, x, y, self.z) then break end
            if not projectile_id then
                projectile_id = Net.create_bot({
                    texture_path = SHOCKWAVE_TEXTURE,
                    animation_path = SHOCKWAVE_ANIMATION,
                    animation = "SHOCKWAVE_" .. travel.suffix,
                    direction = direction,
                    area_id = self.instance.area_id,
                    warp_in = false,
                    x = x + 0.5, y = y + 0.5, z = self.z,
                })
            else
                Net.transfer_bot(projectile_id, self.instance.area_id, false,
                    x + 0.5, y + 0.5, self.z)
                Net.animate_bot(projectile_id, "SHOCKWAVE_" .. travel.suffix)
            end
            Async.await(Async.sleep(SHOCKWAVE_STEP_SECONDS))
            local records = records_by_step[step]
            if records then
                GuardInterception.apply_damage(records, self.attack_damage or 20, self)
                GuardInterception.finish_attack(self.instance, records)
            end
        end
        if projectile_id then Net.remove_bot(projectile_id, false) end
        EnemyHelpers.finish_attack_animation(self)
        self.selection:remove_indicators()
    end)
    return Async.promisify(co)
end

-- The v3 mission preloader supplies these paths from this template's
-- texture_path/animation_path and attack_texture/attack_animation_path.
-- Do not register them as shared assets: that would provision Mettaur to
-- every Liberation mission, including maps with no Mettaurs.

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
    attack_animation_seconds = 0.83,
    has_attack_animation = true,
    has_attack_hold = true,
    attack_texture = SHOCKWAVE_TEXTURE,
    attack_animation_path = SHOCKWAVE_ANIMATION,
    -- 1x3 unbroken line forward. The Selection module rotates it for each
    -- of UL, UR, DR and DL; this is not a square/AOE attack.
    shape = { {1}, {1}, {1} },
    shape_offset_x = 0,
    shape_offset_y = 0,
})


end
