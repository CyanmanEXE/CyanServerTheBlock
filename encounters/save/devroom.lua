local Encounter1 = {
    name="Encounter1",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=50,
    enemies={
        {name="Mettaur",rank=1},
        {name="Champy",rank=2,nickname="boi"},
        {name="Fishy",rank=1,nickname="nah"},
    },
    obstacles={
    },
    positions={
        {0,0,0,3,0,0},
        {0,0,0,1,0,2},
        {0,0,0,0,0,0},
    },
    obstacle_positions={
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {1,1,1,2,3,4},
        {1,1,1,5,8,11},
        {1,1,1,15,9,13},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
    music={
        path="bn1_battle_xg.mid"
    }
}

local Encounter2 = {
    name="Encounter2",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=10,
    enemies={
        {name="Volcano",rank=1,nickname="hah"},
    },
    obstacles={
    },
    positions={
        {0,0,0,0,0,0},
        {0,0,0,1,0,0},
        {0,0,0,0,0,0},
    },
    obstacle_positions={
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {1,1,1,1,1,1},
        {1,1,1,1,1,1},
        {1,1,1,1,1,1},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
    music={
        path="bn4.mid"
    }
}

return {
    minimum_steps_before_encounter=80,
    encounter_chance_per_step=0.05,
    encounters={Encounter1,Encounter2}
}