local bosses = {
	['deathstrike'] = {status = 2},
	['gnomevil'] = {status = 3},
	['abyssador'] = {status = 4},
}
function onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end
	local bossConfig = bosses[targetMonster:getName():lower()]
	if not bossConfig then
		return true
	end
	for pid, _ in pairs(targetMonster:getDamageMap()) do
		local attackerPlayer = Player(pid)
		if attackerPlayer then
			if attackerPlayer:getStorageValue(Storage.BigfootBurden.WarzoneEntry) < bossConfig.status then
				attackerPlayer:setStorageValue(Storage.BigfootBurden.WarzoneEntry, bossConfig.status)
			end
		end
	end
end