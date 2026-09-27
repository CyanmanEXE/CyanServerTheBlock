local eznpcs = require('scripts/ezlibs-scripts/eznpcs/eznpcs')
local ezmemory = require('scripts/ezlibs-scripts/ezmemory')
local ezmystery = require('scripts/ezlibs-scripts/ezmystery')
local ezweather = require('scripts/ezlibs-scripts/ezweather')
local ezwarps = require('scripts/ezlibs-scripts/ezwarps/main')
local ezencounters = require('scripts/ezlibs-scripts/ezencounters/main')
local helpers = require('scripts/ezlibs-scripts/helpers')
local LibPlugin = require('scripts/ezlibs-custom/nebulous-liberations/main')



local sfx = {
    hurt = '/server/assets/ezlibs-assets/sfx/hurt.ogg',
    item_get = '/server/assets/ezlibs-assets/sfx/item_get.ogg',
    recover = '/server/assets/ezlibs-assets/sfx/recover.ogg',
    card_error = '/server/assets/ezlibs-assets/ezfarms/card_error.ogg'
}


local function _encounter_result_flags(stats)
    local reason = tonumber(stats and stats.reason or 0) or 0
    local hp = tonumber(stats and (stats.health or stats.player_hp or stats.hp) or 0) or 0

    local ran, won, lost = false, false, false

    if reason == 1 then        -- battle won
        won = true
    elseif reason == 2 then    -- battle lost
        lost = true
    elseif reason == 3 then    -- ran with L
        ran = true
    elseif reason == 4 then    -- ESC / dev escape
        ran = true
    else
        -- backwards compatibility with older builds
        ran = stats and (stats.ran or stats.fled or stats.escape) or false
        if not ran then
            if hp > 0 then
                won = true
            else
                lost = true
            end
        end
    end

    return {
        reason = reason,
        hp = hp,
        ran = ran,
        won = won,
        lost = lost,
    }
