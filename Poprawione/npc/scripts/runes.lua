local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = {
  {text = 'Szwagier jak ostatnio eliksir wypil to dwa dni nieprzytomny lezal takiego ma kopa...'},
  {text = 'Przyjdz do mnie z kolegami, pohandlujemy uhami.'},
  {text = 'Prawda jest taka ze Panoramix bral ode mnie przepisy na magiczny napoj...'},
  {text = 'Runy magiczne, mikstury syntetyczne, pelen wybor w najnizszych cenach!'},
  {text = 'Jesli szukasz magicznej rozdzki to u mnie masz pelen wybor.'} }

  npcHandler:addModule(VoiceModule:new(voices))
  
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'vial'}, 2006, 50, 2, 'vial')
shopModule:addBuyableItem({'spellbook'}, 2175, 150, 'spellbook')
shopModule:addBuyableItem({'magic lightwand'}, 2163, 400, 'magic lightwand')
shopModule:addBuyableItem({'blank rune'}, 2260, 10, 'blank rune')

shopModule:addBuyableItem({'small health'}, 8704, 20, 1, 'small health potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 1, 'health potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 1, 'mana potion')
shopModule:addBuyableItem({'strong health'}, 7588, 100, 1, 'strong health potion')
shopModule:addBuyableItem({'strong mana'}, 7589, 80, 1, 'strong mana potion')
shopModule:addBuyableItem({'great health'}, 7591, 190, 1, 'great health potion')
shopModule:addBuyableItem({'great mana'}, 7590, 120, 1, 'great mana potion')
shopModule:addBuyableItem({'great spirit'}, 8472, 190, 1, 'great spirit potion')
shopModule:addBuyableItem({'ultimate health'}, 8473, 310, 1, 'ultimate health potion')
shopModule:addBuyableItem({'antidote potion'}, 8474, 50, 1, 'antidote potion')

shopModule:addSellableItem({'normal potion flask', 'normal flask'}, 7636, 5, 'empty small potion flask')
shopModule:addSellableItem({'strong potion flask', 'strong flask'}, 7634, 10, 'empty strong potion flask')
shopModule:addSellableItem({'great potion flask', 'great flask'}, 7635, 15, 'empty great potion flask')

