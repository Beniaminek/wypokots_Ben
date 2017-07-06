local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid)
	if Player(cid):getStorageValue(11101) < 12 then
		npcHandler:setMessage(MESSAGE_GREET, 'Oh! Witam, witam! Nie zauwazylem cie! Bardzo {zajety}.')
	else
		npcHandler:setMessage(MESSAGE_GREET, 'Be greeted, friend of the ape people. If you want to {trade}, just ask for my offers. If you are injured, ask for healing.')
	end
	return true
end

local function releasePlayer(cid)
	if not Player(cid) then
		return
	end

	npcHandler:releaseFocus(cid)
	npcHandler:resetNpc(cid)
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local questProgress = player:getStorageValue(11102)
	if isInArray({"mission", "misja"}, msg) then
		if questProgress < 1 then
			npcHandler:say('Nastaly ciezkie czasy dla naszych pobratyncow odkad ciapatym znudzily sie kozy. Problem to duzy zwazajac na historie. Ale my tak latwo sie nie damy. Czy chcesz udowodnic, ze jestes przyjacielem malp?', cid)
			npcHandler.topic[cid] = 1
		elseif questProgress == 1 then
			if player:getStorageValue(11103) == 1 then
				npcHandler:say('Oh, przyniosles mi whisper moss? Dobra bezwlosia malpa z ciebie! Dasz mi je?', cid)
				npcHandler.topic[cid] = 3
			else
				npcHandler:say('Szybko prosze. Przynies mi whisper moss z dziurki Dworcow. Jesli mam Ci opowiedziec historie ponownie to cie strzele, ale opowiem. Spytaj Hairyclesa o {historia}.', cid)
			end
		elseif questProgress == 2 then
			npcHandler:say({
				'Whisper moss silny jest, ale potrzebujemy plynu od ludzi, wtedy uda nam sie ...',
				'Nasi grabiezcy raz przyniesli to z najazdow. Nazywaja go syropem. Spytaj o to magow w miescie na koncu dzungli.'
			}, cid)
			player:setStorageValue(11102, 3)
		elseif questProgress == 3 then
			npcHandler:say('Przyniosles mi ten syrop na kaszel od ludzi, o ktory cie prosilem?', cid)
			npcHandler.topic[cid] = 4

		elseif questProgress == 4 then
			npcHandler:say('Nasze malenstwo byc zdrowe wkrotce. Jestem taki szczesliwy. Dziekuje ponownie! Ale zle chmury nadciagaja. Czuje to w bananach. Zupelnie inny smak. Pomozesz mi upewnic sie w przeczuciu?', cid)
			npcHandler.topic[cid] = 5

		elseif questProgress == 5 then
			npcHandler:say('Masz papier z wioski lizardow?', cid)
			npcHandler.topic[cid] = 7

		elseif questProgress == 6 then
			npcHandler:say({
				'Ah tak, pergamin. Smutno mi, ale nie moge go przeczytac. Ale swiety banan dal mi znak! W snach Hairycles zobaczyl rozwiazanie. ...',
				'Ja widzialem szpiczasty kamien z jezykiem Lizardow i z jezykiem ludzi, ktory znam. Gdybys odnalazl ten kamien, zapamietal znaki dla Hairyclesa, wtedy bede wiedzial jak go odczytac. ...',
				'Idz na poludnie na wielka pustynie. Na pustyni jest miasto. Na polnocnym zachodzie ukryty grobowiec na oazie jest. Wez lopate ze soba. ...',
				'Wchodz do kazdej komnaty i nie boj pulapek zastawionych tam i zablakanych dusz. Znajdziesz sciane wymalowana miedzy dwoma duzymi czerwonymi skalami. ...',
				'Przeczytaj to i wroc. Jestes gotowy na wyzwanie?'
			}, cid)
			npcHandler.topic[cid] = 8

		elseif questProgress == 7 then
			if player:getStorageValue(11105) == 1 then
				npcHandler:say('Ah tak, przeczytales znaki w grobowcu? Dobrze! Pozwolisz, ze spojrze w twoj umysl i dowiem sie co przeczytales?', cid)
				npcHandler.topic[cid] = 9
			else
				npcHandler:say('Dalej nie znasz znakow z kamienia w moim snie, idz i poszukaj w grobowcu pod oaza.', cid)
			end

		elseif questProgress == 8 then
			npcHandler:say({
				'Jeszcze duzo pracy przed Hairyclesem do utworzeniu amuletu, ktory ochroni moj lud. ...',
				'Mozesz wspomoc nas. Do stworzenia amuletu zycia mozemy potrzebowac tokenu zycia! Najlepsze bedzie jajko regeneracji potwora zwanego hydra. ...',
				'Przynies mi jajo hydry. Myslisz, ze dasz rade?'
			}, cid)
			npcHandler.topic[cid] = 10

		elseif questProgress == 9 then
			npcHandler:say('Przyniosles mi jajo Hydry?', cid)
			npcHandler.topic[cid] = 11

		elseif questProgress == 10 then
			npcHandler:say({
				'Ostatnim skladnikiem jest przyciagacz magii. Jedyna znana mi taka rzecza jest grzyb zwany witches\' cap. Me was told it be found in isle called Fibula, where humans live. ...',
				'Jedynie wiem ze grzyby te rosna z odchodow Bone Lordow. Tam gdzie one, tam witches\' cap. Odwazny wojowniku, pomozesz mi i mojemu ludowi?'
			}, cid)
			npcHandler.topic[cid] = 12

		elseif questProgress == 11 then
			npcHandler:say('Przyniosles Hairyclesowi witches\' cap?', cid)
			npcHandler.topic[cid] = 13

		elseif questProgress == 12 then
			npcHandler:say({
				'Potezny amulet zycia nas chorni! Ale moim malpom dalej grozi smierc. Smierc od srodka. ...',
				'Niektore malpy przez udzial klatwy poddaly sie kultowi lizardow. Zostali wykorzystani do tego, aby ich potezni magowie mogli przedrzec sie do wioski i zaczac odprawiac rytualy przyzwania. ...',
				'Pod nasza wioska znajduje sie dawna swiatynia Lizardow. Nie tylko my jestesmy jej mieszkancami, ale rowniez mistyczne stwory. Jeszcze za malo informacji zdobylem, ale moje malpki zauwazyly dziwne zachowania malp po zachodniej stronie wioski. ...',
				'Jesli znajdziesz ich krag to sprobuj przerwac ta czarna magie. Hairycles mysli, ze Jaszczury otworzyly jakas zla brame i stad te mityczne potwory. Moze to podpucha piekiel? Glupie dinozaury, jesli otworza brame na powierzchni, wszyscy zginiemy! Przeszkodzisz im w imie ludzkosci?'
			}, cid)
			npcHandler.topic[cid] = 14

		elseif questProgress == 13 then
			if player:getStorageValue(11107) == 2 then
				npcHandler:say('Ratujesz nasza sytuacje, przyjacielu. Mam nadzieje, ze szalenstwo jeszcze nie rozprzestrzeni sie. Pewnie jest gotowy na kolejna misje.', cid)
				player:setStorageValue(11102, 14)
			else
				npcHandler:say('Prosze, przeszkodz im jakos w tych rytualach. Ja tam niczego szczegolnego nie widzialem.', cid)
			end

		elseif questProgress == 14 then
			npcHandler:say({
				'Teraz kiedy kult zostal zatrzymany musimy wzmocnic ducha moich braci. Potrzebujemy symbolu wiary, ktory malpy beda mogly zobaczyc i dotknac. ...',
				'Istnieje pewna grota gigantow na poludniu. Jestesmy dziecmi prastarego giganta wielkiego jak gora. Malo o nich wiemy, ale gdybysmy zdobyli jakas czesc wlosia. ...',
				'Moze stawilbys czola lekom i sprobowal znalezc cos w ich legowiskach. Jesli maja taka sama bitna nature jak nasza, to powinienes znalezc cos na galeziach krzewow tam rosnacych. ...',
				'Przynies mi wlosie wielkiej swietej malpy. Zrobisz to dla Hairyclesa?'
			}, cid)
			npcHandler.topic[cid] = 15

		elseif questProgress == 15 then
			if player:getStorageValue(11108) == 1 then
				npcHandler:say('Przyniosles wlos swietej malpy?', cid)
				npcHandler.topic[cid] = 16
			else
				npcHandler:say('Zdobadz wlos swietej malpy giganta z groty na poludniu.', cid)
			end

		elseif questProgress == 16 then
			npcHandler:say({
				'Udowodniles, ze jestes przyjacielem. Dostajesz ode mnie zezwolenie na wejscie do glebszych poziomow katakumb swiatyni lizardow. ...',
				'Dalej moge wyczuc zlo, ktore tam sie czai. My nie odwazylismy sie tam wejsc i walczyc z demonami. ...',
				'Moze poszedlbys tam, przedarl sie przez zle istoty, odnalazl posag boga jaszczurow i zniszczyl mlotkiem, ktory ci dam. ...',
				'Tylko w ten sposob zapewnie moich ludziom pokoj i bezpieczenstwo. Prosze, posluchaj Hairyclesa, pojdziesz tam?'
			}, cid)
			npcHandler.topic[cid] = 17

		elseif questProgress == 17 then
			if player:getStorageValue(Storage.TheApeCity.SnakeDestroyer) == 1 then
				npcHandler:say({
					'W koncu moj lud jest bezpieczny! Uczyniliscie niewiarygodne dobro dla nas i pewnego dnia nawet moi bracia dostrzega to. ...',
					'Chcialbym mowic za wszystkich, kiedy nazywam cie swoich przyjacielem, ale moi ludzie potrzebuja czasu na przyzwyczajenie sie do zmian. ...',
					'Miejmy nadzieje, ze pewnego dnia cala wioska powita Cie jako przyjaciela. Moze chcesz sprawdzić oferty dla specjalnych przyjaciol, albo pouczyc sie szamanskich mocy?'
				}, cid)
				player:setStorageValue(11102, 18)
				player:addItem(3955, 1)
				player:addAchievement('Friend of the Apes')
			else
				npcHandler:say('Ja wiem, ze o wiele prosze, ale wejdz tam w podziemia i zniszcz pomnik boga wezy.', cid)
			end

		else
			npcHandler:say('Nie mam wiecej misji dla ciebie. Moze chcesz sprawdzić oferty dla specjalnych przyjaciol, albo pouczyc sie szamanskich mocy?', cid)
		end

	elseif msgcontains(msg, 'historia') then
		if questProgress == 1 and player:getStorageValue(11102) ~= 2 then
			npcHandler:say({
			    'Posluchaj, ostatnio nasza mala malpke dotknal turek pustynny. Hairycles nie wie jaka chorobe mogl roznosic. Jest dziwna. Hairycles powinien wiedziec. Ale Hairycles uczyl sie i uczyl sie koranu ...',
				'Moglbym chyba zrobic lekarstwo tak mocne, by zrobic Europe znowu biala. Ale do zrobienia lekarstwa wielkiego, potrzebuje poteznych rownie skladnikow ...',
				'Potrzebujemy whisper moss (Szept mchu). Whisper moss w gorach hydr pelnych rosnie. W tym problem, ze diabelskie Dworki caly juz pozabieraly do siebie ...',
				'Wiemy, ze ukrywaja sie na wschodzie gdzies w podziemiach. My atakowalismy ich, ale znalezc nie moglismy dziurek ich. Szukalismy w lesie wielkich drzew na wschodzie, ale szybko nam sie chowaly pod ziemie ...',
				'Idz tam i wykradnij whisper moss dla nas. Napisz do mnie pozniej jak poszlo ci z misja.'
			}, cid)
		end

	elseif msgcontains(msg, 'outfit') or msgcontains(msg, 'shamanic') then
		if questProgress == 18 then
			if player:getStorageValue(Storage.TheApeCity.ShamanOutfit) ~= 1 then
				npcHandler:say('Me truly proud of you, friend. You learn many about plants, charms and ape people. Me want grant you shamanic power now. You ready?', cid)
				npcHandler.topic[cid] = 18
			else
				npcHandler:say('You already are shaman and doctor. Me proud of you.', cid)
			end
		else
			npcHandler:say('You not have finished journey for wisdom yet, young human.', cid)
		end

	elseif msgcontains(msg, 'heal') then
		if questProgress > 11 then
			if player:getHealth() < 50 then
				player:addHealth(50 - player:getHealth())
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			elseif player:getCondition(CONDITION_FIRE) then
				player:removeCondition(CONDITION_FIRE)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			elseif player:getCondition(CONDITION_POISON) then
				player:removeCondition(CONDITION_POISON)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			else
				npcHandler:say('You look for food and rest.', cid)
			end
		else
			npcHandler:say('You look for food and rest.', cid)
		end

	elseif npcHandler.topic[cid] == 1 then
		if isInArray({"tak", "yes"}, msg) then
			npcHandler:say('By stac sie przyjacielem naszym dluga droga to jest. Nie ufamy tak latwo, ale pomoc potrzebna byc. Wysluchasz opowiesci Hairyclesa?', cid)
			npcHandler.topic[cid] = 2
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Chwala Wielkiej Jungli!', cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 2 then
		if isInArray({"tak", "yes"}, msg) then
			npcHandler:say({
				'Posluchaj, ostatnio nasza mala malpke dotknal turek pustynny. Hairycles nie wie jaka chorobe mogl roznosic. Jest dziwna. Hairycles powinien wiedziec. Ale Hairycles uczyl sie i uczyl sie koranu ...',
				'Moglbym chyba zrobic lekarstwo tak mocne, by zrobic Europe znowu biala. Ale do zrobienia lekarstwa wielkiego, potrzebuje poteznych rownie skladnikow ...',
				'Potrzebujemy whisper moss (Szept mchu). Whisper moss w gorach hydr pelnych rosnie. W tym problem, ze diabelskie Dworki caly juz pozabieraly do siebie ...',
				'Wiemy, ze ukrywaja sie na wschodzie gdzies w podziemiach. My atakowalismy ich, ale znalezc nie moglismy dziurek ich. Szukalismy w lesie wielkich drzew na wschodzie, ale szybko nam sie chowaly pod ziemie ...',
				'Idz tam i wykradnij whisper moss dla nas. Napisz do mnie pozniej jak poszlo ci z misja.'
			}, cid)
			player:setStorageValue(11101, 1)
			player:setStorageValue(11102, 1)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Hairycles mial lepsze zdanie o tobie leszczu.', cid)
			addEvent(releasePlayer, 1000, cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 3 then
		if isInArray({"yes", "tak"}, msg) then
			if not player:removeItem(4838, 1) then
				npcHandler:say('Glupi, nie masz mchu mojego. Idz go odzyskac.', cid)
				player:setStorageValue(11103, 0)
				return true
			end
			npcHandler:say('Ah tak! To jest to. Dziekuje za przyniesienie poteznego whisper moss do Hairyclesa. To pomoge, ale jest duzo jeszcze do zrobienia. Spytaj mnie o misji przybyszu, gdy sie wysprzatasz i umyjesz, ughh.', cid)
			player:setStorageValue(11102, 2)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Dziwaku! Nasz lud cie potrzebuje', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 4 then
		if isInArray({"yes", "tak"}, msg) then
			if not player:removeItem(4839, 1) then
				npcHandler:say('Nie nie, zly syrop wziales. Idz zdobyc inny, zdobadz syrop leczniczy.', cid)
				return true
			end
			npcHandler:say('Jestes wielki! Przyniosles mi syrop! Dziekuje, juz sie biore za robienie lekarstwa. Spytaj mnie o {mission}, jesli znowu zechcesz mi pomoc.', cid)
			player:setStorageValue(11102, 4)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Szybko, pilne to jest!', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 5 then
		if isInArray({"yes", "tak"}, msg) then
			npcHandler:say({
				'Sluchaj prosze. Plaga to nie byla tylko choroba prosta. Dlatego Hairycles nie mogl uleczyc zwykla magia. To jest nowa klatwa diabelskich lizardow...',
				'Hairycles mysli, ze klatwa na malym byla proba tylko. Musimy byc gotowi nim znowu uderza, ale mocniej...',
				'Ja potrzebuje papier od magicznych Lizardow! Na pewno znajdziesz go w ich bibliotece. Ukryta pewnie na wiezy w wiosce na poludniowy wschod stad. Poszukaj tam prosze! Jestes gotowy do wyprawy?'
			}, cid)
			npcHandler.topic[cid] = 6
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Smutno. Oczekiwalem wiecej po tobie!', cid)
			addEvent(releasePlayer, 1000, cid)
			npcHandler.topic[cid] = 0
		end

	elseif npcHandler.topic[cid] == 6 then
		if isInArray({"yes", "tak"}, msg) then
			npcHandler:say('Dobrze slyszec! Czekam na report twoj o zdobyciu papieru z misji.', cid)
			player:setStorageValue(11102, 5)
			player:setStorageValue(11104, 0)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Smutno mi. Oczekiwalem wiecej po tobie!', cid)
			addEvent(releasePlayer, 1000, cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 7 then
		if isInArray({"yes", "tak"}, msg) then
			if not player:removeItem(5956, 1) then
				if player:getStorageValue(Storage.QuestChests.OldParchment) == 1 then
					npcHandler:say('To zla wiadomosc. Jesli straciles papier, jedynie mozesz go odzyskac polujac na swiete serpenty.', cid)
				else
					npcHandler:say('Nie! To nie tego potrzebuje. Glupia bezwlosia malpa. Idz do wioski lizardow i zdobadz ten magiczny papier!', cid)
				end
				return true
			end

			npcHandler:say('Przyniosles zapiski z jezykiem lizardow? Dobrze! Zobacze co ten tekst w sobie kryje! Wroc gdy bedziesz gotowy na kolejna misje.', cid)
			player:setStorageValue(11102, 6)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('To zla wiadomosc. Jesli straciles papier, jedynie mozesz go odzyskac polujac na swiete serpenty.', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 8 then
		if isInArray({"yes", "tak"}, msg) then
			npcHandler:say('Dobrze slyszec! Powiedz jak uda ci sie przeczytac te znaki.', cid)
			player:setStorageValue(11102, 7)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Smutno mi. Oczekiwalem wiecej po tobie!', cid)
			addEvent(releasePlayer, 1000, cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 9 then
		if isInArray({"yes", "tak"}, msg) then
			npcHandler:say('Oh, teraz wszystko jasne! Latwiejsze niz sie wydaje! Wkrotce dowiemy sie co robic! Dziekuje ci! Mam jeszcze misje dla ciebie, badz gotow.', cid)
			player:setStorageValue(11102, 8)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Musze spojrzec w twoj umysl, nie ma innego wyjscia.', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 10 then
		if isInArray({"yes", "tak"}, msg) then
			npcHandler:say('Odwazna z ciebie bezwlosa malpa! Przynies jadro Hydry. Bedziesz musial wiele, wiele, tych trojglowych bestii zabic, by zdobyc jedno jajo!', cid)
			player:setStorageValue(11102, 9)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Smutno. Po takiej pomocy myslalem, ze tibijczyk z ciebie!', cid)
			addEvent(releasePlayer, 1000, cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 11 then
		if isInArray({"yes", "tak"}, msg) then
			if not player:removeItem(4850, 1) then
				npcHandler:say('Nie masz jaja Hydry. Prosze, zdobadz jedno!', cid)
				return true
			end

			npcHandler:say('Ah, jajo! Potezny wojownik z ciebie! Dziekuje. Hairycles zaraz odstawi je w bezpieczne miejsce.', cid)
			player:setStorageValue(11102, 10)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Pospiesz sie. Hairycles nie wie kiedy Lizardy uderza ponownie.', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 12 then
		if isInArray({"yes", "tak"}, msg) then
			npcHandler:say('Poszukaj zatem jakiegos duzego skupiska Bone Lordow i znajdz te grzyby.', cid)
			player:setStorageValue(11102, 11)
			player:setStorageValue(11106, 1)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Smutno. Po takiej pomocy myslalem, ze tibijczyk z ciebie!', cid)
			addEvent(releasePlayer, 1000, cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 13 then
		if isInArray({"yes", "tak"}, msg) then
			if not player:removeItem(4840, 1) then
				npcHandler:say('Nie tego grzyba masz. Znajdz dla mnie witches\' cap!', cid)
				return true
			end
			npcHandler:say('Niemozliwe,  przyniosles mi witches\' cap! Teraz mam juz wszystko do poteznego amuletu zycia. Ale jeszcze {missions} jest dla ciebie, przyjacielu.', cid)
			player:setStorageValue(11102, 12)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Prosze, sprobuj poszukac witches\' cap.', cid)
			addEvent(releasePlayer, 1000, cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 14 then
		if isInArray({"yes", "tak"}, msg) then
			npcHandler:say('Dobrze. Ja nie wiem jak walczyc z ta magia. Idz do siebie. Pytaj magow, czarnoksieznikow, GMow, ksiezy, inkwizycje, ja nie wiedziec kogo. Ratuj nas i ludzi przed zaglada.', cid)
			player:setStorageValue(11102, 13)
			player:setStorageValue(11107, 1)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Tak myslalem. To za duzo dla Ciebie.', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 15 then
		if isInArray({"yes", "tak"}, msg) then
			npcHandler:say('Hairycles jest dumny z ciebie. Idz i znajdz swiete wlosie. Powodzenia, przyajcielu.', cid)
			player:setStorageValue(11102, 15)
			player:setStorageValue(11108, 0)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Hmmm. Rozwaz to jeszcze raz.', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 16 then
		if isInArray({"yes", "tak"}, msg) then
			if not player:removeItem(4843, 1) then
				npcHandler:say('Nie masz futra. Straciles je? Idz i sprawdz ponownie', cid)
				player:setStorageValue(11108, 0)
				return true
			end
			npcHandler:say('Niemozliwe! Masz futro swietego Bonga! To podniesie morale mojej wioski. Jestes prawdziwym przyjacielem. Ale jeszcze jedna, ostatnia misja Cie czeka.', cid)
			player:setStorageValue(11102, 16)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Nie masz futra. Straciles je? Idz i sprawdz ponownie.', cid)
			player:setStorageValue(11108, 0)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 17 then
		if isInArray({"yes", "tak"}, msg) then
			npcHandler:say('Hairycles jest pewien, ze ci sie uda. Po prostu rozwal ta glowe tego jaszczuroludzia. Powiedz Hairyclesowi jesli uda ci sie ukonczyc misje.', cid)
			player:setStorageValue(11102, 17)
			player:addItem(4846, 1)
		elseif isInArray({"nie", "no"}, msg) then
			npcHandler:say('Hmmm. Rozwaz to jeszcze raz.', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 18 then
		if msgcontains(msg, 'yes') then
			npcHandler:say('Friend of the ape people! Take my gift and become me apprentice! Here is shaman clothing for you!', cid)
			player:addOutfit(154)
			player:addOutfit(158)
			player:setStorageValue(Storage.TheApeCity.ShamanOutfit, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		elseif msgcontains(msg, 'no') then
			npcHandler:say('Come back if change mind.', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 19 then
		if msgcontains(msg, 'yes') then
			if not player:removeItem(8111, 1) then
				npcHandler:say('You have no cookie that I\'d like.', cid)
				return true
			end

			player:setStorageValue(Storage.WhatAFoolishQuest.CookieDelivery.Hairycles, 1)
			if player:getCookiesDelivered() == 10 then
				player:addAchievement('Allow Cookies?')
			end

			Npc():getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
			npcHandler:say('Thank you, you are ... YOU SON OF LIZARD!', cid)
			addEvent(releasePlayer, 1000, cid)
		elseif msgcontains(msg, 'no') then
			npcHandler:say('I see.', cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'zajety'}, StdModule.say, {npcHandler = npcHandler, text = 'Ja wielki {czarnoksieznik}. Wielki doktor mojego malpiego {ludu}. My znac wiele roslin. My starzy i znamy wiele przykrych rzeczy o bogach GMach.'})
keywordHandler:addKeyword({'czarnoksieznik'}, StdModule.say, {npcHandler = npcHandler, text = 'We see many things and learning quick. Merlkin magic learn quick, quick. We just watch and learn. Sometimes we try and learn.'})
keywordHandler:addKeyword({'things'}, StdModule.say, {npcHandler = npcHandler, text = 'Things not good now. Need helper to do {mission} for me people.'})
keywordHandler:addKeyword({'ludu'}, StdModule.say, {npcHandler = npcHandler, text = 'My byc {kongra}, {sibang} lub {merlkin}. A dziwne malby bez wlosia, co spia w rozwalonych drzewach mieszkaja w miescie Jungla.'})
keywordHandler:addKeyword({'kongra'}, StdModule.say, {npcHandler = npcHandler, text = 'Kongra bardzo silne. Kongra bardzo wkurzone i szybkie. Uwazaj gdy kongre zobaczysz. Lepiej wejdz na najwyzszy budynek.'})
keywordHandler:addKeyword({'sibang'}, StdModule.say, {npcHandler = npcHandler, text = 'Sibang bardzo szybkie i smieszne. Sibang dobre w zbieraniu jagod. Sibang znaja {puszcze}.'})
keywordHandler:addKeyword({'merlkin'}, StdModule.say, {npcHandler = npcHandler, text = 'Merlkin to ja. Merlkin bardzo madre, merlkin ucza sie wielu rzeczy szybko. Uczymy inne malpy. Zdolne sa potem sie {leczyc} i byc zdolne robic {magia}.'})
keywordHandler:addKeyword({'magia'}, StdModule.say, {npcHandler = npcHandler, text = 'Widzimi duzo rzeczy i szybko sie uczymy. Merlkin magii ucza sie szybko, szybko. Po prosto patrzymy i robimy. To nasz sekret na Kendricka, lepszy mozg.'})
keywordHandler:addKeyword({'puszcze'}, StdModule.say, {npcHandler = npcHandler, text = 'Jungla jest niebezpieczna. Jungla rowniez obdarowuje nas jedzeniem. Hihi, nie raz upolowalismy Kendricka. Dostal kamieniem i spal. Jest bardzo dobry, bardzo smaczny.'})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
