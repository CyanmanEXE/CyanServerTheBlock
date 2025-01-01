
local encounter1 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Chimpy",rank=1},
        {name="Skelly",rank=1},
        {name="HauntedCandle",rank=3},
        
    },
    positions = {
        
        {0,0,0,0,1,0},
        {0,0,0,2,0,0},
        {0,0,0,0,0,3}
    },
    tiles = {
        {1,1,13,1,1,13},
        {1,1,13,1,13,1},
        {1,1,13,13,1,1}
    },

}



local encounter2 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Elemperor",rank=3},
        {name="HotHead",rank=3},
    },
    positions = {
        
        {0,0,0,0,0,2},
        {0,0,0,0,2,0},
        {0,0,0,0,0,1}
    },
    tiles = {
        {13,1,1,13,1,1},
        {1,1,1,1,1,13},
        {1,1,13,1,1,13}
    },
    obstacles = {
        {name="RockCube"},
    },
    obstacle_positions = {
        {0,0,0,0,0,0},
        {0,0,0,1,0,0},
        {0,0,0,0,0,0}
    },
   
}

local encounter3 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="MetFire",rank=4},
        {name="Volcano",rank=3},
        {name="Spikey",rank=3},
    },
    positions = {
        
        {0,0,0,0,0,2},
        {0,0,0,3,0,0},
        {0,0,0,0,0,1}
    },
    tiles = {
        {13,1,13,13,1,1},
        {1,1,1,1,1,1},
        {1,1,13,13,1,13}
    },
  
}

local encounter4 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Fishy",rank=2},--!
        {name="HauntedCandle",rank=3},
        
    },
    positions = {
        
        {0,0,0,0,0,2},
        {0,0,0,0,1,0},
        {0,0,0,0,0,0}
    },
    tiles = {
        {1,1,1,13,13,1},
        {1,1,1,13,13,1},
        {1,1,1,13,13,1}
    },
 
}

local encounter5 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Cragger",rank=8},
        
    },
    positions = {
        
        {0,0,0,0,0,0},
        {0,0,0,0,0,1},
        {0,0,0,0,0,0}
    },
    tiles = {
        {1,1,13,13,1,1},
        {1,1,1,13,1,1},
        {1,1,13,13,1,1}
    },
  
}






return {
    minimum_steps_before_encounter=90,
    encounter_chance_per_step=0.7,
    encounters={encounter1, encounter2, encounter3, encounter4, encounter5}
}


