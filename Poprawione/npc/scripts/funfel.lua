local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = {
	{text = 'Mikstury, runy, magia !'},
	{text = 'Ale w tej dzungli goraco i wilgotno, a klimatyzacji nie ma do dzis....'},
	{text = 'Sklep magiczny, Funfel zaprasza, pelen asortyment !'},
	{text = 'Magiczne napoje i runy na wyprawe zawsze sie przydadza...'},
	{text = 'Abrakadabra, to czary i magia....'},
	{text = 'Ehhh, gdyby tylko te cholerne malpy zostawily nasze magazyny w spokoju! Niech ktos pogada z przywodca malp.'} }
	
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

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

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local questProgress = player:getStorageValue(11102)
	if isInArray({"syrop", "plyn", "fluid", "kaszel"}, msg) then
		if Player(cid):getStorageValue(11102) == 3 then 
			npcHandler:say('W obecnej sytuacji mamy malo syropu na stanie. Ciagle zaczepki ze strony malp pozbawily nas duzej ilosci zapasow magazynie. Dlatego za jedna sztuke bedziesz musial zaplacic 1000 golda. Jestes w stanie nam tyle dac?', cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say('W zwiazku z cywilizacyjnym postepem i zamieszkaniem w miastach, a co za tym idzie, odwroceniem sie od natury, ludzie zaczeli mocno chorowac. A my jestesmy dystrybutorem i ekseporterem lekarstwa na swiat. Ehhh, gdyby tylko te cholerne malpy zostawily nasze magazyny w spokoju! Niech ktos pogada z przywodca malp.', cid)
		end
	elseif isInArray({"tak", "yes"}, msg) then
		if npcHandler.topic[cid] == 1 then
			if not player:removeMoney(1000) then
				npcHandler:say('Ale najpierw bedziesz musial zaplacic.', cid)
			else
				player:addItem(4839, 1)
			end			
		else
			npcHandler:say('Slucham?', cid)	
		end
		npcHandler.topic[cid] = 0
	elseif isInArray({"no", "nie"}, msg) then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Wiem, ze to wysoka cena, ale budzetowka nas zje, jesli im w priorytecie nie przyniesiemy.', cid)	
		else
			npcHandler:say('O co ci chodzi?', cid)	
		end
		npcHandler.topic[cid] = 0
	end
	local player = Player(cid)
	local items = {
		[1] = 2190,
		[2] = 2182,
		[5] = 2190,
		[6] = 2182
	}

end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
