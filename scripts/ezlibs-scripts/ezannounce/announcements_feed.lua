local announcments = {
    {
        id = "ANN_EXAMPLE_001",
        icon = 1,
        title = "Taco Mail",
        from = "Cyan",
        body = "HIIIIIIIII.\nTHIS IS JUST A TEST!.",
        mug_texture_path = "/server/assets/ezlibs-assets/eznpcs/mug/denpa-warp-sf2.png",
        mug_animation_path = "/server/assets/ezlibs-assets/eznpcs/mug/mug.animation",
        --starts_at = 0,        -- optional: timestamp when it becomes active
        --ends_at = nil,        -- optional: expiry timestamp
        --priority = 1,         -- higher = more likely to trigger the ring
        notify_message = "Hey...tacos...",
    }
}
return announcments