shopModule:addBuyableItem({'intense healing'}, 2265, 95, 1, 'intense healing rune')
shopModule:addBuyableItem({'ultimate healing'}, 2273, 175, 1, 'ultimate healing rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 116, 3, 'magic wall rune')
shopModule:addBuyableItem({'destroy field'}, 2261, 45, 3, 'destroy field rune')
shopModule:addBuyableItem({'light magic missile'}, 2287, 40, 10, 'light magic missile rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 12, 10, 'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 45, 4, 'great fireball rune')
shopModule:addBuyableItem({'explosion'}, 2313, 31, 6, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 108, 3, 'sudden death rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 700, 1, 'paralyze rune')
shopModule:addBuyableItem({'animate dead'}, 2316, 375, 1, 'animate dead rune')
shopModule:addBuyableItem({'convince creature'}, 2290, 80, 1, 'convince creature rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 1, 'chameleon rune')
shopModule:addBuyableItem({'desintegrate'}, 2310, 80, 3, 'desintegrate rune')
shopModule:addBuyableItem({'icicle'}, 2271, 30, 3, 'icicle rune')
shopModule:addBuyableItem({'avalanche'}, 2274, 45, 3, 'avalanche rune')
shopModule:addBuyableItem({'fire bomb'}, 2305, 117, 3, 'fire bomb rune')
shopModule:addBuyableItem({'energy bomb'}, 2262, 162, 3, 'energy bomb rune')
shopModule:addBuyableItem({'poison bomb'}, 2286, 85, 3, 'poison bomb rune')
shopModule:addBuyableItem({'fire wall'}, 2303, 66, 3, 'fire wall rune')
shopModule:addBuyableItem({'energy wall'}, 2279, 85, 3, 'energy wall rune')
shopModule:addBuyableItem({'poison wall'}, 2289, 52, 3, 'poison wall rune')
shopModule:addBuyableItem({'wild growth'}, 2269, 160, 3, 'wild growth rune')
shopModule:addBuyableItem({'stone shower'}, 2288, 37, 3, 'stone shower rune')
shopModule:addBuyableItem({'thunderstorm'}, 2315, 37, 3, 'thunderstorm rune')
shopModule:addBuyableItem({'soulfire'}, 2308, 46, 3, 'soulfire rune')
shopModule:addBuyableItem({'fire field'}, 2301, 28, 3, 'fire field rune')
shopModule:addBuyableItem({'poison field'}, 2285, 21, 3, 'poison field rune')
shopModule:addBuyableItem({'energy field'}, 2277, 38, 3, 'energy field rune')

shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 500, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of decay', 'decay'}, 2188, 5000, 'wand of decay')
shopModule:addBuyableItem({'wand of draconia', 'draconia'}, 8921, 7500, 'wand of draconia')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000, 'wand of inferno')
shopModule:addBuyableItem({'wand of starstorm', 'starstorm'}, 8920, 18000, 'wand of starstorm')
shopModule:addBuyableItem({'wand of voodoo', 'voodoo'}, 8922, 22000, 'wand of voodoo')

shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'necrotic rod', 'necrotic'}, 2185, 5000, 'necrotic rod')
shopModule:addBuyableItem({'northwind rod', 'northwind'}, 8911, 7500, 'northwind rod')
shopModule:addBuyableItem({'terra rod', 'terra'}, 2181, 10000, 'terra rod')
shopModule:addBuyableItem({'hailstorm rod', 'hailstorm'}, 2183, 15000, 'hailstorm rod')
shopModule:addBuyableItem({'springsprout rod', 'springsprout'}, 8912, 18000, 'springsprout rod')
shopModule:addBuyableItem({'underworld rod', 'underworld'}, 8910, 22000, 'underworld rod')

shopModule:addSellableItem({'wand of vortex', 'vortex'}, 2190, 50, 'wand of vortex')
shopModule:addSellableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 200, 'wand of dragonbreath')
shopModule:addSellableItem({'wand of decay', 'decay'}, 2188, 1000, 'wand of decay')
shopModule:addSellableItem({'wand of draconia', 'draconia'}, 8921, 1500, 'wand of draconia')
shopModule:addSellableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 2000, 'wand of cosmic energy')
shopModule:addSellableItem({'wand of inferno', 'inferno'},2187, 3000, 'wand of inferno')
shopModule:addSellableItem({'wand of starstorm', 'starstorm'}, 8920, 3600, 'wand of starstorm')
shopModule:addSellableItem({'wand of voodoo', 'voodoo'}, 8922, 4400, 'wand of voodoo')

