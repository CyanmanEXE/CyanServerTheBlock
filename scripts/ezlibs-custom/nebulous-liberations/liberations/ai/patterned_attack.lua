-- Data-driven Liberation OW attack runner. Uses existing Net, Async, Selection,
-- EnemyHelpers and GuardInterception APIs; no battle mod hooks are changed.
-- Shapes are relative to UP_RIGHT and rotated by Selection itself.
local EnemyHelpers = require("scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_helpers")
local Guard = require("scripts/ezlibs-custom/nebulous-liberations/liberations/guard_interception")
local Runtime = require("scripts/ezlibs-custom/nebulous-liberations/liberations/ai/attack_runtime")
local Direction = require("scripts/libs/direction")
local Attack = {}
local root = "/server/assets/ezlibs-custom/nebulous-liberations/bots/attacks/"
local DIR = {
    [Direction.UP_LEFT] = { suffix = "UL", dx = -1, dy = 0 },
    [Direction.UP_RIGHT] = { suffix = "UR", dx = 0, dy = -1 },
    [Direction.DOWN_LEFT] = { suffix = "DL", dx = 0, dy = 1 },
    [Direction.DOWN_RIGHT] = { suffix = "DR", dx = 1, dy = 0 },
}
local DIRECTIONS = {Direction.UP_LEFT, Direction.UP_RIGHT, Direction.DOWN_LEFT, Direction.DOWN_RIGHT}

local function positive(value, fallback)
    value = tonumber(value)
    return value and value > 0 and value < math.huge and value or fallback
end

-- Shape grammar: line, arc, cone, cross, diamond, or explicit odd-width row matrices.
-- "range" counts forward tiles; "step" may change between animation phases.
function Attack.make_shape(stage)
    if type(stage.shape) == "table" then
        return stage.shape, tonumber(stage.offset_x) or 0, tonumber(stage.offset_y) or 0
    end
    local kind = stage.shape_type or "line"
    local range = math.min(8, math.floor(positive(stage.range, 1)))
    if kind == "line" or kind == "ray" then
        local rows = {}
        for i = 1, range do rows[i] = {1} end
        return rows, 0, tonumber(stage.offset_y) or 0
    elseif kind == "arc" then
        return {{1,1,1}}, 0, tonumber(stage.offset_y) or 0
    elseif kind == "cone" then
        local rows = {}
        for i = 1, range do
            rows[i] = {}
            for j = 1, i * 2 - 1 do rows[i][j] = 1 end
        end
        return rows, 0, tonumber(stage.offset_y) or 0
    elseif kind == "cross" then
        return {{0,1,0},{1,1,1},{0,1,0}}, 0, tonumber(stage.offset_y) or 0
    elseif kind == "diamond" then
        return {{0,1,0},{1,1,1},{0,1,0}}, 0, tonumber(stage.offset_y) or 0
    end
    return {{1}}, 0, 0
end

