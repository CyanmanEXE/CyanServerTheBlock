
local encounter1 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Gloomer",rank=1},
        {name="Basher",rank=1},
        
       
    },
    positions = {
        
        {0,0,0,0,1,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,2}
    },
    tiles = {
        {1,1,8,1,1,1},
        {4,1,1,1,1,1},
        {1,1,1,1,1,11}
    },
}



local encounter2 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Ratty",rank=3},--!
        {name="MegaBunny",rank=1},
        {name="MetFire",rank=2},
    },
    positions = {
        
        {0,0,0,0,0,1},
        {0,0,0,0,2,0},
        {0,0,0,0,0,3}
    },
    tiles = {
        {9,1,9,1,9,1},
        {1,9,1,9,9,9},
        {9,1,9,1,9,1}
    },
    obstacles = {
        {name="Rock"},
    },
    obstacle_positions = {
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,1,0,0,0}
    },
    
}

local encounter3 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Cacter",rank=5},
        {name="HardHead",rank=1},
        {name="Elemperor",rank=2},
    },
    positions = {
        
        {0,0,0,0,0,1},
        {0,0,0,2,0,0},
        {0,0,0,0,3,0}
    },
    tiles = {
        {1,5,1,9,1,9},
        {1,12,12,1,9,1},
        {1,1,1,1,9,1}
    },
    
}

local encounter4 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Flashy",rank=1},--!
        {name="CirSmash",rank=1},
        
    },
    positions = {
        
        {0,0,0,0,0,0},
        {0,0,0,0,1,0},
        {0,0,0,0,0,2}
    },
    
}

local encounter5 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Puffy",rank=3},
        {name="Canodumb",rank=3},
        {name="Sniper",rank=1},
    },
    positions = {
        
        {0,0,0,0,2,1},
        {0,0,0,0,0,0},
        {0,0,0,0,0,3}
    },
    obstacles = {
        {name="IceCube"},
    },
    obstacle_positions = {
        {1,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,1,0,0}
    },    
    tiles = {
        {1,1,3,1,1,1},
        {3,1,3,1,1,1},
        {3,1,1,1,1,1}
    },
    
}



return {
    minimum_steps_before_encounter=90,
    encounter_chance_per_step=0.7,
    encounters={encounter1, encounter2, encounter3, encounter4, encounter5}
}


