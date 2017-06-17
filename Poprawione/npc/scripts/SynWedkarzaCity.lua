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
			npcHandler:say({
			"W dziecinstwie ojciec opowiadal mi o {mitycznych} zwierzetach plywajacych w {Ocean}ie. Tyle sie tego nasluchalem, ze zapragnalem miec kawalek wielkiego swiata w swoim {domku}.",
			"Na przyklad zlowic ta wielka rybe z wlasnym zaglem na grzbiecie, ktory pomaga jej przemiezac ogrom oceanu.",
			"Ale ja, prosty syn, nie moge ruszyc sie tak daleko. Ajjj, a chcialbym kiedys chociaz zmierzyc sie z tym legendarnym morskim stworem zwanym, {Thul}em!"
			}, cid)
			npcHandler.topic[cid] = 2
		end
	elseif isInArray({"tak", "yes"}, msg) then
		if getPlayerItemCount(cid,7963) >= 2 and npcHandler.topic[cid] == 1 then
			player:removeItem(7963, 2)
			player:addItem(7964, 1)
			setPlayerStorageValue(cid, 2050, 1)
			npcHandler.topic[cid] = 0
			npcHandler:say("Yeah! Zobaczmy.. <krasz masz> No i mamy. Mam nadzieje ze bedziesz zachwycony!", cid)
		elseif getPlayerItemCount(cid,7963) == 1 and npcHandler.topic[cid] == 1 then
			npcHandler:say("Musisz mi przyniesc dwie sztuki.", cid)
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say("Co tak, co tak? Nie wierzysz mi?!")
			npcHandler.topic[cid] = 3
		else
			npcHandler:sat("To dobrze, ze mi wierzysz.")
		end
	elseif isInArray({"nie", "no"}, msg) then
		if npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 3 then
			npcHandler:say("Osz ty! Magikarp, SPLASH atak! HAHAH! Its super efektif!", cid)
			player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
			player:addCondition(condition)
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		else
		 	npcHandler:say("No to nie.", cid)
		end
	elseif isInArray({'mitycznych', 'mityczne'}, msg) then
		npcHandler:say({'Jest wiele roznych istot, ktore nie wiadomo skad sie wziely. Znajomy mojego ojca, Krzysiek, opowiadal o rybach ksztaltu ludzi. {Quary} zamieszkujace dno {ocean}u przy wyspie, na ktora ucieka przed swoja {czerwona zona} robic imprezki.' ,
						'Heh, jego statek ma wiele sladow uderzen przez morskie weze. To juz jego drugi statek. Pierwszy model, {Santa Maria}, zostal doszczednie zniszczony przez olbrzymiego {weza morskiego}.' ,
						'Wujek twierdzi, ze sam {Leviathan} sie pofatygowal o jego zycie, ale pewnie znowu upil sie rumem. HAHA, Leviathan, dobre. Gdy bedzie koniec swiata to moze sie pojawi.'}, cid)
	elseif isInArray({'weze morskie', 'morskie weze', 'waz morski', 'morski waz'}, msg) then
		npcHandler:say('Ogromne snejki, ktore swoim oddechem potrafia zamrozic nie jeden pozar. W miescie jest wiele dziewek, ktore uwielbiaja historie o tych wezach. Moze gdybym kiedy zdobyl jakis dowod na zabicie paru, a potem zmyslilbym historie, to mialbym powodzenia u nich? Kto wie...', cid)
	end
	return true
