function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if cid:getStorageValue(11102) == 1 and cid:getStorageValue(11103) < 1 then
		cid:setStorageValue(11103, 1)
        cid:addItem(4838, 1) -- Dostaje Whisper Moss
    else
        doCreatureSay(cid, 'Same zielska w tej skrzyni.', TALKTYPE_ORANGE_1) -- Tylko dla robiacych questa jest tu cos xd
	end
	return true
end