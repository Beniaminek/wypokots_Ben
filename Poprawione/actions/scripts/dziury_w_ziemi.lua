function onUse(cid, item, fromPosition, target, toPosition, isHotkey) 
    local licznik = getGlobalStorageValue(10)
    if licznik < 5 and licznik > 0 then
      if item.uid == 11190 and licznik <= 2 and licznik >= 1 then
        toPosition.x = 6600
        toPosition.y = 1013
        toPosition.z = 6
        setGlobalStorageValue(10, 2)
      elseif item.uid == 11191 and licznik <= 3 and licznik >= 2 then
        toPosition.x = 6611
        toPosition.y = 1005
        toPosition.z = 6
        setGlobalStorageValue(10, 3)
      elseif item.uid == 11192 and licznik <= 4 and licznik >= 3 then
        toPosition.x = 6631
        toPosition.y = 1003
        toPosition.z = 6
        setGlobalStorageValue(10, 4)
      elseif item.uid == 11193 and licznik >= 4 and licznik <= 5 then
        toPosition.x = 6641
        toPosition.y = 1009
        toPosition.z = 6
        setGlobalStorageValue(10, 5)
      end
      fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		  cid:teleportTo(toPosition, false)
		  toPosition:sendMagicEffect(CONST_ME_TELEPORT)
      addEvent(setGlobalStorageValue, 6000*1000, 10, 0)
    else
      doCreatureSay(cid, 'Malo brakowalo, a wpadlbym do dziury!', TALKTYPE_ORANGE_1) 
	  end
      return true
end
