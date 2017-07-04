function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (player:getStorageValue(11102) > 16) then
		if item.itemid == 8551 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
        elseif item.itemid == 8553 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Drzwi ani drgna. Czyzby to byla jakas magia malp?")
	end
	return true
end