function onRaid()
    if getGlobalStorageValue(10) < 1 then
        Game.createMonster("The Flaming Orchid", Position(6615, 997, 3))
        Game.createMonster("Lich", Position(6596, 1013, 6))
        Game.createMonster("Lich", Position(6598, 1014, 6))
        Game.createMonster("Destroyer", Position(6609, 1005, 6))
        Game.createMonster("Destroyer", Position(6611, 1004, 6))
        Game.createMonster("Massive Fire Elemental", Position(6633, 1006, 6))
        Game.createMonster("Massive Fire Elemental", Position(6633, 1001, 6))
        Game.createMonster("Vamprire Bride", Position(6639, 1012, 3))
        Game.createMonster("Vamprire Bride", Position(6639, 1007, 6))
        Game.createMonster("Vamprire Viscount", Position(6643, 1009, 6))
        --monster:setReward(true)
        setGlobalStorageValue(10, 1)
    else
        return false
    end
end