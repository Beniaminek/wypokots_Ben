function onRaid()
 local monster = Game.createMonster("The Flaming Orchid", Position(6615, 997, 3))
 monster:setReward(true)
 setGlobalStorageValue(10, 1)
end