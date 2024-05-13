local icecube_chip = include("cube/cube.lua")
local AUDIO_DAMAGE = Engine.load_audio(_folderpath.."EXE4_270.ogg")
local AUDIO_DAMAGE_OBS = Engine.load_audio(_folderpath.."EXE4_221.ogg")

local ICEMAN_TEXTURE = nil
local ICEMAN_ANIMPATH = _folderpath.."iceman.animation"
local ICETOWER_TEXTURE = Engine.load_texture(_folderpath.."icetower.png")
local ICETOWER_ANIMPATH = _folderpath.."icetower.animation"
local ICETOWER_AUDIO = Engine.load_audio(_folderpath.."EXE4_287.ogg")
local FREEZEBOMB_TEXTURE = Engine.load_texture(_folderpath.."freezebomb.png")
local FREEZEBOMB_ANIMPATH = _folderpath.."freezebomb.animation"
local THROW_AUDIO = Engine.load_audio(_folderpath.."EXE4_150.ogg")
local SHADOW_TEXTURE = Engine.load_texture(_folderpath.."shadow.png")
local SHADOW_ANIMPATH = _folderpath.."shadow.animation"
local SMOKE_TEXTURE = Engine.load_texture(_folderpath.."smoke.png")
local SMOKE_ANIMPATH = _folderpath.."smoke.animation"

local BREATH_TEXTURE = Engine.load_texture(_folderpath.."breath.png")
local BREATH_ANIMPATH = _folderpath.."breath.animation"
local BREATH_AUDIO = Engine.load_audio(_folderpath.."EXE1_60.ogg")

local CUBE_TEXTURE = Engine.load_texture(_folderpath.."cube/cube.png")
local CUBE_ANIMPATH = _folderpath.."cube/cube.animation"
local CUBE_AUDIO = Engine.load_audio(_folderpath.."cube/EXE4_330.ogg")
local BREAK_AUDIO = Engine.load_audio(_folderpath.."cube/EXE4_107.ogg")
local SLIDE_AUDIO = Engine.load_audio(_folderpath.."EXE3_10.ogg")

local EFFECT_TEXTURE = Engine.load_texture(_folderpath.."effect.png")
local EFFECT_ANIMPATH = _folderpath.."effect.animation"

function package_init(self)
    ICEMAN_TEXTURE = Engine.load_texture(_modpath.."iceman.png")
    self:set_name("IceMan")
	local rank = self:get_rank()
    self.damage = 30
    self.damage_icecube = 40
    self.damage_icetower = 30
    self.damage_freezebomb = 30
    self.icetower_target_frame = 11
    self.icecube_speed_frames = 6
    self.flinch_duration = 42
    self.move_count = 3

    self.next_tile = nil
    self.prev_tile = nil

    self.breath = nil
    self.other_random_attack = nil
    self.using_icetower = 0
    
    -- Will set to base_idle_speed normally, but go to *2 after an attack, and sometimes * 1 or * 0 after flinch
    self.base_idle_speed = 44

    -- Chance /16. I'm going to run these when the pattern is complete and when the flinch finishes, respectively
        -- These skips will be very implementation-specific, so don't use them as future references
    self.chance_to_move_four_times = 2
    self.chance_to_move_five_times = 4 --has a change to move 4 times
    self.chance_to_skip_idle_after_flinch = 2
    self.chance_to_halve_idle_after_flinch = 3

    if rank == Rank.V1 then
        self:set_health(500)
    elseif rank == Rank.V2 then
        self:set_name("IceManV")
        self:set_health(800)
        self.damage = 40
        self.damage_icecube = 60
        self.damage_icetower = 40
        self.damage_freezebomb = 60
        self.icetower_target_frame = 10
        self.icecube_speed_frames = 6
        self.flinch_duration = 34
        self.base_idle_speed = 36
    elseif rank == Rank.V3 then
        self:set_name("IceManV")
        self:set_health(1100)
        self.damage = 80
        self.damage_icecube = 90
        self.damage_icetower = 80
        self.damage_freezebomb = 90
        self.icetower_target_frame = 9
        self.icecube_speed_frames = 5
        self.flinch_duration = 26
        self.base_idle_speed = 28
    elseif rank == Rank.SP then
        self:set_health(1400)
        self.damage = 120
        self.damage_icecube = 140
        self.damage_icetower = 120
        self.damage_freezebomb = 120
        self.icetower_target_frame = 8
        self.icecube_speed_frames = 4
        self.flinch_duration = 18
        self.base_idle_speed = 20
    end

    self.idle_speed = self.base_idle_speed 

    self:set_texture(ICEMAN_TEXTURE, true)

    self:set_height(36)
    self:set_explosion_behavior(3, 1, true)
    self:set_offset(0, 0)
	self:set_facing(Direction.Left)
	self:set_element(Element.Aqua)
    self:share_tile(false)
	self:set_float_shoe(false)
	self:set_air_shoe(false)

    local anim = self:get_animation()
    anim:load(ICEMAN_ANIMPATH)

    self.anim = include("enemy_base_v1/entry.lua")
    anim = self.anim
    anim:set_owner(self)
    anim:set_state("IDLE", {
        {duration=self.idle_speed, state="IDLE_1"},
    })

    anim:set_playback(Playback.Loop)
    init_boss(self)

end

--(Function by Alrysc)
-- This is to fix something that happens because I'm a cheater
--[[
    The aggressor of an attack is held in the Context object. 
    ONB leaves this aggressor unset in the Entity's Context until a CardAction is used for the first time
    So I'll immediately force a CardAction that will hopefully end immediately and not get in the way, but also will fix this
    This probably goes horribly wrong if the enemy is spawned after the mob intro, but should be fine for now otherwise
]]
function fix_context(self)
    local action = Battle.CardAction.new(self, "IDLE_1")
    action.execute_func = function()
        action:end_action()
    end

    self:card_action_event(action, ActionOrder.Immediate)
end

