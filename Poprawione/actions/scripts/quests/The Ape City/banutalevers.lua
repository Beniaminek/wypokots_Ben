local config = {
	leverTime = 15 * 60,
	leverPositions = {
		Position(6459, 672, 11),
		Position(6435, 642, 11),
		Position(6462, 591, 11),
		Position(6497, 591, 11),
		Position(6523, 580, 11),
		Position(6530, 649, 11)
	},

	gateLevers = {
		{position = Position(6446, 596, 11), duration = 15 * 60, ignoreLevers = true},
		{position = Position(6425, 596, 11), duration = 60, ignoreLevers = true} 
	},

	fires = {
		{position = Position(6434, 592, 11), itemId = 1481},
		{position = Position(6437, 592, 11), itemId = 1481}
	}
}

local function revertLever(position)
	local leverItem = Tile(position):getItemById(1946)
	if leverItem then
		leverItem:transform(1945)
	end
end

local function revertWalls(leverPosition)
	revertLever(leverPosition)
	for i = 2, #config.fires do
		Game.createItem(config.fires[i].itemId, 1, config.fires[i].position)
	end
end


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'It doesn\'t move.')
		return true
	end

	if isInArray(config.leverPositions, toPosition) then
		item:transform(1946)
		addEvent(revertLever, config.leverTime * 1000, toPosition)
		return true
	end

	local gateLever
	for i = 2, #config.gateLevers do
		if toPosition == config.gateLevers[i].position then
			gateLever = config.gateLevers[i]
			break
		end
	end

	if not gateLever then
		return true
	end

	if gateLever.ignoreLevers then
		for i = 6, #config.leverPositions do
			-- if lever not pushed, do not continue
			local leverItem = Tile(config.leverPositions[i]):getItemById(1946)
			if not leverItem then
				return false
			end
		end
	end
	
	-- open gate when all levers used
	for i = 2, #config.fires do
		local fireItem = Tile(config.fires[i].position):getItemById(config.fires[i].itemId)
		if not fireItem then
			player:say('The lever won\'t budge', TALKTYPE_MONSTER_SAY, false, nil, toPosition)
			return true
		end

	    fireItem:remove()
		config.fires[i].position:sendMagicEffect(CONST_ME_MAGIC_RED)
	end

	addEvent(revertWalls, gateLever.duration * 1000, toPosition)
	item:transform(1946)
	return true
end
