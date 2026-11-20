-- Run with a Lua 5.2+ interpreter from the server root; no ONB runtime needed.
package.preload["scripts/ezlibs-custom/nebulous-liberations/liberations/logger"] = function()
    local noop = function() end
    return {config={debug_data=noop},map_problems={error_data=noop}}
end

local count_list, count_get = 0, 0
local objects = {}
local area_id = "liberation_debuglib_test"
local ids = {}
for id = 1, 1636 do
    ids[#ids + 1] = id
    objects[id] = {id=id, type="Dark Panel", custom_properties={}}
end
objects[10] = {id=10, type="Liberation Enemy Defaults",custom_properties={Category="All", ["Max HP"]=70, ["OW Scale"]=1.5, ["AI Type"]="Patrol"}}
objects[20] = {id=20, type="Liberation Enemy Defaults",custom_properties={Category="Boss", ["Max HP"]=300}}
objects[30] = {id=30, type="Liberation Enemy Defaults",custom_properties={Category="All", ["Max HP"]=90, ["AI Type"]="DefaultAI"}}
objects[40] = {id=40, type="Bot Config",custom_properties={["Max HP"]=275, ["AI Type"]="Fire"}}
objects[50] = {id=50, type="Liberation Enemy Defaults",custom_properties={Category="Buffed Virus", ["Bot Config"]=40, ["OW Scale"]=2}}
objects[60] = {id=60, type="Liberation Enemy Defaults",custom_properties={Category="Boss", ["Max HP"]=400}}
Net={}
function Net.list_objects(id)
    assert(id==area_id)
    count_list = count_list + 1
    return ids
end
function Net.get_object_by_id(id, object_id)
    assert(id==area_id)
    count_get = count_get + 1
    return objects[object_id]
end

local Config = dofile("scripts/ezlibs-custom/nebulous-liberations/liberations/enemy_config.lua")
local regular = {id=9001, type="Dark Hole",custom_properties={}}
local boss = {id=9002, type="Boss Dark Panel",custom_properties={}}
local buffed = {id=9003, type="Dark Hole Buffed Virus",custom_properties={}}

local a = Config.resolve(area_id, regular, "HP", "Dark Hole")
assert(a.max_hp == 90 and a.ai_type == "DefaultAI" and a.ow_scale == nil)
local b = Config.resolve(area_id, boss, "HP", "Boss")
assert(b.max_hp == 400 and b.ai_type == "DefaultAI")
local c = Config.resolve(area_id, buffed, "HP", "Buffed Virus")
assert(c.max_hp == 275 and c.ai_type == "Fire" and c.ow_scale == 2)

for i = 1, 1600 do
    local resolved = Config.resolve(area_id, regular, "HP", "Dark Hole")
    assert(resolved.max_hp == 90)
end
assert(count_list == 1, "defaults index should be built once; list calls=" .. count_list)
assert(count_get <= 1640, "source defaults index should not repeatedly traverse objects; get calls=" .. count_get)

-- Legacy priority and per-object overrides stay intact.
local own = {id=9004,custom_properties={["Max HP"]=115,["Starting HP"]=60,["OW Scale"]=1.25}}
local override = Config.resolve(area_id, own, "HP", "Buffed Virus")
assert(override.max_hp == 115 and override.starting_hp == 60 and override.ow_scale == 1.25)

-- Cleanup removes the cached defaults, so reusing an area ID doesn't inherit
-- stale configuration from an old cloned mission.
Config.clear_area(area_id)
objects[30].custom_properties["Max HP"] = 210
local fresh = Config.resolve(area_id, regular, "HP", "Dark Hole")
assert(fresh.max_hp == 210 and count_list == 2)
print("PASS: priorities, overrides, 1604 resolves with one scan, cleanup and rebuilt area defaults")