end
keywordHandler:addKeyword({'domku'}, StdModule.say, {npcHandler = npcHandler, text = 'No tutaj obok przeciez mieszkam.'})
keywordHandler:addKeyword({'ocean'}, StdModule.say, {npcHandler = npcHandler, text = 'Taka sobie kałuza, do której ktos dosypal soli.'})
keywordHandler:addKeyword({'leviathan'}, StdModule.say, {npcHandler = npcHandler, text = 'Najwiekszy z {morskich wezy}. Gdybym mogl sie stad wyrwac i zmierzyc sie z sama smiercia oko w oko.'})
keywordHandler:addKeyword({'czerwona zona'}, StdModule.say, {npcHandler = npcHandler, text = 'Krzysiek kiedys sobie ubzdural, ze z nowo odkrytej wyspy porwie kobiete. To jaki blad popelnil, moze podziwiac do dzisiaj u siebie w domu.'})
keywordHandler:addKeyword({'quary'}, StdModule.say, {npcHandler = npcHandler, text = 'Wielka rodzina istot morskich. Wiele razy widzialem je na szkicach podroznikow na rynku w Mirko. Hah, tyle o nich slyszalem, ze moge rozroznic wszystkie {rodzaje}. Moze nie z zamknietymi oczami, ale jako tako.'})
keywordHandler:addKeyword({'rodzaje'}, StdModule.say, {npcHandler = npcHandler, text = 'No wiec jest 5 rodzajow. Quara {Constrictor}, {Mantassin}, {Hydromancer}, {Pincher}, {Predator}! Ha, wszystkie znam.'})
keywordHandler:addKeyword({'constrictor'}, StdModule.say, {npcHandler = npcHandler, text = 'Dziwaczne stwory, mieszanki Krakena i kalamarnic. Jak slyszalem sa nawet inteligentne i chyba sa przywodcami, chociaz sa najslabsze.',
																						'Chodza sluchy, ze podobno jeszcze zyje jeden z zalozycieli podwodnego miasta i jest wlasnie tego rodzaju. Mowia na niego gul, to znaczy {Thul}. W ich krwi plynie krew wegorza, wiec sa w stanie oszolomic swoich wrogow na chwile.'})
keywordHandler:addKeyword({'mantassin'}, StdModule.say, {npcHandler = npcHandler, text = 'Sa czesto nie dostrzegane, az do chwili gdy jest juz za pozno <lenny>. Ta tez wyewoulowala, ale z osmiornicy i plaszczki, czyniac swoja rase mistrzami kamuflazu. Ja tam sie nie znam na nauce. Moze magowie wytlumacza ci o co chodzi z wzajemna mimikra.'})
keywordHandler:addKeyword({'hydromancer'}, StdModule.say, {npcHandler = npcHandler, text = 'Czesto niedoceniani przez obwisle brzuchy. Tymczasem najbardziej wkurwiaja. Ich dziedzictwem jest czarna magia, dawnych wymarlych mistrzow.'})
keywordHandler:addKeyword({'pincher'}, StdModule.say, {npcHandler = npcHandler, text = 'Zywe i chodzace fortece, wygladajace na niemozliwe do zatrzyania, atakuja ze stoickim spokojem, bez wahania i litosci. Nie jednemu swoim usciskiem szczypiec polamaly dobry miecz na kawalki. Przewage uzyskasz w walce z nimi jesli ci powiem, ze sa cokolwiek niezdarne i naiwne.'})
keywordHandler:addKeyword({'predator'}, StdModule.say, {npcHandler = npcHandler, text = 'Najbrdziej krwiozerce ze wszystkiech Quar. Ich morderczego szalu obawia sie wlasna rasa. Zmutowany rekin wypelniony magia wzmacniajaca jego kosci i skóre. Bezwgledny i okrutny. Lepiej unikac.'})
keywordHandler:addKeyword({'thul'}, StdModule.say, {npcHandler = npcHandler, text = 'Podobno ostatni przetrwaly zalozyciel podwodnego miasta, ktore zaginelo przed wiekami. Oszczedzajac energie, chcac przedluzyc sobie zycie przed zblizajaca sie staroscia, pojawia sie dopiero gdy w bitwach {Quar} zginie za duzo jego synow. Budzi sie i pokazuje, ze nie straszne mu zadne wyzwanie.'})
keywordHandler:addKeyword({'santa maria'}, StdModule.say, {npcHandler = npcHandler, text = 'Pierwszy statek mojego wujka. Uzywany do jego pierwszych przygod. Gdybym ja stracil kawalek takiej historii w swoim zyciu to chyba bym sie zabil. Moze on bedzie chcial kiedys przy butelce opowiedziec ci co nieco. Ale uprzedzam, na trzezwo nie jest taki gadatliwy.'})
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())