-- Roll OW combat: ShadeMan-style warp, directional whip, then a heart heal.
-- Works only with real mission enemy panels; Tiled picks the Roll template.
local EnemyHelpers = require('scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers')
local Runtime = require('scripts/ezlibs-custom/nebulous-liberations/liberations/ai/attack_runtime')
local Direction = require('scripts/libs/direction')

local PREFIX = '/server/assets/ezlibs-custom/nebulous-liberations/bots/'
local SUFFIX = {
    [Direction.UP_LEFT]='UL', [Direction.UP_RIGHT]='UR',
    [Direction.DOWN_LEFT]='DL', [Direction.DOWN_RIGHT]='DR',
}
local OFFSETS = {{-1,0},{0,-1},{1,0},{0,1},{-1,-1},{1,-1},{-1,1},{1,1}}
local function valid_target(enemy)
    return enemy and enemy.id and tonumber(enemy.max_health)
        and tonumber(enemy.health) and enemy.health > 0
        and enemy.max_health > enemy.health
end
local function choose_heal_target(self)
    local best, best_distance
    for _, panel in ipairs(self.instance.dark_holes or {}) do
        local ally = panel and panel.enemy
        if ally and ally ~= self and valid_target(ally) and ally.z == self.z then
            local d = math.abs(ally.x-self.x)+math.abs(ally.y-self.y)
            if not best_distance or d < best_distance then
                best, best_distance = ally,d
            end
        end
    end
    if best then return best end
    if valid_target(self) then return self end
    return nil
end
local function safe_tile(self,x,y,z)
    -- ShadeMan's ambush permits any solid destination tile, not only Dark Panels.
    -- Roll uses the same rule for a real warp rather than normal movement.
    if EnemyHelpers.is_occupied_by_enemy(self.instance,x,y,z,self) then return false end
    local ok,tile=pcall(Net.get_tile,self.instance.area_id,x,y,z)
    if not ok or type(tile)~='table' or (tonumber(tile.gid) or 0)<=0 then return false end
    for _,session in pairs(self.instance.player_sessions or {}) do
        local p=session and session.player
        if p and math.floor(p.x)==x and math.floor(p.y)==y and math.floor(p.z)==z then
            return false
        end
    end
    return true
end
local function warp_near(self, dest)
    local tx,ty,tz=math.floor(dest.x),math.floor(dest.y),math.floor(dest.z)
    local best,dist
    for _,d in ipairs(OFFSETS) do
        local x,y=tx+d[1],ty+d[2]
        if safe_tile(self,x,y,tz) then
            local len=math.abs(self.x-x)+math.abs(self.y-y)
            if not dist or len<dist then best={x=x,y=y,z=tz};dist=len end
        end
    end
    if not best then return false end
    local dir=Direction.diagonal_from_offset(dest.x-best.x-.5,dest.y-best.y-.5)
    Async.await(EnemyHelpers.move(self.instance,self,best.x,best.y,best.z,dir))
    return true
end
local function face(self, position)
    local d=Direction.diagonal_from_offset(position.x-self.x-.5,position.y-self.y-.5)
    if SUFFIX[d] then
        Net.set_bot_direction(self.id,d)
        self.direction=d
    end
    return d
end
local function play_body(self, state, dir)
    local suffix=SUFFIX[dir]
    if suffix then Net.animate_bot(self.id,state..'_'..suffix,false) end
end
local function spawn_whip(self,target,dir)
    local suffix=SUFFIX[dir]
    if not suffix then return nil end
    return Runtime.spawn_effect(self,{
        texture_path=PREFIX..'attacks/roll_whip.png',
        animation_path=PREFIX..'attacks/roll_whip.animation',
        animation='ROLL_WHIP_'..suffix,
        area_id=self.instance.area_id,direction=dir,warp_in=false,
        x=math.floor(target.x)+.5,y=math.floor(target.y)+.5,z=math.floor(target.z),
    })
end
local function heart_effect(self, target)
    return Runtime.spawn_effect(self,{
        texture_path=PREFIX..'item.png',animation_path=PREFIX..'item.animation',
        animation='HEART',area_id=self.instance.area_id,
        warp_in=false,x=target.x+.5,y=target.y+.5,z=target.z,
    })
end
local function whip_attack(self)
    local target=EnemyHelpers.find_closest_player_session(self.instance,self)
    if not target or not target.player then return end
    local p=target.player
    if EnemyHelpers.chebyshev_tile_distance(self,p.x,p.y)>10 then return end
    if not warp_near(self,p) then return end
    local dir=face(self,p)
    self.selection:set_shape({{1}},0,0)
    self.selection:move(p,Direction.None)
    Runtime.begin_telegraph(self.selection)
    play_body(self,'ATTACK',dir)
    Async.await(Async.sleep(0.18))
    local effect=spawn_whip(self,p,dir)
    -- Client visual duration plus guard preparation. Recheck tile at impact.
    local caught=self.selection:detect_player_sessions()
    local records=#caught>0 and Runtime.prepare(self,caught,0.28) or nil
    Async.await(Async.sleep(0.28))
    local live=self.selection:detect_player_sessions()
    local eligible={}
    for _,s in ipairs(live) do if s.player then eligible[s.player.id]=true end end
    local hits={}
    for _,record in ipairs(records or {}) do
        local session=record.original_session
        if session and session.player and eligible[session.player.id] then
            hits[#hits+1]=record
        end
    end
    if #hits>0 then Runtime.impact(self,hits,self.attack_damage or 18)
    elseif records then Runtime.finish_empty(self) end
    if effect then Runtime.remove_effect(effect) end
    Runtime.end_telegraph(self.selection)
    play_body(self,'IDLE',dir)
end
local function heal_ally(self)
    local ally=choose_heal_target(self)
    if not ally then return end
    local target_pos={x=ally.x+.5,y=ally.y+.5,z=ally.z}
    if ally~=self then warp_near(self,target_pos) end
    local dir=face(self,target_pos)
    play_body(self,'HEAL',dir)
    local heart=heart_effect(self,ally)
    Async.await(Async.sleep(0.32))
    local amount=math.ceil(tonumber(ally.max_health)*0.10)
    print('[NL_AI][ROLL_HEART]',tostring(self.id),'target',tostring(ally.template_name),
        'amount',amount,'max',ally.max_health)
    Async.await(EnemyHelpers.heal(ally,amount))
    if heart then Runtime.remove_effect(heart) end
    play_body(self,'IDLE',dir)
end
return function(EnemyTemplates)
    function EnemyTemplates.ai.roll_heart_whip(self)
        return Async.promisify(coroutine.create(function()
            if not self or not self.id or not self.instance then return end
            local original={x=self.x,y=self.y,z=self.z,direction=Net.get_bot_direction(self.id)}
            whip_attack(self)
            heal_ally(self)
            if self.x~=original.x or self.y~=original.y or self.z~=original.z then
                -- Existing ShadeMan teleport sequence preserves OW scale and HP indicators.
                Async.await(EnemyHelpers.move(self.instance,self,original.x,original.y,
                    original.z,original.direction))
            end
            self.selection:remove_indicators()
        end))
    end
end