--(Function by Alrysc)
function init_boss(self)
    self.on_spawn_func = function(self)
        fix_context(self)
        --[[
        self.before_battle_start_animater = Battle.Artifact.new()
        self:get_field():spawn(self.before_battle_start_animater, 7, 4)
        self.before_battle_start_animater.update_func = function()
            self.anim:tick_animation()
        end
        ]]
    end

    self.battle_start_func = function(self)
        --self.before_battle_start_animater:delete()
    end

    -- Setting names here is just convenience if I want to print the state I'm in later
    self.states = {
        idle = {name = "idle", func = idle},
        move = {name = "move", func = move},
        flinch = {name = "flinch", func = flinch},
        
        start_sub_pattern = {name = "start_sub_pattern"},
        finish_sub_pattern = {name = "finish_sub_pattern"},

        icetower = {name = "icetower", func = icetower},
        freezebomb = {name = "freezebomb", func = freezebomb},
        icecube = {name = "icecube", func = icecube},
        icecubek = {name = "icecubek", func = icecubek},

        choose_attack = {name = "choose_attack", func = choose_attack}
    }
    
    local s = self.states

    reconstruct_pattern(self)
 
    self.pattern_index = 1
    self.in_sub_pattern = false

    self.first_act = true

    self.state_done = false

    self.state = self.pattern[1]

    self.first_flinch = true

    self.hit_func = function(from_stun)
      --  print("Hit func runs")
        self.flinching = false
        self.first_act = false
        self.state_done = false
        self.moving_to_enemy_tile = false
        if self.first_flinch then 
         --   self.state.cleanup
            self.last_state = self.state
       --     print("Hit! Set last state to ", self.state.name)
            if self.state ~= self.states.idle and self.state ~= self.states.move then 
               -- increment_pattern(self)
            end

            self.first_flinch = false
        end

        self.state = self.states.flinch

        -- This is unused for this boss
        if self.slide_component ~= nil then 
          --  print("Hit while moving.")
            self.slide_component:eject()
            self.slide_component = nil
            self:set_offset(0, 0)

            if self.slide_dest and self:get_current_tile() ~= self.slide_dest then 
            --    print("Hit before reaching destination.")
                self:get_current_tile():remove_entity_by_id(self:get_id())
                self.slide_dest:add_entity(self)
                self.slide_dest = nil
            end

        end

        flinch(self, from_stun)
    end

    self.delete_func = function(self)
        self.update_func = function(self)
            self:get_animation():set_state("STUN_1")
            self.state = self.states.flinch
        end
    end

    -- Unused for this boss
    self.moving_to_enemy_tile = false
    self.counter = 0
    self.collision_available = true

    self:register_status_callback(Hit.Stun, function() self.hit_func(true) end)
    self:register_status_callback(Hit.Flinch, self.hit_func)
    self:register_status_callback(Hit.Drag, self.hit_func)
    self:register_status_callback(Hit.Root, function() self.rooted = 120 end)

    -- Bring it back next build. For now, relying on the stun callback
    --[[
    self.on_countered = function(self)
        print("Countered")
        self:toggle_counter(false)
        self.hit_func(self)

    end
    --]]

    self.can_move_to_func = function(tile)
        if self.rooted > 0 then return false end
        if tile:is_edge() or not tile:is_walkable() then
            return false
        end
        if(tile:is_reserved({self:get_id()})) then
            return false
        end

        if not self.moving_to_enemy_tile and (tile:get_team() ~= self:get_team()) then
            return false
        end

        return not check_obstacles(tile, self) and not check_characters_true(tile, self)
    end

    self.rooted = 0
    self.update_func = function(self)
       -- print("     ", self.state.name, self:get_animation():get_state())
        if self.rooted > 0  then self.rooted = self.rooted - 1 end
        self.state.func(self)
        self.anim:tick_animation()

        -- When we tick animation, we may run increment_pattern. 
        -- The new state isn't run until next frame, so our anim state lasts one more frame when it finishes
        -- Calling our state one time to set things up will avoid this. Mostly sure this doesn't have major unintended consequences,
        -- especially as most state.func only set state and callbacks for frame 1
        -- Problem is, now I may have a frame 1 callback but I don't run it until next frame
        while self.first_act
        do
            self.state.func(self)
            self.anim:tick_animation()
        end
        check_collision(self)
    end
end

--(Function by Alrysc)
function create_collision_attack(self, tile)
    local spell = Battle.Spell.new(self:get_team())
   
    local hit_props = HitProps.new(
        self.damage,
        Hit.Impact | Hit.Flash | Hit.Flinch,
        self:get_element(), 
        self:get_context(), 
        Drag.None
    )

    spell:set_hit_props(hit_props)

    spell.update_func = function(self)
        tile:attack_entities(self)
        self:delete()
    end

    self:get_field():spawn(spell, tile)
end

--(Function by Alrysc)
-- TODO: When we get is_passthrough or something, check to see if target became flashing before 
    -- we are allowed to spawn another one. Don't want to instakill viruses
-- self.collision_available can do something related to that. Does nothing now
function check_collision(self)
    local t = self:get_current_tile()
    if self.collision_available and check_characters(t, self) then 
        create_collision_attack(self, t)
    end
end

--(Function by Alrysc)
function idle(self)
    if self.first_act then 
        -- This is an old check for when I extended idle time by doing two idle states in a row, when characters have an animated idle
            -- Not needed if I instead use a timer
        if self.anim:get_state() ~= "IDLE" then 
        --    print("Idle with ", self.idle_speed)
            self.anim:set_state("IDLE", {
                {duration=self.idle_speed, state="IDLE_1"},
            })    
        end

        self.anim:set_playback(Playback.Loop)

        self.anim:on_complete(function()
            -- Extra catch for after leaving attack. Attack will double idle speed once, so making sure to reset it after
            if self.idle_speed > self.base_idle_speed then 
                self.idle_speed = self.base_idle_speed
            end
            increment_pattern(self)
        end)

        self.first_act = false
    end

    --self.looped = false
    --if self.state_done then 
       -- print("State done")
        
   -- end