local function expanded_stages(profile)
    local stages={}
    for _, item in ipairs(profile.stages or {}) do
        if item.motion == "travel" then
            local n = math.min(8,math.floor(positive(item.range, 1)))
            for distance=1,n do
                local stage={}
                for k,v in pairs(item) do stage[k]=v end
                stage.shape_type="line";stage.range=1
                stage.offset_y=distance-1;stage.distance=distance
                stages[#stages+1]=stage
            end
        else
            stages[#stages+1]=item
        end
    end
    return stages
end
Attack.expanded_stages = expanded_stages

local function has_terrain(instance,x,y,z)
    local ok,tile=pcall(Net.get_tile,instance.area_id,x,y,z)
    return ok and type(tile)=="table" and tonumber(tile.gid) and tile.gid>0
end

local function set_stage(enemy, stage, direction, pos)
    local shape,ox,oy=Attack.make_shape(stage)
    enemy.selection:set_shape(shape,ox,oy)
    enemy.selection:move(pos or enemy,direction)
end

local function hits_target(enemy, target, stage, direction, x,y)
    set_stage(enemy,stage,direction,{x=x,y=y,z=enemy.z})
    return enemy.selection.selection:is_within(target.x,target.y,target.z)
end

-- An enemy only chooses a move that yields a real hit (no wasted aiming at air).
-- Movement policy: stationary, approach, or reposition, using existing territory checks.
function Attack.choose_plan(enemy, profile, stages)
    local movement = profile.movement or {}
    local max_move = math.max(0, math.min(3, math.floor(tonumber(movement.tiles) or 0)))
    if movement.mode == "stationary" then max_move=0 end
    local candidates={{x=enemy.x,y=enemy.y,steps=0}}
    for dx=-max_move,max_move do
        for dy=-max_move,max_move do
            local steps=math.abs(dx)+math.abs(dy)
            if steps>0 and steps<=max_move then
                local x,y=enemy.x+dx,enemy.y+dy
                if EnemyHelpers.can_move_to(enemy.instance,x,y,enemy.z,enemy) then
                    candidates[#candidates+1]={x=x,y=y,steps=steps}
                end
            end
        end
    end
    local best=nil
    for _,session in pairs(enemy.instance.player_sessions or {}) do
        local target=session.player
        if target and tonumber(session.health) and session.health>0
           and math.floor(target.z)==enemy.z then
            for _,c in ipairs(candidates) do
                for _,direction in ipairs(DIRECTIONS) do
                    for _,stage in ipairs(stages) do
                        if hits_target(enemy,target,stage,direction,c.x,c.y) then
                            local score=c.steps*10
                            if movement.mode=="approach" then
                                score=score+math.abs(c.x-math.floor(target.x))+math.abs(c.y-math.floor(target.y))
                            end
                            if not best or score<best.score then
                                best={x=c.x,y=c.y,direction=direction,score=score,session=session}
                            end
                        end
                    end
                end
            end
        end
    end
    return best
end

local function effect_name(enemy,stage)
    return stage.effect or (enemy.attack_profile and enemy.attack_profile.effect)
end
local function effect_spawn(enemy,stage,direction,x,y)
    local named=effect_name(enemy,stage)
    if not named or not DIR[direction] then return nil end
    local path=root..named
    return Runtime.spawn_effect(enemy, {
        texture_path=path..".png",animation_path=path..".animation",
        animation=(stage.state or named:upper()).."_"..DIR[direction].suffix,
        direction=direction,area_id=enemy.instance.area_id,warp_in=false,
        x=x+0.5,y=y+0.5,z=enemy.z,
    })
end

local function stage_cells(enemy)
    local cells={}
    for _,obj in ipairs(enemy.selection.selection.objects or {}) do
        local x,y=math.floor(obj.x),math.floor(obj.y)
        if has_terrain(enemy.instance,x,y,enemy.z) then
            cells[#cells+1]={x=x,y=y,z=enemy.z}
        end
    end
    return cells
end

local function animate_enemy(enemy, state, direction)
    local suffix=DIR[direction] and DIR[direction].suffix
    if not suffix or not enemy.id then return end
    local animation=state.."_"..suffix
    Net.animate_bot(enemy.id,animation)
end

function Attack.take_turn(enemy)
    local co=coroutine.create(function()
        if not enemy or not enemy.id or not enemy.instance then return end
        local profile=enemy.attack_profile
        if type(profile)~="table" then return end
        local stages=expanded_stages(profile)
        if #stages==0 then return end
        local chosen=Attack.choose_plan(enemy,profile,stages)
        -- No hittable player = no attack (as requested for Mettaurs too).
        if not chosen then return end
        if chosen.x~=enemy.x or chosen.y~=enemy.y then
            -- Patterned enemies slide across the OW with existing X/Y
            -- keyframes rather than the legacy disappear/transfer warp.
            if type(EnemyHelpers.move_smooth) == "function" then
                Async.await(EnemyHelpers.move_smooth(enemy.instance,enemy,
                    chosen.x,chosen.y,enemy.z,chosen.direction))
            else
                print("[NL_AI][MOVE_SMOOTH_UNAVAILABLE]", tostring(enemy.template_name))
                return
            end
            if chosen.x ~= enemy.x or chosen.y ~= enemy.y then
                -- A failed keyframe must not turn into a distant invisible hit.
                print("[NL_AI][SMOOTH_MOVE_NOT_COMPLETED]", tostring(enemy.template_name))
                return
            end
        end
        enemy.direction=chosen.direction
        Net.set_bot_direction(enemy.id,chosen.direction)
        -- Telegraph shape may be larger than the impact shape.
        local telegraph=profile.telegraph or stages[1]
        set_stage(enemy,telegraph,chosen.direction)
        Runtime.begin_telegraph(enemy.selection)
        Async.await(Async.sleep(positive(profile.telegraph_seconds,0.35)))
        Runtime.end_telegraph(enemy.selection)

        local attack_state=profile.attack_state or "ATTACK"
        if profile.use_attack_animation then
            animate_enemy(enemy,attack_state,chosen.direction)
        end
        Async.await(Async.sleep(tonumber(profile.windup_seconds) or 0))
        local already_hit={}
        -- Keep every launched animation alive while subsequent tiles advance.
        -- The attack pose can remain held until the final visual finishes.
        local all_effects={}
        local active_effects={}
        local projectile_id,projectile_name
        local function track_effect(id)
            if id then
                all_effects[#all_effects+1]=id
                active_effects[id]=true
            end
        end
        for _,stage in ipairs(stages) do
            set_stage(enemy,stage,chosen.direction)
            Runtime.begin_telegraph(enemy.selection)
            local cells=stage_cells(enemy)
            local limit=math.min(#cells, tonumber(stage.max_visuals) or 12)
            -- A travelling projectile is one bot transferred along each tile.
            -- This matches Mettaur's existing shockwave movement and avoids
            -- overlapping persistent projectile copies at previous positions.
            local travelling=stage.motion=="travel" and #cells==1
            local visual_ready = true
            -- Prior 0.12/0.14s travel stages jumped between cells too fast
            -- to read. Match the hit cadence to a visible linear keyframe.
            local impact_delay=positive(stage.duration,0.12)
            if travelling then impact_delay=math.max(0.34,impact_delay) end
            if not travelling and projectile_id then
                Runtime.remove_effect(projectile_id)
                active_effects[projectile_id]=nil
                projectile_id,projectile_name=nil,nil
            end
            if travelling and limit>0 then
                local c=cells[1]
                local name=effect_name(enemy,stage)
                local style=DIR[chosen.direction]
                if projectile_id and projectile_name==name then
                    -- A single projectile is advanced from panel to panel.
                    local moving=Runtime.move_effect(enemy, projectile_id,
                        c.x+0.5,c.y+0.5,enemy.z,
                        (stage.state or name:upper()).."_"..style.suffix,
                        impact_delay)
                    if not moving then
                        -- Do not hit a target at a tile the visual failed
                        -- to reach; close the effect instead.
                        visual_ready = false
                        Runtime.remove_effect(projectile_id)
                        active_effects[projectile_id]=nil
                        projectile_id,projectile_name=nil,nil
                    end
                else
                    if projectile_id then
                        Runtime.remove_effect(projectile_id)
                        active_effects[projectile_id]=nil
                    end
                    projectile_id=effect_spawn(enemy,stage,chosen.direction,c.x,c.y)
                    projectile_name=name
                    track_effect(projectile_id)
                end
            else
                for i=1,limit do
                    local c=cells[i]
                    track_effect(effect_spawn(enemy,stage,chosen.direction,c.x,c.y))
                end
            end
            local candidate=visual_ready and enemy.selection:detect_player_sessions() or {}
            -- An interception starts as the effect approaches the target.
            local records=#candidate>0 and Runtime.prepare(enemy,candidate,impact_delay) or nil
            Async.await(Async.sleep(impact_delay))
            -- Re-test after delay to prevent hits on players who dodged away.
            local live=enemy.selection:detect_player_sessions()
            local eligible={}
            for _,session in ipairs(live) do
                if session.player and (profile.allow_repeat_hits or not already_hit[session.player.id]) then
                    eligible[session.player.id]=true
                end
            end
            local valid_records={}
            for _,record in ipairs(records or {}) do
                local origin=record.original_session
                local id=origin and origin.player and origin.player.id
                if id and eligible[id] then
                    valid_records[#valid_records+1]=record
                    already_hit[id]=true
                end
            end
            if #valid_records>0 then
                Runtime.impact(enemy,valid_records,enemy.attack_damage or 10)
            elseif records then
                Runtime.finish_empty(enemy)
            end
            Runtime.end_telegraph(enemy.selection)
        end
        Async.await(Async.sleep(positive(profile.effect_hold_seconds,0.45)))
        for _,fx in ipairs(all_effects) do
            if active_effects[fx] then Runtime.remove_effect(fx) end
        end
        if profile.use_attack_animation then animate_enemy(enemy,"IDLE",chosen.direction) end
    end)
    return Async.promisify(co)
end
return Attack
