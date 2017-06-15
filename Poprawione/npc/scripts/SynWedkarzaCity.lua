local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if isPlayerPzLocked( cid ) then
		npcHandler:say('Wygladasz jakbys sie przed chwila z kims bil... Lepiej odejdz.', cid)
		return false
	elseif isInArray({"sail", "plyn", "podroz", "transport", "plynac", "plyn", "forteca", "elfy"}, msg) then
		local player = Player(cid)
			if player:removeMoneyNpc(100) then
				player:teleportTo(Position(6029, 1945, 7))
			else
				npcHandler:say('Musisz miec 100 zlota, zeby tam plynac.', cid)
			end
		
		
	return true
	end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

