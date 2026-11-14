-- Liberation Bladia overworld attack. Uses the attack states already present
-- in bots/npcs/bladia.animation, and only strikes an actual nearby player.
local Helpers = require("scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers")
local Guard = require("scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception")
local Direction = require("scripts/libs/direction")

return function(Templates)
    function Templates.ai.bladia_strike(self)
        return Async.promisify(coroutine.create(function()
            local target = Helpers.find_closest_player_session(self.instance, self)
            if not target or not target.player or
                Helpers.chebyshev_tile_distance(self, target.player.x, target.player.y) > 2 then
                return
            end
            -- Select the targeted player's tile. The default shape is 1 tile;
            -- this AI should not animate and attack empty space.
            Helpers.face_position(self, target.player.x, target.player.y)
            self.selection:move(target.player, Direction.None)
            local caught = self.selection:detect_player_sessions()
            if #caught == 0 then return end
            print('[Liberation][Bladia][OW] STRIKE_BEGIN', tostring(self.id), 'targets', #caught)
            self.selection:indicate()
            local records = Guard.prepare_attack(self.instance, self, caught, 0.35)
            Helpers.play_attack_animation(self) -- ATTACK_DL/DR/UL/UR exist
            -- Four sprite frames: 0.167 + 0.05 + 0.05 + 0.167 seconds.
            Async.await(Async.sleep(0.434))
            Guard.apply_damage(records, self.attack_damage or 25, self)
            Guard.finish_attack(self.instance, records)
            -- Let the attack conclude before the next turn; the engine's
            -- ordinary directional idle will resume after the one-shot.
            Async.await(Async.sleep(0.15))
            self.selection:remove_indicators()
            print('[Liberation][Bladia][OW] STRIKE_END', tostring(self.id))
        end))
    end
end