end

--(Function by Alrysc)
function hit()
    

end

--(Function by Alrysc)
function end_sub_pattern(self)
    while(self.in_sub_pattern)
    do
        increment_pattern(self)
    end
end

--(Function by Alrysc)
function flinch(self, from_stun)
    -- print("Flinch played")
    if self:get_current_tile() == self.next_tile then
        local orig_tile = self.next_tile
        self.next_tile:remove_entity_by_id(self:get_id())
        self.next_tile = orig_tile
        self.next_tile:add_entity(self)
        self.next_tile = nil
    elseif self:get_current_tile() == self.prev_tile then
        local orig_tile = self.prev_tile
        self.prev_tile:remove_entity_by_id(self:get_id())
        self.prev_tile = orig_tile
        self.prev_tile:add_entity(self)
        self.prev_tile = nil
    end
    if self.breath then
        if not self.breath:is_deleted() then
            self.breath:erase()
            self.breath = nil
        end
    end
    --[[
    if self.using_icetower > 0 then
        reconstruct_pattern(self)
    end
    ]]
    -- print("I am flinching")
    if not self.flinching then 
        local frames = {}
        local flinch_time = self.flinch_duration
        if not from_stun then
            frames[1] = {duration=4, state="FLINCH_1"}
            for i=1+1, flinch_time, 4 do
                frames[i] = {duration=2, state="FLINCH_2"}
            end
            for i=2+1, flinch_time+1, 4 do
                frames[i] = {duration=2, state="FLINCH_3"}
            end
            for i=3+1, flinch_time+2, 4 do
                frames[i] = {duration=2, state="FLINCH_4"}
            end
            for i=4+1, flinch_time+3, 4 do
                frames[i] = {duration=2, state="FLINCH_5"}
            end
            frames[4+flinch_time] = {duration=2, state="FLINCH_6"}
            frames[5+flinch_time] = {duration=4, state="FLINCH_7"}
            frames[6+flinch_time] = {duration=4, state="FLINCH_8"}
            frames[7+flinch_time] = {duration=2, state="FLINCH_9"}
        else
            frames[1] = {duration=0, state="STUN_1"}
        end

        self.anim:set_state("FLINCH", frames)

        self.anim:on_complete(function()
            -- If we didn't just attack, we want to make sure the idle speed is correct. This is also set in the actual idle, but just for extra measure.
                -- Shouldn't be necessary
            if self.idle_speed > self.base_idle_speed and self.pattern[self.pattern_index] ~= self.states.choose_attack then 
                self.idle_speed = self.base_idle_speed
            end

            local has_skipped = false
            if self.last_state == self.states.idle then 
          --      print("Attempt skip, because last state was idle")
                has_skipped = maybe_skip_after_flinch(self)
            end

            
--         print("I am done flinching")
        --   print("Anim done")
            self.flinching = false
            self.state_done = true
            self.first_flinch = true

        --    print("Done")
            self.state_done = false
            if self.last_state ~= self.states.idle and self.last_state ~= self.states.move then 
        --     print("Last state was not idle or move", self.last_state.name)
 
                increment_pattern(self)

            
            else--if not has_skipped then 
                -- If we were in idle or move, go back to it and try again
                    -- Unless we were in a sub pattern. Still end that.
            --   print("Last state was idle or move")

                if self.in_sub_pattern then 
                    end_sub_pattern(self)
                else
                    self.state = self.last_state
                    self.first_act = true
                end
            end

        end)

    end

    self.flinching = true
end

--(Function by Alrysc)
--[[
    Chance to skip idle or halve idle time, to call after flinching 
    This works by calling increment_pattern an extra time if and only if the last state was Idle
        Remember, last state is the state we will return to after flinching
        Some extra work will need to be done in the self.anim:on_complete of flinch if this is to work with sub patterns. This boss doesn't use them, so it was omitted
    
    Currently, the skip is implemented as setting idle time to 0
    
    A future choice for this function: after calling this function, self.state *may* increment, obsoleting our last state pointer. Returns true if this does happen
        There is a possible additional side effect that the idle time will instead be changed, in which case, last state is preserved and false is returned
]]
function maybe_skip_after_flinch(self)
    local chance_halve = self.chance_to_halve_idle_after_flinch
    local chance_skip = self.chance_to_skip_idle_after_flinch
    local max = chance_halve + chance_skip + (16 - chance_halve - chance_skip)

    local r = math.random(1, max)
    if r <= chance_halve then 
        self.idle_speed = math.floor(self.idle_speed / 2)
       -- print("We halved")
    elseif r <= (chance_skip + chance_halve) then 
       -- print("We skipped")
        self.idle_speed = 0
        return true
    end

    return false
end

--(Function by Alrysc)
function highlight_tiles(self, list, time)
    local spell = Battle.Spell.new(self:get_team())

    local ref = self
    spell.update_func = function(self)
        for i=1, #list
        do 
            local t = list[i]
            if t and not t:is_edge() then 
                t:highlight(Highlight.Solid)
            end

        end

        time = time - 1
        if time == 0 then 
            self:delete()
        end

        if self.flinching then 
            if spell and not spell:is_deleted() then 
                spell:delete()
    
            end
        end
    end

    self:get_field():spawn(spell, self:get_current_tile())

    return spell
end

--(Function by Alrysc)
function move(self)
    if self.first_act then 
        
        self.anim:set_state("MOVE", {
            {duration=1, state="WARP_1"},
            {duration=1, state="WARP_2"},
            {duration=1, state="WARP_3"},
            {duration=1, state="WARP_4"},
            {duration=2, state="WARP_5"},
            {duration=2, state="WARP_6"},
            {duration=1, state="WARP_7"},
        })

        self.prev_tile = self:get_current_tile()
        local tile = choose_move(self, self:get_field())
        if not tile then
            tile = self:get_current_tile()
        end
        self.next_tile = tile
        self.next_tile:reserve_entity_by_id(self:get_id())
        self.anim:on_frame(5, function()
            if self.can_move_to_func(self.next_tile) then 
            else
                self.next_tile = self:get_current_tile()
            end

            self:teleport(self.next_tile, ActionOrder.Voluntary, nil)
        end)

        self.anim:on_complete(function()
            -- Reset idle speed, since we did a real action
            self.idle_speed = self.base_idle_speed
            increment_pattern(self)
        end)

        self.first_act = false
    end
