
local encounter1 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="GigaCorn",rank=1},--!
        {name="OldBurner",rank=1},
        {name="Volgear",rank=3},
        {name="Metrid",rank=3},
    },
    positions = {
        
        {0,0,0,0,0,2},
        {0,0,0,0,0,1},
        {0,0,0,4,3,0}
    },
    tiles = {
        {2,1,8,1,1,11},
        {1,1,9,9,9,9},
        {1,8,2,11,1,11}
    },
}



local encounter2 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Fishy",rank=4},
    },
    positions = {
        
        {0,0,0,0,0,1},
        {0,0,0,0,1,0},
        {0,0,0,1,0,0}
    },
    tiles = {
        {5,5,5,5,5,5},
        {11,1,1,1,1,1},
        {11,1,1,1,1,1}
    },
    obstacles = {
        {name="IceCube"},
    },
    obstacle_positions = {
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,1}
    },
    
}

local encounter3 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="JokerEye",rank=1},--!
        {name="WindBox",rank=8},
        {name="Chimpy",rank=1},
    },
    positions = {
        
        {0,0,0,0,0,3},
        {0,0,0,1,0,0},
        {0,0,0,0,0,2}
    },
    
}

local encounter4 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Bladia6",rank=1},--!
        {name="ColdHead",rank=1},
        
    },
    positions = {
        
        {0,0,0,2,0,0},
        {0,0,0,2,0,1},
        {0,0,0,2,0,0}
    },
    
}

local encounter5 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Canosmart",rank=1},--!
        {name="Doomer",rank=1},
        {name="Metrid",rank=4},
    },
    positions = {
        
        {0,0,0,0,0,1},
        {0,0,0,0,2,3},
        {0,0,0,0,0,1}
    },
    tiles = {
        {1,1,6,1,1,1},
        {7,1,6,1,1,1},
        {1,1,6,1,1,1}
    },
    
}

local encounter6 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Catack",rank=4},--!
        {name="Fishy",rank=3},
        {name="Metrid",rank=1},
        {name="Gloomer",rank=1},

    },
    positions = {
        
        {0,0,0,1,0,0},
        {0,0,0,0,2,0},
        {0,0,0,3,0,4}
    },
    
}


local encounter7 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Powie3",rank=5},--!
        {name="FighterPlane",rank=4},
        {name="Canosmart",rank=1},
        {name="JokerEye",rank=1},
    },
    positions = {
        
        {0,0,0,0,1,4},
        {0,0,0,0,0,2},
        {0,0,0,0,1,3}
    },
    
}



local encounter8 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Basher",rank=1},--!
        {name="VacuumFan",rank=4},
        {name="Canodumb",rank=3},
        
    },
    positions = {
        
        {0,0,0,0,0,3},
        {0,0,0,0,2,1},
        {0,0,0,0,0,3}
    },
    tiles = {
        {2,1,1,1,9,1},
        {1,12,1,1,1,1},
        {14,1,2,1,9,1}
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

local encounter9 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Mettaur",rank=3},--!
        {name="Mettaur",rank=4},
        {name="Mettaur",rank=5},
    },
    positions = {
        
        {0,0,0,1,0,1},
        {0,0,0,0,2,0},
        {0,0,0,3,0,3}
    },
}

local encounter10 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="WindBox",rank=8},--!
        {name="HotHead",rank=1},
        
    },
    positions = {
        
        {0,0,0,0,2,0},
        {0,0,0,0,2,1},
        {0,0,0,0,2,0}
    },
    tiles = {
        {1,1,1,8,1,1},
        {11,1,11,1,1,1},
        {1,1,1,8,1,1}
    },
}

local encounter11 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies = {
        {name="Bladia6",rank=1,},--!

        
    },
    positions = {
        
        {0,0,0,0,0,1},
        {0,0,0,0,0,1},
        {0,0,0,0,0,1}
    },
    tiles = {
        {1,1,1,11,11,11},
        {1,1,1,11,11,11},
        {1,1,1,11,11,11}
    },
    obstacles = {
        {name="RockCube"},
    },
    obstacle_positions = {
        {0,0,1,1,0,0},
        {0,0,1,1,0,0},
        {0,0,1,1,0,0}
    },    
}


return {
    minimum_steps_before_encounter=90,
    encounter_chance_per_step=0.7,
    encounters={encounter1, encounter2, encounter3, encounter4, encounter5, encounter6, encounter7, encounter8, encounter9, encounter10, encounter11}
}


