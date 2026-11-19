-- Run at server root: texlua scripts/player-interface/tests/unified.lua
-- Isolated ONB Net mock validating single-entry initialization, camera
-- activation guards, input session lifetime, and the shared input registry.
package.path = './?.lua;./?/init.lua;' .. package.path
local events = {}
local calls = {lock=0,unlock=0,follow=0,move=0,slide=0}
local areas = {p1='liberation_test', p2='normal_area'}
Net = {}
function Net:on(name,fn)
    events[name] = events[name] or {}
    events[name][#events[name] + 1] = fn
end
local function emit(name,data)
    for _,fn in ipairs(events[name] or {}) do fn(data or {}) end
end
function Net.lock_player_input(pid) calls.lock=calls.lock+1 end
function Net.unlock_player_input(pid) calls.unlock=calls.unlock+1 end
function Net.unlock_player_camera(pid) end
function Net.track_with_player_camera(pid) calls.follow=calls.follow+1 end
function Net.move_player_camera(pid,x,y,z) calls.move=calls.move+1 end
function Net.slide_player_camera(pid,x,y,z,duration) calls.slide=calls.slide+1 end
function Net.toggle_player_hud(pid) end
function Net.get_player_position(pid) return {x=1,y=2,z=0} end
function Net.get_player_area(pid) return areas[pid] end
function Net.is_player(pid) return areas[pid]~=nil end
local Players = require('scripts/player-interface/main')
assert(Players == require('scripts/player-interface/main'), 'single cached public module')
assert(Players.Input == require('scripts/player-interface/input/api'), 'one input registry')
assert(Players.Control == require('scripts/player-interface/control'), 'one control registry')
assert(#events.player_join==3, 'one input, one camera, and one logger join handler')
assert(#events.virtual_input==1, 'only one virtual_input listener')
assert(#events.tile_interaction==1, 'only one camera tile listener')
assert(type(Players.begin)=='function' and type(Players.get_controller)=='function')
assert(type(Players.create_controller)=='function' and type(Players.acquire_capture)=='function')
assert(type(Players.begin_scripted_camera)=='function')
assert(type(Players.activate_free_camera)=='function')
for _,pid in ipairs({'p1','p2'}) do emit('player_join',{player_id=pid}) end
assert(Players.get_input_controller('p1')==Players.get_controller('p1'))
assert(Players.get_camera_controller('p1')~=nil)
assert(package.loaded['scripts/camera/main']==nil,'no legacy camera module required')
-- A late plugin load can lazily provision a camera for an existing player.
local before = Players.get_camera_controller('p2')
Players.Camera.PlayerControllers.p2=nil
assert(Players.get_camera_controller('p2')~=nil,'late-loaded camera provisioned')
assert(Players.get_camera_controller('p2')~=before,'new camera shares the registry')
local camera = Players.get_camera_controller('p1')
emit('tile_interaction',{player_id='p1',button=1})
assert(not camera.is_active,'liberation instance must prevent free camera')
areas.p1='footbomb_p1_123'
emit('tile_interaction',{player_id='p1',button=1})
assert(not camera.is_active,'footbomb instance must prevent free camera')
areas.p1='normal_area'
local ctx=assert(Players.begin('p1',{owner='test_menu',profile='menu'}))
assert(calls.lock==1,'managed input lock acquired')
emit('tile_interaction',{player_id='p1',button=1})
assert(not camera.is_active,'menu focus must prevent camera activation')
ctx:close()
assert(calls.unlock==1,'managed input lock released')
emit('tile_interaction',{player_id='p1',button=1})
assert(camera.is_active,'free camera activates after menu closes')
assert(Players.is_free_camera_active('p1'))
assert(calls.lock==2,'free camera owns engine lock')
assert(Players.get_controller('p1'):get_input_owner()~=nil,'free camera owns logical focus')
assert(Players.deactivate_free_camera('p1',false))
assert(not camera.is_active and calls.unlock==2,'free camera releases its lock')
local scripted=assert(Players.begin_scripted_camera('p1','test:cinematic'))
assert(calls.lock==3,'cinematic owns input capture')
local api=assert(scripted:camera())
assert(api:move_to(3,4,0),'move scripted camera')
assert(api:slide_to(5,6,0,0.5),'slide scripted camera')
assert(api:follow_player(),'restore scripted camera tracking')
assert(calls.move==1 and calls.slide==1)
assert(not Players.activate_free_camera('p1',Players.CameraMode.Custom,true),
       'free camera cannot override an existing scripted camera')
assert(scripted:close())
assert(calls.unlock==3,'cinematic release input once')
-- Capture scopes are independent per owner and reference counted.
assert(Players.acquire_capture('p1','mission:intro'))
assert(Players.acquire_capture('p1','mission:turn'))
assert(calls.lock==4,'overlapping capture owners only lock once')
assert(Players.release_capture('p1','mission:intro'))
assert(calls.unlock==3,'intro completion cannot unlock turn capture')
assert(Players.release_capture('p1','mission:turn'))
assert(calls.unlock==4,'last capture releases input')
areas.p1=nil -- simulate Net.is_player returning false after disconnect
emit('player_disconnect',{player_id='p1'})
assert(Players.get_controller('p1')==nil,'input removed at disconnect')
assert(Players.get_camera_controller('p1')==nil,'camera removed at disconnect')
print('PlayerInterface unified API tests passed')