end

function choose_attack(self)
    local r = math.random(1, 2)
    local front_tile = self:get_tile(self:get_facing(), 1)
    local check_front_C = check_characters(front_tile, self)
    local check_front_O = check_obstacles(front_tile, self)
    local front_has_obs = false
    --[[
    local front_line = nil
    for i = 1, 5, 1 do
        front_line = self:get_tile(self:get_facing(), i)
        if not front_line:is_edge() then
            if check_obstacles(front_line, self) then
                front_has_obs = true
                break
            end
        end
    end
    ]]
    if self.using_icetower > 0 then
        self.state = self.states.icetower
    else
        if self.other_random_attack == 2 then
            self.state = self.states.freezebomb
        elseif self.other_random_attack == 3 then
            if          check_front_C and     check_front_O then
                if r == 1 then
                    self.state = self.states.freezebomb
                else
                    if not front_has_obs then
                        self.state = self.states.icecubek
                    else
                        self.state = self.states.freezebomb
                    end
                end
            elseif      check_front_C and not check_front_O then
                if r == 1 then
                    self.state = self.states.freezebomb
                else
                    if not front_has_obs then
                        self.state = self.states.icecubek
                    else
                        self.state = self.states.freezebomb
                    end
                end
            elseif  not check_front_C and     check_front_O then
                self.state = self.states.freezebomb
            elseif  not check_front_C and not check_front_O then
                self.state = self.states.icecube
            end
        elseif self.other_random_attack == 4 then
            --[[
            if not front_has_obs then
                self.state = self.states.icecubek
            else
                self.state = self.states.freezebomb
            end
            ]]
            if          check_front_C and     check_front_O then
                if r == 1 then
                    self.state = self.states.freezebomb
                else
                    if not front_has_obs then
                        self.state = self.states.icecubek
                    else
                        self.state = self.states.freezebomb
                    end
                end
            elseif      check_front_C and not check_front_O then
                if r == 1 then
                    self.state = self.states.freezebomb
                else
                    if not front_has_obs then
                        self.state = self.states.icecubek
                    else
                        self.state = self.states.freezebomb
                    end
                end
            elseif  not check_front_C and     check_front_O then
                self.state = self.states.freezebomb
            elseif  not check_front_C and not check_front_O then
                self.state = self.states.icecubek
            end
        end
    end

    self.state.func(self)
    self.idle_speed = self.base_idle_speed * 2
end

function icetower(self)
    if self.first_act then
        local frames = {}
        frames[1] = {duration=2, state="BREATH_1"}
        frames[2] = {duration=8, state="BREATH_2"}
        frames[3] = {duration=3, state="BREATH_3"}
        frames[4] = {duration=2, state="BREATH_4"}
        for i = 5, 21, 4 do
            frames[i] = {duration=2, state="BREATH_5"}
        end
        for i = 6, 22, 4 do
            frames[i] = {duration=3, state="BREATH_6"}
        end
        for i = 7, 23, 4 do
            frames[i] = {duration=4, state="BREATH_7"}
        end
        for i = 8, 24, 4 do
            frames[i] = {duration=2, state="BREATH_8"}
        end
        self.anim:set_state("ICETOWER", frames)

        self.using_icetower = self.using_icetower - 1

        self.anim:on_frame(5, function()
            Engine.play_audio(BREATH_AUDIO, AudioPriority.Low)
            local breath_facing = "4"
            if self:get_facing() == Direction.Left then
                breath_facing = "5"
            end
            self.breath = create_effect(self:get_facing(), BREATH_TEXTURE, BREATH_ANIMPATH, breath_facing, Playback.Loop, 0, 0, true, -3, self:get_field(), self:get_current_tile(), false)
        end)

        self.anim:on_frame(6, function()
            spawn_icetower(self, true, self.damage_icetower, self:get_tile(self:get_facing(), 1))
        end)

        self.anim:on_complete(function()
            self.breath:erase()
            increment_pattern(self)
        end)

        self.first_act = false
    end
end

function freezebomb(self)
    if self.first_act then
        self.anim:set_state("FREEZEBOMB", {
            {duration=8, state="THROW_1"},
            {duration=3, state="THROW_2"},
            {duration=3, state="THROW_3"},
            {duration=3, state="THROW_4"},
            {duration=3, state="THROW_5"},
            {duration=2, state="THROW_6"},
            {duration=2, state="THROW_7"},
            {duration=2, state="THROW_8"},
        })

        self.anim:on_frame(3, function()
            Engine.play_audio(THROW_AUDIO, AudioPriority.Low)
        end)

        self.anim:on_frame(4, function()
            local frames_in_air = 40
            local toss_height = 90
            local target_tile = choose_enemy(self, self:get_field())
            toss_spell(self, toss_height, frames_in_air, target_tile)
            toss_spell_shadow(self, toss_height, frames_in_air, target_tile)
            toss_spell_hitbox(self, toss_height, frames_in_air, target_tile)
        end)

        self.anim:on_complete(function()
            increment_pattern(self)
        end)

        self.first_act = false
    end
end

