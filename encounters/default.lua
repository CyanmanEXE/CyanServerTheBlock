
local encounter1 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Mettaur",rank=6},--!
        {name="Powie3",rank=3},
        
       
    },
    positions = {
        
        {0,0,0,0,0,1},
        {0,0,0,0,2,0},
        {0,0,0,0,2,0}
    },
    obstacles = {
        {name="BlastCube"},
    },
    obstacle_positions = {
        {0,0,0,0,1,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,0}
    },    
    
    
}



local encounter2 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="MegaBunny",rank=1},--!
        {name="Metrid",rank=4},
        
    },
    positions = {
        
        {0,0,0,0,2,0},
        {0,0,0,1,0,0},
        {0,0,0,0,0,1}
    },
    tiles = {
        {2,1,1,1,1,1},
        {1,1,2,1,1,1},
        {1,2,1,1,1,1}
    },
    
}

local encounter3 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="WindBox",rank=8}--!
    },
    positions = {
        
        {0,0,0,0,0,0},
        {0,0,0,0,0,1},
        {0,0,0,0,0,0}
    },
    tiles = {
        {14,1,1,1,1,1},
        {14,1,1,1,1,1},
        {14,1,1,1,1,1}
    },
    
}

local encounter4 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="CirSmash",rank=1},--!
        
    },
    positions = {
        
        {0,0,0,0,1,0},
        {0,0,0,0,0,0},
        {0,0,0,0,1,0}
    },
    
}

local encounter5 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Skelly",rank=4},--!
        {name="Elemperor",rank=4},
        {name="Tark",rank=1},
    },
    positions = {
        
        {0,0,0,1,0,0},
        {0,0,0,0,0,2},
        {0,0,0,0,3,0}
    },
    obstacles = {
        {name="Rock"},
    },
    obstacle_positions = {
        {0,0,0,0,0,0},
        {0,0,0,0,1,0},
        {0,0,0,0,0,0}
    },
    tiles = {
        {8,1,1,1,1,1},
        {2,1,1,1,1,12},
        {8,1,1,1,1,1}
    },
    
}

return {
    minimum_steps_before_encounter=230,
    encounter_chance_per_step=0.2,
    encounters={encounter1, encounter2, encounter3, encounter4, encounter5}
}


