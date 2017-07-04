local config = {
	snake = {
		{position = Position(6435, 591, 11), itemId = 3721},
		{position = Position(6436, 591, 11), itemId = 3722}
	}
}

local function revertSnake(toPosition)
	for i = 1, #config.snake do
		Game.createItem(config.snake[i].itemId, 1, config.snake[i].position)
		local thrash = Tile(toPosition):getItemById(2256)
		if thrash then
			thrash:remove()
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid == 3721 or target.itemid == 3722 then
	    if player:getStorageValue(11102) ~= 17
	    		or player:getStorageValue(Storage.TheApeCity.SnakeDestroyer) == 1 then
	    	return false
	    end
	    player:setStorageValue(Storage.TheApeCity.SnakeDestroyer, 1)
	    target:transform(2256)
	    item:remove()
	    toPosition:sendMagicEffect(CONST_ME_FIREAREA)
	    addEvent(revertSnake, 60 * 1000, toPosition)
	    return true
    end
end

