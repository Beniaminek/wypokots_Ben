function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (Game.getGlobalStorageValue(10) == 5) then
		if item.itemid == 1255 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Na drzwiach widzisz malowidlo z kolejno chowajacymi sie po palacu Lich, Destroyer, Fire Elemental i Vampire.")
	end
	return true
end