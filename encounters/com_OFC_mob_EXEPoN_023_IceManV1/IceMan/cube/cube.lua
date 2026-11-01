local DAMAGE = 0

local ObstacleInfo = include("ObstacleInfo/ObstacleInfo.lua")

local CUBE_TEXTURE = Engine.load_texture(_folderpath.."cube.png")
local CUBE_ANIMPATH = _folderpath.."cube.animation"
local CUBE_AUDIO = Engine.load_audio(_folderpath.."EXE4_330.ogg")
local BREAK_AUDIO = Engine.load_audio(_folderpath.."EXE4_107.ogg")
local MOVE_TEXTURE = Engine.load_texture(_folderpath.."move.png")
local MOVE_ANIMPATH = _folderpath.."move.animation"
local SMOKE_TEXTURE = Engine.load_texture(_folderpath.."smoke.png")
local SMOKE_ANIMPATH = _folderpath.."smoke.animation"

local cube_chip = {
	type = "IceCube",
}

cube_chip.card_create_action = function(actor)
    --print("in card_create_action()!")
	local props = Battle.CardProperties.new()
	props.damage = 0
	props.shortname = "IceCube"
	props.time_freeze = false
    local action = Battle.CardAction.new(actor, "")
	action:set_metadata(props)
	local original_offset = actor:get_offset()
	action:set_lockout(make_sequence_lockout())
	--[[
	local props = {
		damage = actor.damage_icecube
		element = Element.Aqua,
	}
	]]
    action.execute_func = function(self, user)
        --print("in custom card action execute_func()!")		
		local step1 = Battle.Step.new()
		local cube = Battle.Obstacle.new(Team.Other)
		cube.state = cube_chip.type
		cube.cannot_drag_rule = Battle.DefenseRule.new(0, DefenseOrder.Always)
		--[[
		local n1 = "ISCube"..tostring(user:get_team()).."_n1"
		local n2 = "ISCube"..tostring(user:get_team()).."_n2"
		local cube_filter = function(obstacle)
			return obstacle:get_name() == n1 or obstacle:get_name() == n2
		end
		local cube1_filter = function(obstacle)
			return obstacle:get_name() == n1
		end
		local cube2_filter = function(obstacle)
			return obstacle:get_name() == n2
		end
		local cubes = user:get_field():find_obstacles(cube_filter)
		local found_cubes = {}
		if #cubes > 1 then
			for i = 1, #cubes, 1 do
				if cubes[i]:get_name() == n1 then
					--print("first cube found")
					table.insert(found_cubes, cubes[i])
					--break
				end
			end
			for i = 1, #cubes, 1 do
				if cubes[i]:get_name() == n2 then
					--print("second cube found")
					table.insert(found_cubes, cubes[i])
					--break
				end
			end
			found_cubes[1]:delete()
			found_cubes[2]:set_name(n1)
			cube:set_name(n2)
		elseif #cubes == 1 then
			cube:set_name(n2)
		elseif #cubes <= 0 then
			cube:set_name(n1)
		end
		--print("name: "..cube:get_name())
		]]
		local time_freeze_counter = 0
		local erase_after_time_freeze = false
		local desired_tile = user:get_tile(user:get_facing(), 1)
		local check = function(ent)
			if ent:get_health() > 0 then
				return true
			end
		end
		local checking = #desired_tile:find_characters(check) > 0 or #desired_tile:find_obstacles(check) > 0

		local do_once = true
		local do_once_2 = true
		step1.update_func = function(self, dt)
			if time_freeze_counter < 80 then
				time_freeze_counter = time_freeze_counter + 1
			else
				self:complete_step()
				if erase_after_time_freeze then
					erase_after_time_freeze = false
					create_effect(user:get_facing(), MOVE_TEXTURE, MOVE_ANIMPATH, "2", 0, 5*2*-1, true, -9, user:get_field(), desired_tile)
					cube:erase()
				end
			end
			if do_once then
				do_once = false

				cube:set_facing(user:get_facing())
				cube:set_texture(CUBE_TEXTURE, true)
				local anim = cube:get_animation()
				anim:load(CUBE_ANIMPATH)
				anim:set_state("SPAWN")
				anim:refresh(cube:sprite())
				anim:on_complete(function()
					local tile = cube:get_tile()
					-- and not desired_tile:is_reserved({})
					if desired_tile:is_walkable() and not desired_tile:is_edge() then
						if checking then
							cube:erase() --erase_after_time_freeze = true
						else
							anim:set_state(cube.state)
							anim:refresh(cube:sprite())
							anim:set_playback(Playback.Loop)
						end
					else
						cube:erase() --erase_after_time_freeze = true
					end
				end)
				if cube.state == "StoneCube" then
					cube:set_health(200)
				else
					cube:set_health(50)
				end
				cube.cannot_drag_rule.filter_statuses_func = function(hit_props)
					hit_props.flags = hit_props.flags & (~Hit.Drag)
					return hit_props
				end
				cube:add_defense_rule(cube.cannot_drag_rule)
				cube:share_tile(false)

				cube.on_spawn_func = function()
					--Engine.play_audio(CUBE_AUDIO, AudioPriority.Low)
				end

				-- deletion process var
				local delete_self = nil
				local spawned_hitbox = false
				local countdown = 6000
				-- slide tracker
				local continue_slide = false
				local prev_tile = {}
				local cube_speed = 4

				-- define cube collision hitprops
				--[[
				local props = HitProps.new(
					50,
					Hit.Impact | Hit.Flinch | Hit.Flash | Hit.Breaking, 
					Element.Aqua,
					user:get_id(),
					Drag.None
				)
				if cube.state == "StoneCube" then
					props = HitProps.new(
						200,
						Hit.Impact | Hit.Flinch | Hit.Flash | Hit.Breaking, 
						Element.None,
						user:get_id(),
						Drag.None
					)
				end
				]]

				-- upon tangible collision
				--[[
				cube.collision_func = function(self)
					-- define the hitbox with its props every frame
					local hitbox = Battle.Hitbox.new(cube:get_team())
					hitbox:set_hit_props(props)

					if not spawned_hitbox then
						cube:get_field():spawn(hitbox, cube:get_current_tile())
						spawned_hitbox = true
					end
					cube.delete_func(self)
				end
				]]
				-- upon passing the defense check
				cube.attack_func = function(self)
				end

				cube.can_move_to_func = function(tile)
					if tile then
						-- get a list of every obstacle with Team.Other on the field
						local field = cube:get_field()
						local cube_team = cube:get_team()
						local Other_obstacles = function(obstacle)
							return obstacle:get_team() == cube_team
						end
						local obstacles_here = field:find_obstacles(Other_obstacles)
						local donotmove = false
						-- look through the list of obstacles and read their tile position, check if we're trying to move to their tile.
						for ii=1,#obstacles_here do
							if tile == obstacles_here[ii]:get_tile() then
								donotmove = true
							end
						end

						if tile:is_edge() or donotmove or not tile:is_walkable() then
							return false
						end
					end
					return true
				end
				cube.update_func = function(self, dt)
					local tile = cube:get_current_tile()
					if not tile then
						cube.delete_func(self)
					end
					if tile:is_edge() then
						cube.delete_func(self)
					end
					if not delete_self then
						tile:attack_entities(cube)
					end
					local direction = self:get_facing()
					if self:is_sliding() then
						table.insert(prev_tile,1, tile)
						prev_tile[cube_speed+1] = nil
						local target_tile = tile:get_tile(direction, 1)
						if self.can_move_to_func(target_tile) then
							continue_slide = true
						else
							continue_slide = false
						end
					else
						-- become aware of which direction you just moved in, turn to face that direction
						if prev_tile[cube_speed] then
							if prev_tile[cube_speed]:get_tile(direction, 1):x() ~= tile:x() then
								direction = self:get_facing_away()
								self:set_facing(direction)
							end
						end
					end
					if not self:is_sliding() and continue_slide then
						self:slide(self:get_tile(direction, 1), frames(cube_speed), frames(0), ActionOrder.Voluntary, function() end)
					end
					if self:get_health() <= 0 then
						cube.delete_func(self)
					end
					if countdown > 0 then countdown = countdown - 1 else cube.delete_func() end
					
					-- deletion handler in main loop, starts running once something in here has requested deletion
					if delete_self then
						if type(delete_self) ~= "number" then
							delete_self = 2
						end
						if delete_self > 0 then
							delete_self = delete_self - 1
						elseif delete_self == 0 then
							delete_self = -1
							self:erase()
						end
					end
				end
				cube.delete_func = function(self)
					Engine.play_audio(BREAK_AUDIO, AudioPriority.Low)
					local cube_facing = self:get_facing()
					local cube_field = self:get_field()
					local cube_tile = self:get_current_tile()
					--[[
					local cube1_yes = false
					local cube2_yes = false
					local cubes1 = cube_field:find_obstacles(cube1_filter)
					local cubes2 = cube_field:find_obstacles(cube2_filter)
					if #cubes1 > 0 then
						cube1_yes = true
					end
					if #cubes2 > 0 then
						cube2_yes = true
					end
					if 			cube1_yes and 	  cube2_yes then
						--nothing
					elseif		cube1_yes and not cube2_yes then
						--nothing
					elseif 	not cube1_yes and	  cube2_yes then
						cubes2[1]:set_name(n1)
					elseif 	not	cube1_yes and not cube2_yes then
						--nothing
					end
					]]
					if type(delete_self) ~= "number" then
						delete_self = true
					end
					if cube:get_current_tile():is_edge() or cube:get_current_tile():is_hole() then
					else
						local piece1 = create_effect(cube_facing, Engine.load_texture(_folderpath.."piece1_"..cube.state..".png"), _folderpath.."piece1_"..cube.state..".animation", "0", 0, 0, true, -9, cube_field, cube_tile)
						piece1:get_animation():on_frame(18, function()
							create_effect(cube_facing, SMOKE_TEXTURE, SMOKE_ANIMPATH, "0", 32, 36, true, -9, cube_field, cube_tile)
						end)
						local piece2 = create_effect(cube_facing, Engine.load_texture(_folderpath.."piece2_"..cube.state..".png"), _folderpath.."piece2_"..cube.state..".animation", "0", 0, 0, true, -9, cube_field, cube_tile)
						piece2:get_animation():on_frame(21, function()
							create_effect(cube_facing, SMOKE_TEXTURE, SMOKE_ANIMPATH, "0", -36, 72, true, -9, cube_field, cube_tile)
						end)
					end
				end
				ObstacleInfo.add_to_limit_2(cube, user:get_team(), user:get_field())
				user:get_field():spawn(cube, desired_tile)
			end
		end
		self:add_step(step1)

		actor:set_offset(original_offset.x, original_offset.y)
	end
	action.action_end_func = function(self, dt)
		actor:set_offset(original_offset.x, original_offset.y)
	end
    return action
end

function create_effect(effect_facing, effect_texture, effect_animpath, effect_state, offset_x, offset_y, flip, offset_layer, field, tile)
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
    hitfx_anim:on_complete(function()
        hitfx:erase()
    end)
    field:spawn(hitfx, tile)

    return hitfx
end

return cube_chip