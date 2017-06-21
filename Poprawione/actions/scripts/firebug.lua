local function checkFlowers( player )
	local heaven_blossoms = {11012,11013,11014,11015,11016}
-- idki malz
	for key,value in pairs(heaven_blossoms) do -- sprawdznie czy alles wziete
		if player:getStorageValue( value ) < 1 then
			return false
		end
	end
	player:setStorageValue(11011,2)
	return true
end
-- The Ape City Quest --
local campfirePosition = Position(6501, 592, 7)

local function revertCampfire(position)
	local campfire = Tile(position):getItemById(1423)
	if campfire then
		campfire:transform(1422)
	end
end
------------------------

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
local drunk = Condition(CONDITION_DRUNK)
drunk:setParameter(CONDITION_PARAM_TICKS, 60*1000)
	-- The Ape City Quest --
	if toPosition == campfirePosition and target.itemid = 1422 and player:getStorageValue(11107) == 1 then
		target:transform(1423)
		Game.createMonster("Draken Spellweaver", Position(6499, 589, 7))
		Game.createMonster("Draken Spellweaver", Position(6497, 593, 7))
		player:setStorageValue(11107, 2)
		creature:say('Kto?! Kto osmielil sie rozpalic przedwczesnie ogien?', TALKTYPE_MONSTER_SAY)
		addEvent(revertCampfire, 1000*60, campfirePosition)
	end
	-- DO MISJI DRUIDA/PODPALACZA --
	if target.itemid == 3871 -- deski 
							and player:getStorageValue(11008) == 1
							and player:getItemCount(5468) > 0 
							and target.uid == 11008 then
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)
		player:setStorageValue(11008,2)
	end
	if target.itemid == 5547 -- stog siana
							and player:getStorageValue(11009) == 1
							and player:getItemCount(5468) > 0
							and target.uid == 11010 then
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)
		player:setStorageValue(11009,2)					
	end
	if target.itemid == 4218 -- wielki pien
							and player:getStorageValue(11010) == 1
							and player:getItemCount(5468) > 0
							and target.uid == 11011 then
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)
		player:setStorageValue(11010,2)					
	end
	if target.itemid == 2743 -- id kwiatka
							and player:getStorageValue(11011) == 1
							and target.uid >= 11012
							and target.uid <= 11016 
	then
		if player:getStorageValue(target.uid) < 1 then
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			player:setStorageValue(target.uid,1)		
			player:addCondition(drunk)
		else
			player:say('Ten juz sie wyraznie jara', TALKTYPE_MONSTER_SAY)
		end
		if checkFlowers(player) then
			player:say('To chyba juz wszystkie', TALKTYPE_MONSTER_SAY)
		end
	end

	-- DO MISJI DRUIDA/PODPALACZA --

	local random = math.random(10)
	if random >= 4 then --success 6% chance
		if target.itemid == 7538 then --Destroy spider webs/North - South
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			target:transform(7544)
			target:decay()
		elseif target.itemid == 7539 then --Destroy spider webs/EAST- West
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			target:transform(7545)
			target:decay()
		elseif target.itemid == 5466 then --Burn Sugar Cane
			toPosition:sendMagicEffect(CONST_ME_FIREAREA)
			target:transform(5465)
			target:decay()
		elseif target.itemid == 1485 then --Light Up empty coal basins
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			target:transform(1484)
		end
	elseif random == 2 then --it remove the fire bug 2% chance
		item:remove(1)
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif random == 1 then --it explode on the user 1% chance
		doTargetCombatHealth(0, player, COMBAT_FIREDAMAGE, -5, -5, CONST_ME_HITBYFIRE)
		player:say('OUCH!', TALKTYPE_MONSTER_SAY)
		item:remove(1)
	else
		toPosition:sendMagicEffect(CONST_ME_POFF) --it fails, but dont get removed 3% chance
	end
	return true
end
