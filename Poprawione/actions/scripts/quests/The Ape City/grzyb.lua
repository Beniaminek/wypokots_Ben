function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if cid:getStorageValue(11102) == 11 then
        cid:addItem(4840, 1) -- Dostaje Witches' Cap
    else
        doCreatureSay(cid, 'Obrzydliwe grzyby.', TALKTYPE_ORANGE_1) -- Tylko dla robiacych questa jest tu cos xd
	end
	return true
end