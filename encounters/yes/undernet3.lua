
local encounter1 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Yurt",rank=1},--add in!
        
        
        
    },
    positions = {
        
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,1,0,0}
    },  
    
}

local encounter2 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Yurt",rank=1},
        
        
      
        
    },
    positions = {
        
        {0,0,0,1,0,0},
        {0,0,0,0,0,0},
        {0,0,0,0,1,0}
    },
   
}

local encounter3 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Spikey",rank=3},
        {name="Spikey",rank=2},
    },
    positions = {
        
        {0,0,0,0,2,0},
        {0,0,0,1,0,0},
        {0,0,0,0,2,0}
    },
   
}


local encounter4 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Swordy",rank=2},
        {name="Spikey",rank=2},
        {name="Yurt",rank=1},
        
    },
    positions = {
        
        {0,0,0,0,0,1},
        {0,0,0,0,2,0},
        {0,0,0,3,0,0}
    },
    
   
}

local encounter5 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Spikey",rank=3},
        
        
    },
    positions = {
        
        {0,0,0,0,0,0},
        {0,0,0,0,0,2},
        {0,0,0,1,0,0}
    },
    tiles = {
        {1,1,13,13,1,1},
        {1,1,13,13,1,1},
        {1,1,13,13,1,1}
    },
   
}


local encounter6 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Fishy",rank=3},
        {name="Metrid",rank=1},
    
        
    },
    positions = {
        
        {0,0,0,0,0,1},
        {0,0,0,0,0,0},
        {0,0,0,0,2,0}
    },
    tiles = {
        {1,1,13,13,1,1},
        {1,1,13,13,1,1},
        {1,1,13,13,1,1}
    },
    
    
}


local encounter7 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Volcano",rank=1},
        {name="Fishy",rank=3},
    },
    positions = {
        
        {0,0,0,0,0,2},
        {0,0,0,0,0,0},
        {0,0,0,0,1,0}
    },
    tiles = {
        {1,1,1,13,13,1},
        {1,1,13,13,13,1},
        {1,13,13,1,1,1}
    },
    
}


local encounter8 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Spikey",rank=3},
        {name="Spikey",rank=2},
        {name="Volcano",rank=1},
        
    },
    positions = {
        
        {0,0,0,2,0,0},
        {0,0,0,0,3,0},
        {0,0,0,0,0,1}
    },
    tiles = {
        {1,1,1,13,13,1},
        {1,1,13,13,13,1},
        {1,13,13,1,1,1}
    },
}


local encounter9 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Fishy",rank=3},
        
        
        
    },
    positions = {
        
        {0,0,0,0,1,0},
        {0,0,0,0,0,0},
        {0,0,0,1,0,0}
    },
    tiles = {
        {13,1,1,1,1,13},
        {13,1,1,1,1,13},
        {13,1,1,1,1,13}
    },
   
}

local encounter10 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Swordy",rank=2},
        
        
    },
    positions = {
        
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,0,1,0}
    },
    tiles = {
        {13,1,1,1,1,13},
        {13,1,1,1,1,13},
        {13,1,1,1,1,13}
    },
   
}

local encounter11 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Spikey",rank=3},
        {name="Spikey",rank=2},
        {name="Volcano",rank=1},
        
    },
    positions = {
        
        {0,0,0,0,3,0},
        {0,0,0,2,0,0},
        {0,0,0,0,0,1}
    },
    tiles = {
        {1,1,13,1,1,1},
        {1,1,1,1,1,1},
        {1,13,1,1,13,1}
    },
}

local encounter12 = {
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=8,
    enemies = {
        {name="Yurt",rank=1},
        {name="Volcano",rank=1},
        
    },
    positions = {
        
        {0,0,0,0,1,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,2}
    },
    tiles = {
        {13,1,1,1,1,13},
        {1,1,13,13,1,1},
        {1,1,13,13,1,1}
    },
}

return {
    minimum_steps_before_encounter=230,
    encounter_chance_per_step=0.2,
    encounters={encounter1, encounter2, encounter3, encounter4, encounter5, encounter6, encounter7, encounter8, encounter9, encounter10, encounter11, encounter12}
}


