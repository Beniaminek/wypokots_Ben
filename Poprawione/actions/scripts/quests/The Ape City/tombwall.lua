function onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	if cid:getStorageValue(11102) == 7 then
		cid:setStorageValue(11105, 1)
        doCreatureSay(cid, '(.)(.),|,8--> Bendriksai.', TALKTYPE_ORANGE_1)
    else
        doCreatureSay(cid, 'Kolejne hieroglify. Ale zaraz, te sa jakies dziwne', TALKTYPE_ORANGE_1) -- Tylko dla robiacych questa jest tu cos xd
	end
	return true
end