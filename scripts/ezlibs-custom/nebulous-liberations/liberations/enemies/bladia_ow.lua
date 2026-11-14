-- Bladia overworld AI; compatible with Bot Config AI Type = ranged.
-- Uses only existing helper/selection/guard APIs and native animation states.
local Helpers = require('scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers')
local Guard = require('scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception')
local Direction = require('scripts/libs/direction')

local function valid_target(self, session)
    return session and session.player and tonumber(session.health) and session.health > 0
        and math.floor(session.player.z) == math.floor(self.z)
end

local function distance(self, player)
    return math.max(math.abs(self.x - math.floor(player.x)),
        math.abs(self.y - math.floor(player.y)))
end

local function maybe_move_closer(self, player)
    local current_distance = distance(self, player)
    if current_distance <= 2 then return false end
    local best, best_distance = nil, current_distance
    local tx, ty = math.floor(player.x), math.floor(player.y)
    for dx = -2, 2 do
        for dy = -2, 2 do
            if math.max(math.abs(dx), math.abs(dy)) <= 2 and (dx ~= 0 or dy ~= 0) then
                local nx, ny = self.x + dx, self.y + dy
                local dist = math.max(math.abs(nx - tx), math.abs(ny - ty))
                if dist < best_distance and Helpers.can_move_to(self.instance,nx,ny,self.z,self) then
                    best, best_distance = {x=nx,y=ny},dist
                end
            end
        end
    end
    if not best then return false end
    print('[Liberation][Bladia][OW] APPROACH', tostring(self.id),
        self.x, self.y, 'to', best.x, best.y, 'target', tx, ty)
    local facing = Direction.diagonal_from_offset(player.x - (best.x + 0.5),
        player.y - (best.y + 0.5))
    Async.await(Helpers.move(self.instance,self,best.x,best.y,self.z,facing))
    return true
end

return function(Templates)
    function Templates.ai.bladia_strike(self)
        return Async.promisify(coroutine.create(function()
            local target = Helpers.find_closest_player_session(self.instance,self)
            if not valid_target(self,target) then
                print('[Liberation][Bladia][OW] NO_TARGET',tostring(self.id))
                return
            end
            local player = target.player
            if distance(self,player)>2 then
                maybe_move_closer(self,player)
            end
            if not valid_target(self,target) or distance(self,player)>2 then
                print('[Liberation][Bladia][OW] OUT_OF_RANGE',tostring(self.id),
                    'distance',distance(self,player))
                return
            end
            Helpers.face_position(self,player.x,player.y)
            -- The selection's 1-tile shape uses shape_offset_y=-1, so an
            -- anchor on the target tile is required. No Direction.None enum
            -- exists; nil invokes its normal unrotated shape.
            self.selection:move(player,nil)
            local caught=self.selection:detect_player_sessions()
            if #caught==0 then
                print('[Liberation][Bladia][OW] NO_PANEL_HIT',tostring(self.id))
                return
            end
            print('[Liberation][Bladia][OW] STRIKE_BEGIN',tostring(self.id),
                'targets',#caught,'direction',tostring(Net.get_bot_direction(self.id)))
            self.selection:indicate()
            local records=Guard.prepare_attack(self.instance,self,caught,0.35)
            Helpers.play_attack_animation(self)
            Async.await(Async.sleep(0.35))
            Guard.apply_damage(records,self.attack_damage or 25,self)
            Guard.finish_attack(self.instance,records)
            -- A longer last attack frame in bladia.animation keeps the
            -- pose active until damage/guard handling has completed.
            Async.await(Async.sleep(0.30))
            self.selection:remove_indicators()
            local dir=Net.get_bot_direction(self.id)
            local suffix=({[Direction.UP_LEFT]='UL',[Direction.UP_RIGHT]='UR',
                [Direction.DOWN_LEFT]='DL',[Direction.DOWN_RIGHT]='DR'})[dir]
            if suffix then Net.animate_bot(self.id,'IDLE_'..suffix) end
            print('[Liberation][Bladia][OW] STRIKE_END',tostring(self.id))
        end))
    end
end
