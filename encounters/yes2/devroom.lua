local Encounter1 = {
    name="Encounter1",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=10,
    enemies={
        {name="Mettaur",rank=1},
        {name="Mettaur",rank=2},
        {name="Swordy",rank=1},
        {name="Cannodumb (family)",rank=1},
        {name="Cannodumb (family)",rank=2},
        {name="Ratty",rank=1},
        {name="Ratty",rank=2},
        {name="Fishy",rank=1},
        {name="FighterPlane",rank=1},
        {name="FighterPlane",rank=2},
    },
    obstacles={
        {name="Rock"},
        {name="Rock"},
    },
    positions={
        {0,0,0,1,6,9},
        {0,0,0,2,5,8},
        {0,0,10,4,3,7},
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
}

return {
    minimum_steps_before_encounter=80,
    encounter_chance_per_step=0.05,
    encounters={Encounter1}
}