end
local boss2 = {
    name="boss2",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    pet_exp=0,
    enemies={
        {name="HeelNavi",rank=1},
    },
    obstacles={
    },
    positions={
        {0,0,0,0,0,0},
        {0,0,0,0,1,0},
        {0,0,0,0,0,0},
    },
    obstacle_positions={
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {1,1,1,1,1,1},
        {1,1,1,1,1,1},
        {1,1,1,1,1,1},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
}

local event1 = {
    name="Heel1",
    action=function (npc,player_id,dialogue,relay_object)
        return async(function()
          local stats = await(ezencounters.begin_encounter(player_id, boss2))
          local flags = _encounter_result_flags(stats)

          if flags.ran or flags.lost then
              return dialogue.custom_properties["Battle Lost"]
          else
              return dialogue.custom_properties["Battle Won"]
          end
        end)
    end
}
eznpcs.add_event(event1)

--[[local event1 = {
    name="Heel1",
    action=function (npc,player_id,dialogue,relay_object)
        return async(function()
        Net.initiate_encounter(player_id, "/server/assets/bosses/com_louise_mob_HeelNavi.zip")
        return dialogue.custom_properties["Next 1"]
    end)
end
}

eznpcs.add_event(event1)]]--


local event2 = {
    name="Clown1",
    action=function (npc,player_id,dialogue,relay_object)
        return async(function()
        Net.initiate_encounter(player_id, "/server/assets/bosses/com_louise_CircusMan.zip")
        return dialogue.custom_properties["Next 1"]
    end)
end
}

local liberation_item_list = {
	{n="HeroSwrd",d="A Hero Sword Chip. Use it in Liberations!"},
	{n="WideSwrd",d="A Wide Sword Chip. Use it in Liberations!"},
	{n="OldSaber",d="A Saber projection hilt, scarred with age. Use it in Liberations!"},
	--{n="HevyShld",d="A heavy shield, great for defense. Use it in Liberations!"},
	{n="HexSickle",d="A wicked scythe which cleaves most anything. Use it in Liberations!"},
	{n="NumGadgt",d="A gadget that's constantly calculating outcomes. Use it in Liberations!"},
	{n="GutsHamr",d="A hammer that takes guts to wield. Use it in Liberations!"},
	{n="ShdwShoe",d="Delicate shoes that let you walk on air. Wear them in Liberations!"},
	{n="CrosBmb",d="A hefty bomb to blow up panels in a plus shape. use it in Liberations!"},
	{n="Burner",d="A powerful fire blast to burn up what stands in your way. use it in Liberations!"},
	{n="Blaster",d="A well rounded buster that fires in a T shape. use it in Liberations!"},
	{n="Bazooka",d="A  destructive and powerful weapon. use it in Liberations!"}
}

local RematchProgEvent ={
	name = "Refight Liberation",
	action = function(npc, player_id, dialogue, relay_object)
		return async(function()
			return LibPlugin.start_game_for_player(player_id, dialogue.custom_properties["Liberation Map"])
		end)
	end
}

local GrantLiberationAbility = {
	name = "Grant Liberation Mission Ability",
	action = function(npc, player_id, dialogue, relay_object)
		return async(function()
			for i = 1, #liberation_item_list, 1 do
				ezmemory.create_or_update_item(liberation_item_list[i].n, liberation_item_list[i].d, true)
				local item_count = ezmemory.count_player_item(player_id, liberation_item_list[i].n)
				if item_count > 0 then ezmemory.remove_player_item(player_id, liberation_item_list[i].n, item_count) end
			end

			if dialogue.custom_properties["Ability Item"] ~= nil then ezmemory.give_player_item(player_id, dialogue.custom_properties["Ability Item"], 1) end
		end)
	end
}

--[[local VirologistDateCheck = {
	name = "Virologist Timer Check",
	action = function(npc, player_id, dialogue, relay_object)
		return async(function()
			--Get the player's safe secret for ezmemory
			local safe_secret = helpers.get_safe_player_secret(player_id)
			--Get the player memory
			local player_memory = ezmemory.get_player_memory(safe_secret)
			--If the specified player doesn't have quest data in their memory, initialize it.
			if not player_memory.quest_data then player_memory.quest_data = {} end
			--Get the NPC mugshot for message use.
			local mug = eznpcs.get_dialogue_mugshot(npc,player_id,dialogue)
			--If the player memory has a virologist date saved (custom data from me), and the current time is less than that date, tell the player to return later.
			if player_memory.quest_data["ACDC2Virologist"] and os.time() < player_memory.quest_data["ACDC2Virologist"] then
				Async.await(Async.message_player(player_id, "I'm sorry, I'm still studying the data.", mug.texture_path, mug.animation_path))
				Async.await(Async.message_player(player_id, "Please come back later.", mug.texture_path, mug.animation_path))
				--Don't proceed. We're too early to try this quest again.
				return nil
			end
			return dialogue.custom_properties["Next 1"]
		end)
	end
}]]--

--[[local VirologistAssistance = {
	name = "Virologist Battle",
	action = function(npc, player_id, dialogue, relay_object)
		return async(function()
			--Get the player's safe secret for ezmemory
			local safe_secret = helpers.get_safe_player_secret(player_id)
			--Get the player memory
			local player_memory = ezmemory.get_player_memory(safe_secret)
			--If the specified player doesn't have quest data in their memory, initialize it.
			if not player_memory.quest_data then player_memory.quest_data = {} end
			--Get the NPC mugshot for message use.
			local mug = eznpcs.get_dialogue_mugshot(npc,player_id,dialogue)
			--Get the max HP and modify it.
			--local modified_hp = ezmemory.calculate_player_modified_max_hp(player_id,ezmemory.get_player_max_health(player_id),20,"HPMem")
			--Initiate an encounter.
			local results = Async.await(Async.initiate_encounter(player_id, "/server/assets/encounters/VirologistData.zip", {}))
			--If we won and didn't run, let's begin processing our reward!
			if not results.ran then
				--Default timer is 24 hours later. Save the date!
				local new_date = os.time()
				if results.health > 0 then
					new_date = new_date + ((60*60)*24)
					--Set our emotion...
					if results.emotion == 1 then
						Net.set_player_emotion(player_id, results.emotion)
					else
						Net.set_player_emotion(player_id, 0)
					end
					--Set our health...
					Net.set_player_health(player_id,results.health)
					Net.lock_player_input(player_id)
					Async.await(Async.message_player(player_id, "Most informative! Thank you.", mug.texture_path, mug.animation_path))
					--Virologist heals us.
					Async.await(Async.message_player(player_id, "Allow me to restore your health.", mug.texture_path, mug.animation_path))
					--Heal to max
					--ezmemory.set_player_health(player_id, modified_hp)
					--Provide a recover SFX from the server so that we guarantee it exists.
					Net.play_sound_for_player(player_id, "/server/assets/NebuLibsAssets/sound effects/recover.ogg")
					--Give the player 500 Monies!
					Async.await(Async.message_player(player_id, "Please, take this for your trouble.", mug.texture_path, mug.animation_path))
					Async.await(Async.message_player(player_id, "Got $500!"))
					--Spend in reverse to gain.
					ezmemory.spend_player_money(player_id, -500)
					--Tell the player what the Virologist is up to for the next while, and when to come back.
					Async.await(Async.message_player(player_id, "I need to study this data...", mug.texture_path, mug.animation_path))
					Async.await(Async.message_player(player_id, "Could you give me 24 hours?", mug.texture_path, mug.animation_path))
					Net.unlock_player_input(player_id)
				else
					--Retry date is an hour later.
					new_date = new_date + (60*60)
					Net.lock_player_input(player_id)
					--We're Worried now.
					Net.set_player_emotion(player_id, 5)
					--Health is 1 because we lost during an event.
					Net.set_player_health(player_id,1)
					--Virologist is upset. Swears based on Battle Network terms.
					Async.await(Async.message_player(player_id, "Bust it all, that was too close!", mug.texture_path, mug.animation_path))
					--Virologist heals us.
					Async.await(Async.message_player(player_id, "I'm sorry. Let me fix you up.", mug.texture_path, mug.animation_path))
					--Heal to max
					ezmemory.set_player_health(player_id, modified_hp)
					--Provide a recover SFX from the server so that we guarantee it exists.
					Net.play_sound_for_player(player_id, "/server/assets/NebuLibsAssets/sound effects/recover.ogg")
					Async.await(Async.message_player(player_id, "I'll log this incident right away.", mug.texture_path, mug.animation_path))
					Async.await(Async.message_player(player_id, "Come back in an hour if you're still willing to help me with my research.", mug.texture_path, mug.animation_path))
					Net.unlock_player_input(player_id)
				end
				--Set reattempt timer.
				player_memory.quest_data["ACDC2Virologist"] = new_date
				--Save the player memory so they can attempt later.
				ezmemory.save_player_memory(safe_secret)
			end
		end)
	end
}]]

local Steal_Money = {
    name = "Steal Money",
    action = function(npc, player_id, dialogue)
        return async(function()
            if ezmemory.spend_player_money(player_id, 999) then
                await(Async.message_player(player_id, "Your money was taken!"))
				print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
                return dialogue.custom_properties["Next 1"]
				else
                return dialogue.custom_properties["No Money"]
			end
        end)
    end
}
eznpcs.add_event(Steal_Money)

local gift_zenny = {
    name = "Gift Monies",
    action = function(npc, player_id, dialogue)
        return async(function()
            local zenny_amount = tonumber(dialogue.custom_properties["Amount"])
            ezmemory.spend_player_money(player_id, -zenny_amount)
            Net.play_sound_for_player(player_id, sfx.item_get)
            await(Async.message_player(player_id, "Got " .. zenny_amount .. "$!"))
            return dialogue.custom_properties["Next 1"]
        end)
    end
}
eznpcs.add_event(gift_zenny)
local event_snow = {
    name = "Snow",
    action = function(npc, player_id, dialogue, relay_object)
        return async(function()
            local area_id = Net.get_player_area(player_id)
            ezweather.start_snow_in_area(area_id)
            return dialogue.custom_properties["Next 1"]
        end)
    end
}
eznpcs.add_event(event_snow)

local event1 = {
    name = "Punch",
    action = function(npc, player_id, dialogue, relay_object)
        return async(function()
            local player_mugshot = Net.get_player_mugshot(player_id)
            local next_dialogues = helpers.extract_numbered_properties(dialogue,"Next ")
            Net.play_sound_for_player(player_id, sfx.hurt)
            await(Async.message_player(player_id, "Bruh!", player_mugshot.texture_path, player_mugshot.animation_path))
            return first_value_from_table(next_dialogues)
        end)
    end
}

--[[local event5 = {
    name = "heelsus",
    action = function(npc, player_id, dialogue, relay_object)
        return async(function()
            local player_mugshot = Net.get_player_mugshot(player_id)
            local next_dialogues = helpers.extract_numbered_properties(dialogue,"Next ")
            
            await(Async.message_player(player_id, "Guess that's it... I should report back!", player_mugshot.texture_path, player_mugshot.animation_path))
            return first_value_from_table(next_dialogues)
        end)
    end
}
eznpcs.add_event(event5)]]--





eznpcs.add_event(event1)
--eznpcs.add_event(VirologistDateCheck)
--eznpcs.add_event(VirologistAssistance)
eznpcs.add_event(GrantLiberationAbility)
eznpcs.add_event(event2)
eznpcs.add_event(RematchProgEvent)