shopModule:addSellableItem({'snakebite rod', 'snakebite'}, 2182, 50,'snakebite rod')
shopModule:addSellableItem({'moonlight rod', 'moonlight'}, 2186, 200, 'moonlight rod')
shopModule:addSellableItem({'necrotic rod', 'necrotic'}, 2185, 1000, 'necrotic rod')
shopModule:addSellableItem({'northwind rod', 'northwind'}, 8911, 1500, 'northwind rod')
shopModule:addSellableItem({'terra rod', 'terra'}, 2181, 2000, 'terra rod')
shopModule:addSellableItem({'hailstorm rod', 'hailstorm'}, 2183, 3000, 'hailstorm rod')
shopModule:addSellableItem({'springsprout rod', 'springsprout'}, 8912, 3600, 'springsprout rod')
shopModule:addSellableItem({'underworld rod', 'underworld'}, 8910, 4400, 'underworld rod')
shopModule:addSellableItem({'ogre scepta'}, 24839, 3600, 'ogre scepta')

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local items = {
		[1] = 2190,
		[2] = 2182,
		[5] = 2190,
		[6] = 2182
	}
	--[[
	if msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand') then
		local vocationId = player:getVocation():getId()
		if isInArray({1, 2, 5, 6}, vocationId) then
			if player:getStorageValue(30002) == -1 then
				selfSay('Wiec prosisz mnie o {' .. ItemType(items[vocationId]):getName() .. '} aby rozpoczac swa przygode?', cid)
				npcHandler.topic[cid] = 1
			else
				selfSay('Co? Przeciez dalem Ci juz {' .. ItemType(items[vocationId]):getName() .. '}!', cid)
			end
		else
			selfSay('Wybacz, ale nie jestes ani druidem, ani czarodziejem.', cid)
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:addItem(items[vocationId], 1)
			selfSay('Prosze, mlody adepcie. Pielegnuj swa moc!', cid)
			player:setStorageValue(30002, 1)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		selfSay('Okej.', cid)
		npcHandler.topic[cid] = 0
	end
	]]
-- ============ DO MISJI TRUDNE POCZATKI =============
   if msgcontains(msg,"nagroda") and player:getStorageValue(11032) > 0 and player:getStorageValue(11032) < 4 then
   		if player:getStorageValue(11032) == 1 then -- jak ktos wzial bron ( knight )
		   player:setStorageValue(11032,4) -- juz po nagrodzie
		   player:addItem(7618,20) -- 20 health potionow
		   player:addItem(7620,5) -- 5 mana potionow
		   selfSay('Ah tak, dziekuje ci w imieniu Miasta jeszcze raz za pomoc, tutaj twoj przydzial potionow.',cid)
		end
   		if player:getStorageValue(11032) == 2 then -- jak ktos wzial ksiazke ( mag )
		   player:setStorageValue(11032,4) -- juz po nagrodzie
		   player:addItem(7620,40) -- 40 mana potionow
		   selfSay('Ah tak, dziekuje ci w imieniu Miasta jeszcze raz za pomoc, tutaj twoj przydzial potionow.',cid)
		end
   		if player:getStorageValue(11032) == 3 then -- jak ktos wzial bolty lub strzaly ( pallek )
		   player:setStorageValue(11032,4) -- juz po nagrodzie
		   player:addItem(7618,30) -- 25 health potionow
		   player:addItem(7620,25) -- 25 mana potionow
		   selfSay('Ah tak, dziekuje ci w imieniu Miasta jeszcze raz za pomoc, tutaj twoj przydzial potionow.',cid)
		end
   end
   if (msgcontains(msg, "pomoc")) and player:getStorageValue(11019) > 0 and player:getStorageValue(11021) < 1 then
        player:setStorageValue(11021,1) -- lockujemy fstaba jako wykonanego
        player:setStorageValue(11019,player:getStorageValue(11019) + 1) -- +1 zeby kolejnosc nie miala znaczenia
        selfSay('Wszystko w porzadku, ale przydalby mi sie czeladnik, wiec jak bedziesz miec ochote to sie zglos.', cid)
   
-- ============ DO 1 MISJI YALAHARI QUESTA =============
	elseif IsinArray({'kult', 'lizardy', 'brama', 'przyzwanie'}, msg) then
		npcHandler:say({
			'No to przypomniales mi o moich przygodach. Pewnie slyszales o tym, ze kiedys pod sztandarem inkwizycji polowalem na czarownice i czarnoksieznikow. ...',
			'Jak moglbys przerwac obrzek jakiegos kultu? Znajac stare metody przyzywania demonow, to najlepiej jest po prostu zniszczyc im oltarz. Ale idz do Henricusa, on jako stary weteran walki z okultyzmem, bedzie mogl wiecej ci powiedziec na ten temat.'
		}, cid)
		npcHandler.topic[cid] = 0
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