function icecube(self)
    if self.first_act then
        local frames = {}
        frames[1] = {duration=2, state="BREATH_1"}
        frames[2] = {duration=8, state="BREATH_2"}
        frames[3] = {duration=3, state="BREATH_3"}
        frames[4] = {duration=2, state="BREATH_4"}
        for i = 5, 21, 4 do
            frames[i] = {duration=2, state="BREATH_5"}
        end
        for i = 6, 22, 4 do
            frames[i] = {duration=3, state="BREATH_6"}
        end
        for i = 7, 23, 4 do
            frames[i] = {duration=4, state="BREATH_7"}
        end
        for i = 8, 24, 4 do
            frames[i] = {duration=2, state="BREATH_8"}
        end
        self.anim:set_state("ICECUBE", frames)

        self.anim:on_frame(5, function()
            Engine.play_audio(BREATH_AUDIO, AudioPriority.Low)
            local breath_facing = "4"
            if self:get_facing() == Direction.Left then
                breath_facing = "5"
            end
            self.breath = create_effect(self:get_facing(), BREATH_TEXTURE, BREATH_ANIMPATH, breath_facing, Playback.Loop, 0, 0, true, -3, self:get_field(), self:get_current_tile(), false)
        end)

        self.anim:on_frame(6, function()
            local cube = icecube_chip.card_create_action(self)
            self:card_action_event(cube, ActionOrder.Involuntary)
        end)

        self.anim:on_complete(function()
            self.breath:erase()
            increment_pattern(self)
        end)

        self.first_act = false
    end
end

function icecubek(self)
    if self.first_act then
        local frames = {}
        frames[1] = {duration=2, state="BREATH_1"}
        frames[2] = {duration=8, state="BREATH_2"}
        frames[3] = {duration=3, state="BREATH_3"}
        frames[4] = {duration=2, state="BREATH_4"}
        for i = 5, 21, 4 do
            frames[i] = {duration=2, state="BREATH_5"}
        end
        for i = 6, 22, 4 do
            frames[i] = {duration=3, state="BREATH_6"}
        end
        for i = 7, 23, 4 do
            frames[i] = {duration=4, state="BREATH_7"}
        end
        for i = 8, 24, 4 do
            frames[i] = {duration=2, state="BREATH_8"}
        end
        self.anim:set_state("ICECUBEK", frames)

        self.anim:on_frame(5, function()
            Engine.play_audio(BREATH_AUDIO, AudioPriority.Low)
            local breath_facing = "4"
            if self:get_facing() == Direction.Left then
                breath_facing = "5"
            end
            self.breath = create_effect(self:get_facing(), BREATH_TEXTURE, BREATH_ANIMPATH, breath_facing, Playback.Loop, 0, 0, true, -3, self:get_field(), self:get_current_tile(), false)
        end)

        self.anim:on_frame(6, function()
            create_icecubek(self, self:get_tile(self:get_facing(), 1))
        end)

        self.anim:on_complete(function()
            self.breath:erase()
            increment_pattern(self)
        end)

        self.first_act = false
    end
end

function toss_spell(tosser, toss_height, frames_in_air, target_tile)
    local starting_height = -110
    local start_tile = tosser:get_current_tile()
    local facing = tosser:get_facing()
    local field = tosser:get_field()
    local team = tosser:get_team()
    local spell = Battle.Spell.new(team)
    spell:set_facing(facing)
    spell:never_flip(true)
    local spell_animation = spell:get_animation()
    spell_animation:load(FREEZEBOMB_ANIMPATH)
    spell_animation:set_state("0")
    spell_animation:set_playback(Playback.Loop)
    if tosser:get_height() > 1 then
        starting_height = -(tosser:get_height())
    end

    spell.jump_started = false
    spell.starting_y_offset = starting_height
    spell.starting_x_offset = 10
    if facing == Direction.Left then
        spell.starting_x_offset = -10
    end
    spell.y_offset = spell.starting_y_offset
    spell.x_offset = spell.starting_x_offset
    local sprite = spell:sprite()
    sprite:set_texture(FREEZEBOMB_TEXTURE)
    spell:set_offset(spell.x_offset,spell.y_offset)

    spell.update_func = function(self)
        if not spell.jump_started then
            self:jump(target_tile, toss_height, frames(frames_in_air), frames(frames_in_air), ActionOrder.Voluntary)
            self.jump_started = true
        end
        if self.y_offset < 0 then
            self.y_offset = self.y_offset + math.abs(self.starting_y_offset/frames_in_air)
            self.x_offset = self.x_offset - math.abs(self.starting_x_offset/frames_in_air)
            self:set_offset(self.x_offset,self.y_offset)
        else
            self:delete()
        end
    end
    spell.can_move_to_func = function(tile)
        return true
    end
    field:spawn(spell, start_tile)
end

function toss_spell_shadow(tosser, toss_height, frames_in_air, target_tile)
    local starting_height = -110
    local start_tile = tosser:get_current_tile()
    local facing = tosser:get_facing()
    local field = tosser:get_field()
    local team = tosser:get_team()
    local spell = Battle.Spell.new(team)
    spell:set_facing(facing)
    spell:never_flip(true)
    local spell_animation = spell:get_animation()
    spell_animation:load(SHADOW_ANIMPATH)
    spell_animation:set_state("0")
    if tosser:get_height() > 1 then
        starting_height = -(tosser:get_height())
    end

    spell.slide_started = false

    spell.jump_started = false
    spell.starting_y_offset = starting_height
    spell.starting_x_offset = 10
    if facing == Direction.Left then
        spell.starting_x_offset = -10
    end
    spell.y_offset = spell.starting_y_offset
    spell.x_offset = spell.starting_x_offset
    local sprite = spell:sprite()
    sprite:set_texture(SHADOW_TEXTURE)
    spell:set_offset(spell.x_offset,0)

    spell.update_func = function(self)
        if not spell.jump_started then
            self:jump(target_tile, 0, frames(frames_in_air), frames(frames_in_air), ActionOrder.Voluntary)
            self.jump_started = true
        end
        if self.y_offset < 0 then
            self.y_offset = self.y_offset + math.abs(self.starting_y_offset/frames_in_air)
            self.x_offset = self.x_offset - math.abs(self.starting_x_offset/frames_in_air)
            self:set_offset(self.x_offset,0)
        else
            self:delete()
        end
    end
    spell.can_move_to_func = function(tile)
        return true
    end
    field:spawn(spell, start_tile)
end

