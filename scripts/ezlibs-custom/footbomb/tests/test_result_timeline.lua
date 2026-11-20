-- Offline regression: FootBomb projected travel and readable matching catches.
-- Run from the server root:
--   texlua scripts/ezlibs-custom/footbomb/tests/test_result_timeline.lua
local Timeline = dofile('scripts/ezlibs-custom/footbomb/result_timeline.lua')
local function near(a,b,tol)
    assert(type(a)=='number' and type(b)=='number' and math.abs(a-b)<=(tol or 1e-8),
        string.format('expected %.9f == %.9f', tonumber(a) or -1, tonumber(b) or -1))
end
local function P(x,y) return {x=x,y=y,z=0} end
local function plan(args)
    local value,error_message=Timeline.plan_response(args)
    assert(value,error_message)
    return value
end
-- Isometric projected speed continues to apply across every direction.
near(Timeline.projected_distance(P(0,0),P(1,1),64,32),1)
near(Timeline.projected_distance(P(0,0),P(1,-1),64,32),2)
for _,delta in ipairs({P(1,1),P(1,-1),P(2,0),P(0,2)}) do
    local projected=Timeline.projected_distance(P(0,0),delta,64,32)
    local duration=Timeline.travel_duration(P(0,0),delta,9,64,32)
    near(duration,math.max(0.12,projected/9))
end
-- Both renderer target and planner must use the same contact elapsed time.
local t,r=Timeline.catch_contact_elapsed(1,0.70)
near(t,0.70);near(r,0.70)
near(Timeline.catch_contact_elapsed(1,0.1),0.5)  -- bounded
near(Timeline.catch_contact_elapsed(1,2.0),0.9)
local count=0
for _,kick in ipairs({'Left','Up','Right'}) do
    for _,defense in ipairs({'Left','Up','Right'}) do
        local matching = kick==defense and kick~='Up'
        local center = kick=='Up' and defense=='Up'
        local candidate=plan({
            bomb_start=P(10,10),
            bomb_target=P(kick=='Left' and 13 or (kick=='Right' and 7 or 10),
                kick=='Left' and 11 or (kick=='Right' and 9 or 6)),
            catch_target=(matching or center) and P(10,8) or nil,
            bomb_speed=9,tile_width=64,tile_height=32,
            jump_movement_duration=defense~='Up' and 1 or 0,
            jump_animation_duration=defense~='Up' and 1.1 or 0,
            matching_jump=matching,center_catch=center,
            catch_minimum_duration=0.70,catch_contact_ratio=0.70,
        })
        assert(candidate.bomb_duration>0)
        assert(candidate.bomb_duration+1e-8>=candidate.natural_bomb_duration)
        near(candidate.bomb_delay,0) -- no fast burst after a long launch pause
        if matching then
            near(candidate.contact_elapsed,0.70)
            near(candidate.contact_ratio,0.70)
            assert(candidate.bomb_duration>=0.70)
            near(candidate.contact_time,candidate.bomb_duration)
            near(candidate.contact_time,candidate.defender_delay+0.70)
            near(candidate.ball_end,candidate.defender_end)
        elseif center then
            assert(candidate.bomb_duration>=0.70)
            near(candidate.defender_delay,0)
        else
            near(candidate.bomb_duration,candidate.natural_bomb_duration)
            near(candidate.defender_delay,0)
        end
        count=count+1
    end
end
assert(count==9)
-- Short flight used to arrive instantly; now remains in motion for 0.70s.
local short=plan({bomb_start=P(0,0),catch_target=P(.01,.01),bomb_target=P(5,5),
    bomb_speed=9,matching_jump=true,jump_movement_duration=1,
    jump_animation_duration=1.1,catch_minimum_duration=.70,catch_contact_ratio=.70})
assert(short.natural_bomb_duration<.70)
near(short.bomb_duration,.70);near(short.defender_delay,0)
near(short.contact_time,.70)
-- Long shot never accelerates to meet the jump; the defender begins later.
local long=plan({bomb_start=P(0,0),catch_target=P(15,15),bomb_target=P(9,9),
    bomb_speed=3,matching_jump=true,jump_movement_duration=1,
    jump_animation_duration=1.1,catch_minimum_duration=.70,catch_contact_ratio=.70})
assert(long.natural_bomb_duration>.70)
near(long.bomb_duration,long.natural_bomb_duration)
assert(long.defender_delay>0)
near(long.contact_time,long.defender_delay+.70)
-- Center catch must have a visible flight despite lacking a jump animation.
local center=plan({bomb_start=P(0,0),catch_target=P(.01,.01),bomb_target=P(5,5),
    bomb_speed=9,center_catch=true,catch_minimum_duration=.70})
near(center.bomb_duration,.70);near(center.contact_time,.70)
-- Missing an authored Ball point never manufactures a visual catch.
local fallback=plan({bomb_start=P(0,0),bomb_target=P(5,5),
    bomb_speed=9,matching_jump=true,jump_movement_duration=1,
    jump_animation_duration=1.1})
assert(not fallback.matching_jump and fallback.bomb_destination.x==5)
near(fallback.bomb_duration,fallback.natural_bomb_duration)
-- Frame clock and follower sampling unchanged.
local state={framelist={{duration=.1},{duration=.2},{duration=.5},{duration=.2},{duration=.1}}}
local timing=Timeline.state_timing(state)
near(timing.movement_duration,1);near(timing.total_duration,1.1)
local samples=Timeline.sample_times(0,1,0.05)
assert(#samples==21);near(samples[1],0);near(samples[#samples],1)
for i=2,#samples do assert(samples[i]>samples[i-1]) end
-- Source-integration guard: the planner's flight duration must reach BOTH
-- matching catch and center/miss Net.animate_bot_properties dispatch paths.
local f=assert(io.open('scripts/ezlibs-custom/footbomb/main.lua','r'))
local main_source=f:read('*a'); f:close()
local _,overrides=main_source:gsub('nil, response_plan%.bomb_duration','')
assert(overrides==2,'planned flight duration not forwarded for both ball tracks')
assert(main_source:find('ResultTimeline.catch_contact_elapsed',1,true),
    'world-space catch point must be sampled using the planner contact ratio')
print('PASS: projected motion, 9 directions, matching/center catch windows, no acceleration, fallback, frame clock, runtime integration')
