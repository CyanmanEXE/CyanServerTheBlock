-- ShadeMan's active Liberation overworld ambush AI.
-- Restores the behavior of enemies/shademan.lua for template-spawned bots.
-- The existing sprite has downward ATTACK_DL/ATTACK_DR states only.
local EnemyHelpers = require("scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers")
local GuardInterception = require("scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception")
local Direction = require("scripts/libs/direction")

local MAX_TARGET_RANGE = 10
local ATTACK_ANIMATION_SECONDS = 0.167 + 0.067 + 0.133
local ATTACK_HOLD_SECONDS = 0.20
local ATTACK_RECOVERY_SECONDS = 0.20

local function usable_warp_tile(self, x, y, z)
    if EnemyHelpers.is_occupied_by_enemy(self.instance, x, y, z, self) then
        return false
    end
    for _, session in pairs(self.instance.player_sessions or {}) do
        local p = session and session.player
        if p and math.floor(p.x) == x and math.floor(p.y) == y
            and math.floor(p.z) == z then
            return false
        end
    end
    local ok, tile = pcall(Net.get_tile, self.instance.area_id, x, y, z)
    return ok and type(tile) == "table" and tonumber(tile.gid) and tile.gid > 0
end

local function find_ambush_position(self, player)
    local tx, ty, tz = math.floor(player.x), math.floor(player.y), math.floor(player.z)
    -- The sprite contains only the downward-facing attack poses. Approach
    -- from above (DOWN_LEFT) or from left (DOWN_RIGHT), never from below.
    local candidates = {
        {x = tx, y = ty - 1, z = tz, direction = Direction.DOWN_LEFT, suffix = "DL"},
        {x = tx - 1, y = ty, z = tz, direction = Direction.DOWN_RIGHT, suffix = "DR"},
    }
    for _, candidate in ipairs(candidates) do
        if usable_warp_tile(self, candidate.x, candidate.y, candidate.z) then
            return candidate
        end
    end
    return nil
end

return function(EnemyTemplates)
    function EnemyTemplates.ai.shademan_ambush(self)
        return Async.promisify(coroutine.create(function()
            local target = EnemyHelpers.find_closest_player_session(self.instance, self)
            if not target or not target.player then return end
            if EnemyHelpers.chebyshev_tile_distance(self, target.player.x, target.player.y) > MAX_TARGET_RANGE then
                return
            end

            local destination = find_ambush_position(self, target.player)
            if not destination then
                print("[Liberation][ShadeMan][OW] No safe downward-facing ambush tile")
                return
            end

            local original = {
                x = self.x, y = self.y, z = self.z,
                direction = Net.get_bot_direction(self.id),
            }
            print("[Liberation][ShadeMan][OW] AMBUSH_BEGIN", self.id,
                "target", target.player.id, "warp", destination.x, destination.y)

            -- Legacy ShadeMan selects the player's panel, not its own tile.
            -- The { {1} }, (0,-1) selection shape resolves to its anchor tile.
            Async.await(EnemyHelpers.move(self.instance, self,
                destination.x, destination.y, destination.z, destination.direction))
            self.selection:move(target.player, Direction.None)
            local caught = self.selection:detect_player_sessions()
            if #caught > 0 then
                self.selection:indicate()
                local records = GuardInterception.prepare_attack(self.instance, self, caught, 0.5)
                -- The existing ATTACK_DL/DR animations each contain 3 frames.
                -- Play all 3 frames; the final frame stays active until we
                -- explicitly return to IDLE after impact and recovery.
                local suffix = destination.suffix
                print("[Liberation][ShadeMan][OW] ATTACK_ANIMATION", self.id, "ATTACK_" .. suffix)
                Net.animate_bot(self.id, "ATTACK_" .. suffix, false)
                Async.await(Async.sleep(ATTACK_ANIMATION_SECONDS))
                -- The third ATTACK frame stays visible in the same animation
                -- through impact/recovery (see shademan.animation). Do NOT
                -- switch to the nonstandard ATTACK_*_HOLD state: a client
                -- using its original animation file may show the whole sheet.
                Async.await(Async.sleep(ATTACK_HOLD_SECONDS))
                GuardInterception.apply_damage(records, self.attack_damage or 60, self)
                GuardInterception.finish_attack(self.instance, records)
                Async.await(Async.sleep(ATTACK_RECOVERY_SECONDS))
                self.selection:remove_indicators()
                Net.set_bot_direction(self.id, destination.direction)
                print("[Liberation][ShadeMan][OW] IMPACT", self.id, "targets", #caught)
            else
                Net.set_bot_direction(self.id, destination.direction)
                print("[Liberation][ShadeMan][OW] Target moved before attack", self.id)
            end

            Async.await(EnemyHelpers.move(self.instance, self,
                original.x, original.y, original.z, original.direction))
            print("[Liberation][ShadeMan][OW] AMBUSH_END", self.id)
        end))
    end
end
