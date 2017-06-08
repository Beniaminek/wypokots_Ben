local function ResetujEvent
    Game.setGlobalStorageValue(10, 0)
end

function onUse(cid, item, fromPosition, target, toPosition, isHotkey) 
    local licznik = Game.getGlobalStorageValue(10)
      if item.uid == 11190 and licznik == 1 then
        toPosition.x = 6600
        toPosition.y = 1013
        toPosition.z = 6
        licznik = Game.setGlobalStorageValue(10, licznik+1)
      elseif item.uid == 11191 and licznik == 2 then
        toPosition.x = 6611
        toPosition.y = 1005
        toPosition.z = 6
        licznik = Game.setGlobalStorageValue(10, licznik+1)
      elseif item.uid == 11192 and licznik == 3 then
        toPosition.x = 6631
        toPosition.y = 1003
        toPosition.z = 6
        licznik = Game.setGlobalStorageValue(10, licznik+1)
      elseif item.uid == 11193 and licznik == 4 then
        toPosition.x = 6641
        toPosition.y = 1009
        toPosition.z = 6
        licznik = Game.setGlobalStorageValue(10, licznik+1)
      end
        fromPosition:sendMagicEffect(CONST_ME_POFF)
		cid:teleportTo(toPosition, false)
		toPosition:sendMagicEffect(CONST_ME_POFF)
    else
        doCreatureSay(cid, 'Mało brakowało, a wpadlbym do dziury!', TALKTYPE_ORANGE_1) 
	end
    addEvent(ResetujEvent, 60 * 1000)
	return true
end