--Can trigger Daikouzui
function toss_spell_hitbox(tosser, toss_height, frames_in_air, target_tile)
    local starting_height = -110
    local start_tile = tosser:get_current_tile()
    local field = tosser:get_field()
    local spell = Battle.Spell.new(tosser:get_team())
    spell.attacking = false
    local spell_animation = spell:get_animation()
    spell_animation:load(_folderpath.."attack.animation")
    spell_animation:set_state("1")
    spell_animation:set_playback_speed(0)
    spell_animation:on_complete(function() spell:erase() end)
    if tosser:get_height() > 1 then
        starting_height = -(tosser:get_height())
    end

    spell.slide_started = false

    spell.jump_started = false
    spell.starting_y_offset = starting_height
    spell.starting_x_offset = 10
    if tosser:get_facing() == Direction.Left then
        spell.starting_x_offset = -10
    end
    spell.y_offset = spell.starting_y_offset
    spell.x_offset = spell.starting_x_offset
    local sprite = spell:sprite()
    sprite:set_texture(SHADOW_TEXTURE)
    sprite:hide()
    spell:set_offset(spell.x_offset,spell.y_offset)

    local do_once = true
    spell.update_func = function(self)
        if self.attacking then
            --self:get_current_tile():attack_entities(self)
            target_tile:highlight(Highlight.None)
        else
            target_tile:highlight(Highlight.Flash)
        end
        if not spell.jump_started then
            self:jump(target_tile, 0, frames(frames_in_air), frames(frames_in_air), ActionOrder.Voluntary)
            self.jump_started = true
        end
        if self.y_offset < 0 then
            self.y_offset = self.y_offset + math.abs(self.starting_y_offset/frames_in_air)
            self.x_offset = self.x_offset - math.abs(self.starting_x_offset/frames_in_air)
            self:set_offset(self.x_offset,self.y_offset)
        else
            if target_tile:is_walkable() then
                if do_once then
                    do_once = false
                    spell_animation:set_playback_speed(1)
                    self.attacking = true
                    spawn_icetower(tosser, false, tosser.damage_freezebomb, target_tile)
                    spawn_icetower(tosser, false, tosser.damage_freezebomb, target_tile:get_tile(Direction.Up, 1))
                    spawn_icetower(tosser, false, tosser.damage_freezebomb, target_tile:get_tile(Direction.Down, 1))
                    spawn_icetower(tosser, false, tosser.damage_freezebomb, target_tile:get_tile(Direction.Left, 1))
                    spawn_icetower(tosser, false, tosser.damage_freezebomb, target_tile:get_tile(Direction.Right, 1))
                    self:erase()
                end
            else
                if do_once then
                    do_once = false
                    create_effect(facing, SMOKE_TEXTURE, SMOKE_ANIMPATH, "0", Playback.Once, 0.0, -((3.0)*2), true, -9, field, target_tile, true)
                    self:erase()
                end
            end
        end
    end
    spell.can_move_to_func = function(tile)
        return true
    end
    field:spawn(spell, start_tile)
end

function find_target(self)
    local field = self:get_field()
    local team = self:get_team()
    local target_list = field:find_characters(function(other_character)
        return other_character:get_team() ~= team
    end)
    local target_character = nil
    if #target_list > 0 then
        target_character = target_list[1]
    else
        target_character = self:get_current_tile()
    end
    return target_character;
end

function getNextTile(direction, spell)
    local tile = spell:get_current_tile():get_tile(direction, 1)
    local target_movement_tile = tile
    local target_character = find_target(spell)
    local target_character_tile = target_character:get_current_tile()
    if tile:y() < target_character_tile:y() then
        target_movement_tile = tile:get_tile(Direction.Down,1)
    end
    if tile:y() > target_character_tile:y() then
        target_movement_tile = tile:get_tile(Direction.Up,1)
    end
    return target_movement_tile;
end

function spawn_icetower(user, spawn_multi, damage, tile)
    local spawn_next
    spawn_next = function()
        if not tile:is_walkable() then return end

        local team = user:get_team()
        local field = user:get_field()
        local facing = user:get_facing()

        local spell = Battle.Spell.new(team)
        spell:set_hit_props(HitProps.new(
            damage, 
            Hit.Impact | Hit.Flinch | Hit.Flash, 
            Element.Aqua, 
            user:get_id(), 
            Drag.None)
        )
        spell:set_facing(facing)
        spell:never_flip(true)
        spell:set_offset(0, 3*2*-1)
        spell.attacking = false
        spell.spawn_next = spawn_multi
        local sprite = spell:sprite()
        sprite:set_texture(ICETOWER_TEXTURE)
        sprite:set_layer(-3)
        local animation = spell:get_animation()
        animation:load(ICETOWER_ANIMPATH)
        animation:set_state("0")
        animation:refresh(sprite)
        local query_TeamHP = function(ent)
            if not user:is_team(ent:get_team()) and ent:get_health() > 0 then
                return true
            end
        end
        local next_tile = nil
        animation:on_frame(2, function()
            spell.attacking = true
        end)
        animation:on_frame(6, function() --11 10 9 8 7
            next_tile = spell:get_tile(facing, 1)
        end)
        animation:on_frame(user.icetower_target_frame, function() --11 10 9 8 7
            tile = next_tile
            --[[if spell:get_current_tile():find_characters(query) <= 0 then
                spawn_next()
            end]]
            if spell.spawn_next then
                spawn_next()
            end
        end, true)
        animation:on_complete(function() 
            spell:erase()
        end)

        spell.on_spawn_func = function(self)
            Engine.play_audio(ICETOWER_AUDIO, AudioPriority.Low)
        end

        spell.update_func = function(self)
            local self_tile = self:get_current_tile()
            local ref = self
            if ref.attacking then
                self_tile:attack_entities(self)
                spell:highlight_tile(Highlight.Solid)
            end
            if ref.spawn_next then
                if #self_tile:find_characters(query_TeamHP) > 0 then
                    ref.spawn_next = false
                end
            end
            if self_tile ~= nil and
                not self_tile:is_edge() and
                #self_tile:find_characters(query_TeamHP) <= 0 and 
                #self_tile:find_obstacles(query_TeamHP) <= 0 and 
                self_tile:get_state() == TileState.Lava
                then
                self_tile:set_state(TileState.Normal)
                --[[
            elseif self_tile ~= nil and
                not self_tile:is_edge() and
                #self_tile:find_characters(query_TeamHP) > 0 and 
                #self_tile:find_obstacles(query_TeamHP) > 0 and 
                self_tile:get_state() == TileState.Ice
                then
                self_tile:set_state(TileState.Ice)]]
            end
        end

        spell.attack_func = function(self, ent)
            if Battle.Obstacle.from(ent) == nil then
                --[[
                if Battle.Player.from(user) ~= nil then
                    Engine.play_audio(AUDIO_DAMAGE, AudioPriority.Low)
                end
                ]]
            else
                Engine.play_audio(AUDIO_DAMAGE_OBS, AudioPriority.Low)
            end
        end
        
        spell.battle_end_func = function(self)
            self:erase()
        end

        spell.can_move_to_func = function(tile)
            return true
        end

        field:spawn(spell, tile)
    end

    spawn_next()
