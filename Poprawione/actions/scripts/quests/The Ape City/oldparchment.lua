function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if cid:getStorageValue(11102) == 5 and cid:getStorageValue(11104) < 1 then
		cid:setStorageValue(11104, 1)
        cid:addItem(5956, 1) -- Dostaje Old Parchment
    else
        doCreatureSay(cid, 'Regal z ksiazkami i pergaminami.', TALKTYPE_ORANGE_1) -- Tylko dla robiacych questa jest tu cos xd
	end
	return true
end