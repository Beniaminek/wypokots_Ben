dofile ('data/tasks.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local voices = {
	{ text = 'Kazdy Wiedzmin zaczynal od taskow!' },
	{ text = 'Ze potwory to niby nie potwory? I moze mam je jeszcze dokarmiac?' },
	{ text = 'Te bestie zjedza cie przy pierwszej okazji, wiec nie mow mi ze to lagodne zwierzeta!' },
	{ text = 'Ludzie, ludzie! Te gady trzeba wytepic raz na zawsze z naszego swiata!' },
	{ text = 'Kiedys ten swiat byl przyjazny. Te potwory niszcza wszystko co napotkaja.'},
	{ text = 'Nie chce zeby moje dzieci zyly wsrod potworow!' }
}

npcHandler:addModule(VoiceModule:new(voices))
local function doPlayerAddPremiumPoints(cid, count)
		db.query('UPDATE accounts SET premium_points = premium_points+'.. count ..' WHERE id = ' .. getAccountNumberByPlayerName(getCreatureName(cid)))
end

local function onAddFocus(cid)
local player = Player(cid)
	if player:getStorageValue(295) > 0 then
		npcHandler:say("Siemaneczko, widze ze zadanie o ktore cie prosilem zostalo wykonane. O to twoja nagroda!", cid)
		
		for i = 1, #config do
			if player:getStorageValue(200+i) >= config[i].killsRequired then
				if config[i].exp > 0 then
					player:addExperience(config[i].exp, true)
				end
					player:setStorageValue(10000+i, 1)
				if config[i].money > 0 then
					player:addMoney(config[i].money)
				end
				if i > 31 and i < 38 then
									player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Nagroda za task na "..config[i].name .." to: "..config[i].exp .." punktow doswiadczenia i "..config[i].money .." zlota.")
									player:setStorageValue(200+i, -1)
				else
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Nagroda za task na "..config[i].name .." to: "..config[i].exp .." punktow doswiadczenia, "..config[i].money .." zlota oraz dostep do bossa lub lokacji (szczegoly w questlogu).")
					player:setStorageValue(200+i, -1)
				end
				
				doPlayerAddPremiumPoints(player, config[i].tibiaCoins)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Otrzymujesz "..config[i].tibiaCoins.." Tibia Coins.")
				
			end
		end
		player:setStorageValue(295, 0)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
		return false
	else
		npcHandler:say("Czesc, mam {taski} dla ciebie. Bierzesz?", cid)
	end
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local activeTasks =  false
	local mintaskid = 0
	local maxtaskid = 0
	if (player:getStorageValue(291) > 0 and player:getStorageValue(292) > 0 and player:getStorageValue(293) > 0) then
		activeTasks = true
	end
	
	if isInArray({"task", "taski", "wez", "biore", "tasks", "zadania", "zadanie", "Bierzesz"}, msg) then
		if not (player:getStorageValue(200) >= 0) then --first time talk
			player:setStorageValue(200, 0)
		end
		if getPlayerLevel(cid) <= 40 then
			mintaskid = 1
			maxtaskid = 16
		elseif getPlayerLevel(cid) <= 80 and getPlayerLevel(cid) > 40 then
			mintaskid = 17
			maxtaskid = 31
		else 
			mintaskid = 32
			maxtaskid = 100
		end
		local modal = ModalWindow (200, "Taski", "Wybierz interesujace cie zadanie: ")
		if not (activeTasks) then
			for i = 1, #config do
				if i >= mintaskid and i <= maxtaskid then
					if not (player:getStorageValue(291) == i or player:getStorageValue(292) == i or player:getStorageValue(293) == i or i == 6 or i == 2) then 
						modal:addChoice(i, config[i].name ..' (' ..config[i].killsRequired ..')')
					end
				end
			end 
		
			modal:addButton(1, "Biore")
			modal:addButton(3, "Pomoc")	
			modal:addButton(2, "Anuluj")	
			modal:setDefaultEnterButton(3)
			modal:setDefaultEscapeButton(2)   
			modal:sendToPlayer(player)
			--npcHandler:say("Powodzenia!", cid)
			--npcHandler:releaseFocus(cid)
			--npcHandler:resetNpc(cid)
		else
			npcHandler:say("Posiadasz 3 aktywne zadania. {Anuluj} je, aby wziac nowe.", cid)
		end
	elseif isInArray({"zakoncz", "koniec", "cancel", "anuluj", "Zakoncz"}, msg) then
		if (player:getStorageValue(291) > 0 or player:getStorageValue(292) > 0 or player:getStorageValue(293) > 0) then
			local modal = ModalWindow (200, "Taski", "Anuluj wybrane zadanie lub ESC:")
			--modal do zakonczenia zadan
			if (player:getStorageValue(291) > 0) then 
				modal:addChoice(player:getStorageValue(291), config[player:getStorageValue(291)].name)
			end 
			if (player:getStorageValue(292) > 0) then 
				modal:addChoice(player:getStorageValue(292), config[player:getStorageValue(292)].name)
			end 
			if (player:getStorageValue(293) > 0) then 
				modal:addChoice(player:getStorageValue(293), config[player:getStorageValue(293)].name)
			end 
		
			modal:addButton(24, "Usun Task")
			modal:addButton(2, "Wyjscie")
			modal:setDefaultEnterButton(1)
			modal:setDefaultEscapeButton(2)   
			modal:sendToPlayer(player)
			--npcHandler:say("No to elo!", cid)
			--npcHandler:releaseFocus(cid)
			--npcHandler:resetNpc(cid)
		else
			npcHandler:say("Nie masz aktywnych zadan. Zapytaj mnie o {taski}, aby rozpoczac zadanie.", cid)
		end
	end
		
end
npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())