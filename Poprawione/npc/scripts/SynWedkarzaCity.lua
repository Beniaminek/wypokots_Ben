local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local voices = {
	{ text = 'Marliny, piekne i szlachetne ryby! Wstawilbym sobie taka dekoracje do mojej chatki.' },
	{ text = 'Oj Marlinku, Marlinku, moja rybeczko. Odwiedz mnie dzisiaj najdrozsza!'}
}
npcHandler:addModule(VoiceModule:new(voices))
local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(2, 1000, -30)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local marlinq = getPlayerStorageValue(cid, 2050)
	local player = Player(cid)

	if isPlayerPzLocked( cid ) then
		npcHandler:say('Wygladasz jakbys sie przed chwila z kims bil... Lepiej odejdz.', cid)
		return false
	elseif isInArray({"sail", "plyn", "podroz", "transport", "plynac", "plyn", "forteca", "elfy"}, msg) then
		if player:removeMoneyNpc(100) then
			player:teleportTo(Position(6029, 1945, 7))
		else
			npcHandler:say('Musisz miec 100 zlota, zeby tam plynac.', cid)
		end
	elseif isInArray({"marlin", "ryba", "rybka", "fish"}, msg) then
		if marlinq == 1 then 
			npcHandler:say("Dzieki za przyniesienie ryby. Pieknie wyglada przy kominku.", cid)
		elseif getPlayerItemCount(cid,7963) >= 1 then
			npcHandler:say("Wow! Masz merlina! Czy dostane ta rybe od ciebie, jesli sie umowimy, ze z drugiej takiej wykonam dla ciebie fajna ozdobe?", cid)
			npcHandler.topic[cid] = 1
		else 
			npcHandler:say("W dziecinstwie ojciec opowiadal mi o mitycznych zwierzetach plywajacych w Oceanie. Tyle sie tego nasluchalem, ze zaprognolem miec kawalek wielkiego swiata w swoim domku. Ale ja, prosty syn, nie moge ruszyc sie tak daleko. Ajjj, a chcialbym kiedys zmierzyc sie z tym legendarnym morskim stworem zwanym, Thulem!", cid)
		end
	elseif isInArray({"tak", "yes"}, msg) then
		if getPlayerItemCount(cid,7963) >= 2 and npcHandler.topic[cid] == 1 then
			player:removeItem(7963, 2)
			player:addItem(7964, 1)
			setPlayerStorageValue(cid, 2050, 1)
			npcHandler.topic[cid] = 0
			npcHandler:say("Yeah! Zobaczmy.. <krasz masz> No i mamy. Mam nadzieje ze bedziesz zachwycony!", cid)
		else
			npcHandler:say("Musisz mi przyniesc dwie sztuki.", cid)
		end
	elseif isInArray({"nie", "no"}, msg) and npcHandler.topic[cid] == 1 then
		npcHandler:say("Osz ty! Magikarp, SPLASH atak! HAHAH! Its super efektif!", cid)
		player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
		player:addCondition(condition)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