end

function create_icecubek(user, tile)
    local team = user:get_team()
    local field = user:get_field()
    local facing = user:get_facing()

	local spell = Battle.Spell.new(team)
	spell:set_hit_props(
        HitProps.new(
            user.damage_icecube,
            Hit.Impact | Hit.Flinch | Hit.Flash | Hit.Breaking, 
            Element.Aqua,
            user:get_id(), 
            Drag.None
        )
    )
	spell:set_facing(facing)
    --spell:set_offset(0,-74)
    spell.attacking = false
	spell.slide_started = false
	local sprite = spell:sprite()
    sprite:set_texture(CUBE_TEXTURE, true)
	sprite:set_layer(-3)
    local anim = spell:get_animation()
	anim:load(CUBE_ANIMPATH)
	anim:set_state("SPAWN")
    anim:refresh(sprite)
    anim:on_complete(function()
        anim:set_state("IceCube")
        anim:refresh(sprite)
        --anim:set_playback(Playback.Loop)
        spell.attacking = true
        Engine.play_audio(SLIDE_AUDIO, AudioPriority.Low)
    end)
	spell.update_func = function(self)
        if self.attacking then
            self:get_current_tile():attack_entities(self)
            if self:is_sliding() == false then
                if self:get_current_tile():is_edge() and self.slide_started then
                    self:erase()
                end
                local dest = self:get_tile(facing, 1)
                local ref = self
                self:slide(dest, frames(user.icecube_speed_frames), frames(0), ActionOrder.Voluntary, function()
                    ref.slide_started = true 
                end)
            end
        end
    end
    spell.on_spawn_func = function(self)
        --Engine.play_audio(CUBE_AUDIO, AudioPriority.Low)
    end
	spell.collision_func = function(self, ent)
		self:delete()
	end
    spell.attack_func = function(self, ent)
        create_effect(facing, EFFECT_TEXTURE, EFFECT_ANIMPATH, "3",  Playback.Once, math.random(-30,30), math.random(-50,-30), true, -999999, field, ent:get_current_tile(), true)
        if Battle.Obstacle.from(ent) == nil then
			--[[
            if Battle.Player.from(user) ~= nil then
				Engine.play_audio(AUDIO_DAMAGE, AudioPriority.Low)
			end
            ]]
		else
			Engine.play_audio(AUDIO_DAMAGE_OBS, AudioPriority.Low)
		end
    end
	spell.battle_end_func = function(self)
		self:delete()
	end
	spell.can_move_to_func = function(tile)
        return true
    end
    spell.delete_func = function(self)
        local self_tile = self:get_current_tile()
        local piece1 = create_effect(facing, Engine.load_texture(_folderpath.."cube/piece1_IceCube.png"), _folderpath.."cube/piece1_IceCube.animation", "0", Playback.Once, 0, 0, true, -9, field, self_tile, true)
		piece1:get_animation():on_frame(18, function()
			create_effect(facing, SMOKE_TEXTURE, SMOKE_ANIMPATH, "0", Playback.Once, 32, 36, true, -9, field, self_tile, true)
		end)
		local piece2 = create_effect(facing, Engine.load_texture(_folderpath.."cube/piece2_IceCube.png"), _folderpath.."cube/piece2_IceCube.animation", "0", Playback.Once, 0, 0, true, -9, field, self_tile, true)
		piece2:get_animation():on_frame(21, function()
			create_effect(facing, SMOKE_TEXTURE, SMOKE_ANIMPATH, "0", Playback.Once, -36, 72, true, -9, field, self_tile, true)
		end)
		self:erase()
    end
	field:spawn(spell, tile)
    return spell
end

