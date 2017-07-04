function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if cid:getStorageValue(11102) == 15 and cid:getStorageValue(11108) < 1 then
		cid:setStorageValue(11108, 1)
        cid:addItem(4843, 1) -- Dostaje Giant's Ape hair
    else
        doCreatureSay(cid, 'Smieszne te listki.', TALKTYPE_ORANGE_1) -- Tylko dla robiacych questa jest tu cos xd
	end
	return true
end