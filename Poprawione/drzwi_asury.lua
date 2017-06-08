function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (player:getStorageValue(1156) ~= 1) then
		if item.itemid == 5114 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Zaliczyles juz ten quest.")
	end
	return true
end