--(Function by Alrysc)
function find_valid_move_location(self)
	local target_tile
	local field = self:get_field()

	local tiles = field:find_tiles(function(tile)
		return self.can_move_to_func(tile)
	end)
  
	--print (#tiles)
	if #tiles >= 1 then
		target_tile = tiles[math.random(#tiles)]
	else
		target_tile = self:get_tile()
	end
	
	local start_tile = self:get_tile()
	if #tiles > 1 then
		while target_tile == start_tile do
		-- pick another, don't try to jump on the same tile if it's not necessary
		target_tile = tiles[math.random(#tiles)]
		end
	end
  
    return target_tile
end

function front_enemy_check(self)
    local facing = self:get_facing()
    local field = self:get_field()
    local team = self:get_team()

    local function query(c)
        return c:get_team() ~= team
    end

    for i = 1, 5, 1 do
        local target_tile = self:get_tile(facing, i)
        if target_tile ~= nil and #target_tile:find_characters(query) > 0 then
            --print("front TRUE")
            return true
        else
            --print("front FALSE")
            return false
        end
    end
end

function choose_enemy(self, field)
    local team = self:get_team()

    local target = field:find_characters(function(c)
        return c:get_team() ~= team
    end)

    if not target[1] then 
       -- print("No targets")
        return nil
    end

    t_x = target[1]:get_current_tile():x()
    t_y = target[1]:get_current_tile():y()

    local facing = -1
    if target[1]:get_facing() == Direction.Right then 
        facing = 1
    end

    local tile = field:tile_at(t_x, t_y)

    return tile
end

function choose_move(self)
    local team = self:get_team()
    local query = function(ent)
        if ent:get_health() > 0 then
            return true
        end
    end

    local tiles = {}

    local tile_found = false
    local stile = nil
    stile = self:get_tile(Direction.Up, 1)
    if stile:get_team() == team and stile:is_walkable() and not stile:is_reserved({}) and not stile:is_edge() and #stile:find_characters(query) <= 0 and #stile:find_obstacles(query) <= 0 then
        tile_found = true
        table.insert(tiles, stile)
    end
    stile = self:get_tile(Direction.Down, 1)
    if stile:get_team() == team and stile:is_walkable() and not stile:is_reserved({}) and not stile:is_edge() and #stile:find_characters(query) <= 0 and #stile:find_obstacles(query) <= 0 then
        tile_found = true
        table.insert(tiles, stile)
    end
    stile = self:get_tile(Direction.Left, 1)
    if stile:get_team() == team and stile:is_walkable() and not stile:is_reserved({}) and not stile:is_edge() and #stile:find_characters(query) <= 0 and #stile:find_obstacles(query) <= 0 then
        tile_found = true
        table.insert(tiles, stile)
    end
    stile = self:get_tile(Direction.Right, 1)
    if stile:get_team() == team and stile:is_walkable() and not stile:is_reserved({}) and not stile:is_edge() and #stile:find_characters(query) <= 0 and #stile:find_obstacles(query) <= 0 then
        tile_found = true
        table.insert(tiles, stile)
    end

    if not tile_found then
        table.insert(tiles, self:get_current_tile())
    end

    return tiles[math.random(1, #tiles)]
end

function choose_move_old(self, field)
    local team = self:get_team()

    local tiles = field:find_tiles(function(tile)
        return tile ~= self:get_current_tile() and self.can_move_to_func(tile)
    end)

    --print("Found ", #tiles, " possible tiles")

    if #tiles == 0 then 
        return self:get_current_tile()
    end

    return tiles[math.random(1, #tiles)]
end

function choose_move_to_enemy(self, field)
    local team = self:get_team()

    local enemy_tile = choose_enemy(self, field)
    local enemy_y = enemy_tile:y()

    local tiles = field:find_tiles(function(tile)
        return tile ~= self:get_current_tile() and self.can_move_to_func(tile) and tile:y() == enemy_y
    end)

    --print("Found ", #tiles, " possible tiles")

    if #tiles == 0 then 
        return self:get_current_tile()
    end

    return tiles[math.random(1, #tiles)]
end

function reconstruct_pattern(self)
    local pattern = {}
    local states = self.states
    local moves = self.move_count
    local r = math.random(1, 16)
    local r2 = math.random(1, 4)
    --print(r)
    if r <= self.chance_to_move_four_times then
        moves = 4
        --print("Four moves this time")
    elseif r > self.chance_to_move_four_times and r <= self.chance_to_move_five_times then
        moves = 5
        --print("Five moves this time")
    end

    for i=1, moves do
        table.insert(pattern, states.idle)
        table.insert(pattern, states.move)
    end

    if r2 == 1 then
        self.using_icetower = 2
        table.insert(pattern, states.idle)
        table.insert(pattern, states.choose_attack)
        table.insert(pattern, states.move)
        table.insert(pattern, states.choose_attack)
    else
        self.other_random_attack = r2
        table.insert(pattern, states.idle)
        table.insert(pattern, states.choose_attack)
    end

    self.pattern = pattern
end

function increment_pattern(self)
   -- print("Pattern increment")

    self.first_act = true
    self.state_done = false
    self.pattern_index = self.pattern_index + 1
    if self.pattern_index > #self.pattern then 
        reconstruct_pattern(self)
 --       print("Reconstructed pattern")
        self.pattern_index = 1
    end

    local next_state = self.pattern[self.pattern_index]
    self.state = next_state
  --  print("Moving to state named ", next_state.name)

    if next_state == self.states.start_sub_pattern then 
        self.in_sub_pattern = true
        increment_pattern(self)
    end

    if next_state == self.states.finish_sub_pattern then 
        self.in_sub_pattern = false
        increment_pattern(self)

    end

   -- print("Changing to "..self.pattern_index..", which is "..self.pattern[self.pattern_index].name)

end

function check_obstacles(tile, self)
    local ob = tile:find_obstacles(function(o)
        return o:get_health() > 0 
    end)

    return #ob > 0 
end

function check_characters(tile, self)
    local characters = tile:find_characters(function(c)
        return c:get_id() ~= self:get_id() and c:get_team() ~= self:get_team()
    end)

    return #characters > 0
end

function check_characters_true(tile, self)
    local characters = tile:find_characters(function(c)
        return true
    end)

    return #characters > 0
end

function create_effect(effect_facing, effect_texture, effect_animpath, effect_state, playback, offset_x, offset_y, flip, offset_layer, field, tile, on_complete)
    local hitfx = Battle.Artifact.new()
    hitfx:set_facing(effect_facing)
    hitfx:set_texture(effect_texture, true)
    hitfx:set_offset(offset_x, offset_y)
    hitfx:never_flip(flip)
    local hitfx_sprite = hitfx:sprite()
    hitfx_sprite:set_layer(offset_layer)
    local hitfx_anim = hitfx:get_animation()
	hitfx_anim:load(effect_animpath)
	hitfx_anim:set_state(effect_state)
	hitfx_anim:refresh(hitfx_sprite)
    hitfx_anim:set_playback(playback)
    if on_complete then
        hitfx_anim:on_complete(function()
            hitfx:erase()
        end)
    end
    field:spawn(hitfx, tile)

    return hitfx
end