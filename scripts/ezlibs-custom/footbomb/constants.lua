-- FootBomb configuration.
-- Keep values grouped by responsibility so UI, assets, input, and match tuning
-- can be adjusted independently of lifecycle code.
local ASSET_ROOT = "/server/assets/net-game-footbomb/"
local BOT_ASSET_FOLDER = ASSET_ROOT .. "bots/"
local SCREEN_CENTER = { x = 120, y = 80 }

local constants = {
    -- Expensive, verbose diagnostics are disabled during normal gameplay.
    -- Enable either flag temporarily when investigating mappings or assets.
    DIAGNOSTICS = {
        RUN_ANIMATION_DIAGNOSTICS = false,
        RUN_DIRECTION_MAPPING_TEST = false,
        -- Log every sampled Ball attachment location during timing diagnosis.
        -- Off in normal play to avoid 20+ log writes per moving catch.
        RUN_RESULT_TIMING_DIAGNOSTICS = false,
    },

    DEFAULTS = {
        -- Default match template, NOT a referee/source/lobby area ID.
        -- The actual source area is discovered from Tiled referee objects.
        INSTANCE_MAP = "footbomb",
        POINTS_TO_WIN = 10,
        -- Preserve the current final-chance rule unless the host turns it off.
        GRACE_ENABLED = true,
        ASSET_NAME = "ref-prog",
        MUGSHOT_NAME = "ref-prog-mug",
    },

    ASSETS = {
        BOT_FOLDER = BOT_ASSET_FOLDER,
        MUG_FOLDER = BOT_ASSET_FOLDER,
        BOMB_FOLDER = ASSET_ROOT .. "bombs/",
        DEFAULT_MUG_ANIMATION = BOT_ASSET_FOLDER .. "mug.animation",
        CURSOR_TEXTURE = "/server/assets/net-games/cursors/text_cursor.png",
        VIBRANT_CURSOR_TEXTURE = "/server/assets/net-games/cursors/vibrant_text_cursor.png",
        CURSOR_ANIMATION = "/server/assets/net-games/cursors/text_cursor.animation",
        CURSOR_SFX = "/server/assets/net-games/sfx/cursor_move.ogg",
        SCOREBOARD_TEXTURE = ASSET_ROOT .. "ui/score-board.png",
        SCOREBOARD_ANIMATION = ASSET_ROOT .. "ui/score-board.animation",
        FINAL_SCORE_SFX = ASSET_ROOT .. "sfx/winner.ogg",
        THUD_SFX = ASSET_ROOT .. "sfx/item-thud.ogg",
        ROLE_PANEL_TEXTURE_KICKER = ASSET_ROOT .. "ui/kicker-role-box-9slice.png",
        ROLE_PANEL_TEXTURE_DEFENDER = ASSET_ROOT .. "ui/defender-role-box-9slice.png",
        -- Both role-specific textures use the shared 9-slice animation definition.
        ROLE_PANEL_ANIMATION = ASSET_ROOT .. "ui/role-box-9slice.animation",
        ROLE_ICONS_TEXTURE = ASSET_ROOT .. "ui/role-icons.png",
        ROLE_ICONS_ANIMATION = ASSET_ROOT .. "ui/role-icons.animation",
    },

    UI = {
        OFF_MAP_POSITION = { x = -1000, y = -1000, z = 0 },
        CONFIRM_PROMPT = "Press A To Confirm",
        CONFIRM_PROMPT_SCALE = 2.0,
        CONFIRM_PROMPT_Y = 5,
        NAVI_NAME_SCALE = 1.5,
        SCREEN_WIDTH = 240,
        SCREEN_HEIGHT = 160,
        SCOREBOARD_X = SCREEN_CENTER.x - 100,
        SCOREBOARD_Y = SCREEN_CENTER.y - 50,
        SCOREBOARD_SCALE = 2.0,
        SCORE_BOX_PLAYER_ONE_X = 67,
        SCORE_BOX_PLAYER_TWO_X = 122,
        SCORE_BOX_Y = 54,
        SCORE_BOX_WIDTH = 52,
        SCORE_BOX_HEIGHT = 55,
        SCORE_TEXT_SCALE = 4.0,
        ROLE_TEXT_Y = 142,
        ROLE_TEXT_SCALE = 2.0,
        ROLE_PANEL_Y = 260,
        -- Keep horizontal inset at 6 while adding a little more room above/below.
        ROLE_PANEL_PADDING = { horizontal = 6, vertical = 8 },
        -- Small inset on every side of each role-panel child. The sliced-panel
        -- layout includes this child padding in its measured auto-size.
        ROLE_PANEL_CHILD_PADDING = 2,
        ROLE_PANEL_SLICE_SCALE = 2.0,
        ROLE_ICON_SCALE = 1.0,
        -- Horizontal gap between the left icon, role text, and right icon.
        ROLE_ICON_GAP = 8,
        ROLE_ICON_STATE_KICKER = "KICKER",
        ROLE_ICON_STATE_DEFENDER = "DEFENSE",
        -- Character mug portraits sit on the matching score side.
        SCORE_PLAYER_ONE_MUG_X = 24,
        SCORE_PLAYER_TWO_MUG_X = 176,
        SCORE_MUG_Y = SCREEN_CENTER.y - 24,
        SCORE_MUG_SCALE = 2.0,
        BOMB_SELECTOR_SCALE = 2.0,
        BOMB_CURSOR_LEFT_X = SCREEN_CENTER.x - 28,
        BOMB_CURSOR_RIGHT_X = SCREEN_CENTER.x + 34,
        BOMB_CURSOR_Y = SCREEN_CENTER.y + 12,
        BOMB_PREVIEW_X = SCREEN_CENTER.x - 17,
        BOMB_PREVIEW_Y = SCREEN_CENTER.y + 4,
        DIRECTION_CURSOR_X = { 40, SCREEN_CENTER.x, 200 },
        DIRECTION_CURSOR_Y = SCREEN_CENTER.y - 18,
        DIRECTION_CURSOR_SCALE = 2.0,
        DIRECTION_CURSOR_BOB_OFFSET = 5,
        DIRECTION_CURSOR_BOB_TICKS = 2,
    },

    INPUT = {
        DIRECTION_SETTLE_SECONDS = 0.30,
    },

    DIRECTIONS = {
        CHOICES = { "Left", "Up", "Right" },
    },

    GAMEPLAY = {
        -- All translational speeds are in projected isometric half-tile-width
        -- units per second, not raw map x/y tiles per second. The ball's old
        -- effective speed was 3 * 3; store that 9 directly to avoid a hidden
        -- multiplier and catch-specific speed overrides.
        RESULT_KICKER_WALK_UR_SPEED = 3,
        RESULT_KICKER_WALK_U_SPEED = 3,
        RESULT_BOMB_MOVE_SPEED = 9,
        -- Successful catches use a readable contact window. A fast natural
        -- flight must not snap to a defender's hand before the jump has visibly
        -- progressed. Misses still use RESULT_BOMB_MOVE_SPEED unchanged.
        RESULT_CATCH_MIN_FLIGHT_SECONDS = 0.70,
        -- Contact within the authored Left/Right jump movement interval. This
        -- is also used to sample the exact matching Ball attachment point.
        RESULT_CATCH_JUMP_CONTACT_RATIO = 0.70,
        -- The authored jump animation controls its duration. 5 is neutral
        -- linear traversal progress along the original shallow Bezier arc.
        RESULT_DEFENDER_JUMP_SPEED = 5,
        -- Sampling cadence for the client-side position keyframes. No server-
        -- tick position polling; one interpolated track per movement.
        RESULT_JUMP_SAMPLE_SECONDS = 0.05,
        RESULT_ATTACHMENT_SAMPLE_SECONDS = 0.05,
        -- Single insurance reassert for the non-looping jump -> looping END
        -- transition. Reasserting repeatedly every 0.2s reset the pose.
        RESULT_END_POSE_REASSERT_SECONDS = 0.08,
        -- Render the attached ball in front of the defender using bot depth.
        RESULT_BALL_Z_LIFT = 4,
    },
}

return constants
