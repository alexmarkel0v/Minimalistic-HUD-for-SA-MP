script_name('Minimalistic HUD')
script_version("1.2")
script_author("alexmarkel0v | #Northn | developez | crybaby")

local memory = require 'memory'
local game_weapons = require 'game.weapons'
local weapons_list = game_weapons.names
local inicfg = require 'inicfg'

mainIni = inicfg.load(
{
	coordsmainhud =
	{
		ycoord = 719,
		xcoord = 1095,
	}
}, "min_hud.ini")

local settings = "moonloader/config/min_hud.ini"
local settingsIni = inicfg.load(mainIni, settings)

if not doesFileExist('moonloader/config/min_hud.ini') then inicfg.save(mainIni, 'min_hud.ini') end

local x = mainIni.coordsmainhud.xcoord
local y = mainIni.coordsmainhud.ycoord

local font = renderCreateFont("Bebas Neue Bold", 14, 1)

weapons_list[1] = 'Кастет'
weapons_list[2] = 'Клюшка для гольфа'
weapons_list[3] = 'Дубинка'
weapons_list[4] = 'Нож'
weapons_list[5] = 'Бита'
weapons_list[6] = 'Лопата'
weapons_list[7] = 'Кий'
weapons_list[8] = 'Катана'
weapons_list[9] = 'Бензопила'
weapons_list[15] = 'Трость'
weapons_list[16] = 'Граната'
weapons_list[17] = 'Дымовая граната'
weapons_list[18] = 'Молотов'
weapons_list[23] = 'Электрошокер'
weapons_list[31] = 'M4A1'
weapons_list[41] = 'Перцовый баллон'
weapons_list[42] = 'Огнетушитель'
weapons_list[43] = 'Фотоаппарат'
weapons_list[46] = 'Парашют'

setGxtEntry("LANDSTK","LANDSTALKER")
setGxtEntry("LINERUN","LINERUNNER")
setGxtEntry("PEREN","PERENIAL")
setGxtEntry("SENTINL","SENTINEL")
setGxtEntry("FIRETRK","FIRE TRUCK")
setGxtEntry("TRASHM","TRASHMASTER")
setGxtEntry("INFERNU","INFERNUS")
setGxtEntry("AMBULAN","AMBULANCE")
setGxtEntry("LEVIATH","LEVIATHAN")
setGxtEntry("MOONBM","MOONBEAM")
setGxtEntry("ESPERAN","ESPERANTO")
setGxtEntry("WASHING","WASHINGTON")
setGxtEntry("BFINJC","BF INJECTION")
setGxtEntry("ENFORCR","ENFORCER")
setGxtEntry("SECURI","SECURICAR")
setGxtEntry("PREDATR","PREDATOR")
setGxtEntry("BARRCKS","BARRACKS")
setGxtEntry("HOTKNIF","HOTKNIFE")
setGxtEntry("ARTICT1","ARTICT 1")
setGxtEntry("STALION","STALLION")
setGxtEntry("RCBANDT","RC BANDIT")
setGxtEntry("SEASPAR","SEASPARROW")
setGxtEntry("PIZZABO","PIZZABOY")
setGxtEntry("ARTICT2","ARTICT 2")
setGxtEntry("FLATBED","FLATBED")
setGxtEntry("PCJ600","PCJ-600")
setGxtEntry("RCBARON","RC BARON")
setGxtEntry("RCRAIDE","RC RAIDER")
setGxtEntry("GLENDAL","GLENDALE")
setGxtEntry("QUAD","QUADBIKE")
setGxtEntry("COASTG","COASTGUARD")
setGxtEntry("ZR350","ZR-350")
setGxtEntry("MAVERIC","MAVERICK")
setGxtEntry("SANMAV","NEWS CHOPPER")
setGxtEntry("FBIRANC","FBI RANCHER")
setGxtEntry("GREENWO","GREENWOOD")
setGxtEntry("HOTRING","HOTRING RACER")
setGxtEntry("SANDKIN","SANDKING")
setGxtEntry("BLISTAC","BLISTA COMPACT")
setGxtEntry("POLMAV","POLICE MAVERICK")
setGxtEntry("BOXVILL","BOXVILLE")
setGxtEntry("RCGOBLI","RC GOBLIN")
setGxtEntry("HOTRINA","HOTRING RACER A")
setGxtEntry("HOTRINB","HOTRING RACER B")
setGxtEntry("BLOODRA","BLOODRING BANGER")
setGxtEntry("SUPERGT","SUPER GT")
setGxtEntry("MTBIKE","MOUNTAIN BIKE")
setGxtEntry("CROPDST","CROPDUSTER")
setGxtEntry("STUNT","STUNTPLANE")
setGxtEntry("PETROL","TANKER")
setGxtEntry("RDTRAIN","ROADTRAIN")
setGxtEntry("MAJESTC","MAJESTIC")
setGxtEntry("BUCCANE","BUCCANEER")
setGxtEntry("FCR900","FCR-900")
setGxtEntry("NRG500","NRG-500")
setGxtEntry("HPV1000","HPV-1000")
setGxtEntry("CEMENT","CEMENT TRUCK")
setGxtEntry("TOWTRUK","TOWTRUCK")
setGxtEntry("FBITRUK","FBI TRUCK")
setGxtEntry("FORKLFT","FORKLIFT")
setGxtEntry("COMBINE","COMBINE HARVESTER")
setGxtEntry("REMING","REMINGTON")
setGxtEntry("STREAK","BROWN STREAK")
setGxtEntry("FIRELA","FIRE TRUCK")
setGxtEntry("INTRUDR","INTRUDER")
setGxtEntry("CARGOBB","CARGOBOB")
setGxtEntry("UTILITY","UTILLITY VAN")
setGxtEntry("YOSEMIT","YOSEMITE")
setGxtEntry("MONSTA","MONSTER A")
setGxtEntry("MONSTB","MONSTER B")
setGxtEntry("RAINDNC","RAINDANCE")
setGxtEntry("RCTIGER","RC TIGER")
setGxtEntry("FRFLAT","FRIGHTFLAT")
setGxtEntry("STREAKC","STREAK")
setGxtEntry("BROADWY","BROADWAY")
setGxtEntry("AT400","AT-400")
setGxtEntry("DFT30","DFT-30")
setGxtEntry("STAFFRD","STAFFORD")
setGxtEntry("BF400","BF-400")
setGxtEntry("PETROTR","PETROL TRAILER")
setGxtEntry("WAYFARE","WAYFARER")
setGxtEntry("FRBOX","FRIGHTBOX")
setGxtEntry("ARTICT3","ARTICT 3")
setGxtEntry("ANDROM","ANDROMADA")
setGxtEntry("RCCAM","RC CAM")
setGxtEntry("POLICAR","POLICE CAR")
setGxtEntry("SWATVAN","S.W.A.T.")
setGxtEntry("GLENSHI","GLENSHIT")
setGxtEntry("SADLSHI","SADLSHIT")
setGxtEntry("BAGBOXA","BAGBOX A")
setGxtEntry("BAGBOXB","BAGBOX B")
setGxtEntry("TUGSTAI","TUGSTAIR")
setGxtEntry("FARMTR1","FARMTRAILER")
setGxtEntry("UTILTR1","UTILLTYTRAILER")

function main()
	print("Authors: "..unpack(thisScript().authors))
	while not isSampAvailable() do wait(50) end
	while not sampIsLocalPlayerSpawned() do wait(50) end
	displayHud(false)	
	
	sampRegisterChatCommand('chpos', cmd_changepos)
	
	while true do wait(0)
		local HP = getCharHealth(PLAYER_PED) < 100 and getCharHealth(PLAYER_PED) > -1 and getCharHealth(PLAYER_PED) or 100
		local ARMOR = getCharArmour(PLAYER_PED) < 100 and getCharArmour(PLAYER_PED) or 100
		local OXYGEN = getWaterLocalPlayer() < 100 and getWaterLocalPlayer() or 100
		local SPRINT = getSprintLocalPlayer() < 100 and getSprintLocalPlayer() or 100
		local weapon = getCurrentCharWeapon(PLAYER_PED)
		local money = getPlayerMoney(PLAYER_HANDLE)
		ScreenX, ScreenY = getScreenResolution()
		local righttext = string.upper(game_weapons.get_name(weapon))..(weapon > 15 and weapon ~= 46 and ' ('..getAmmoInClip() ..'/'.. getAmmoInCharWeapon(PLAYER_PED, weapon) - getAmmoInClip()..')' or '')
		renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) - 2, ScreenX / 4.5, ScreenY / 250, 0xff818381)
		if ScreenY < 1080 then
			renderDrawBox(ScreenX * (x / ScreenX), ScreenY * (y / ScreenY), ScreenX / 4.5, ScreenY / 26.1, 0xff111111)
		else
			renderDrawBox(ScreenX * (x / ScreenX), ScreenY * (y / ScreenY), ScreenX / 4.5, ScreenY / 35, 0xff111111)
		end
		renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 30, (ScreenX / 450) * HP, ScreenY / 230, 0xEEDC5A63)
		renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 37, (ScreenX / 450) * ARMOR, ScreenY / 230, 0xEE818381)
		if isCharInWater(PLAYER_PED) and not isCharInAnyCar(PLAYER_PED) then 
			renderDrawBox(ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) + 44, (ScreenX / 450) * OXYGEN , ScreenY / 230, 0xAA4682B4)
		end
		if not isCharInWater(PLAYER_PED) and not isCharInAnyCar(PLAYER_PED) then
			renderDrawBox(ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) + 44, (ScreenX / 450) * SPRINT, ScreenY / 230, 0xAA90EE90)
		end
		if not isCharInAnyCar(PLAYER_PED) then
			if ScreenY < 1080 then
				renderFontDrawText(font, 'Вне т/с', ScreenX * (x / ScreenX),  (ScreenY * (y / ScreenY)) - 23.5, 0xEEC7C7C7, true)
			else
				renderFontDrawText(font, 'Вне т/с', ScreenX * (x / ScreenX),  (ScreenY * (y / ScreenY)) - 26.5, 0xEEC7C7C7, true)
			end
		end
		if isCharInAnyCar(PLAYER_PED) then
			if ScreenY < 1080 then
				renderFontDrawText(font, getGxtText(getNameOfVehicleModel(getCarModel(storeCarCharIsInNoSave(PLAYER_PED)))), ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) - 23.5, 0xEEC7C7C7, true)
			else 
				renderFontDrawText(font, getGxtText(getNameOfVehicleModel(getCarModel(storeCarCharIsInNoSave(PLAYER_PED)))), ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) - 26.5, 0xEEC7C7C7, true)
			end
			if isCharInModel(PLAYER_PED) ~= 537 or isCharInModel(PLAYER_PED) ~= 538 or isCharInModel(PLAYER_PED) ~= 569 or isCharInModel(PLAYER_PED) ~= 570 or isCharInModel(PLAYER_PED) ~= 590 then
				local carhp = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED))
				renderDrawBox(ScreenX * (x / ScreenX),  ScreenY * (y / ScreenY) + 44, (ScreenX / 450) * carhp/10, ScreenY / 230, 0xEED2B48C)
			end
		end
		if weapon == 0 then
			if ScreenY < 1080 then
				renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, money..'$') * (600 / ScreenX), ScreenY * (y / ScreenY) + 5.5, 0xEEC7C7C7, true)
			else
				renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, money..'$') * (600 / ScreenX), ScreenY * (y / ScreenY) + 4.4, 0xEEC7C7C7, true)
			end
		else
			if ScreenY < 1080 then
				renderFontDrawText(font, righttext, ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, righttext)-3 + (ScreenX / 4.5), (ScreenY * (y / ScreenY)) + 5.5, 0xEEC7C7C7, true)
				renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + 3, (ScreenY * (y / ScreenY)) + 5.5, 0xEEC7C7C7, true)
			else
				renderFontDrawText(font, righttext, ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, righttext)-3 + (ScreenX / 4.5), (ScreenY * (y / ScreenY)) + 4.4, 0xEEC7C7C7, true)
				renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + 3, (ScreenY * (y / ScreenY)) + 4.4, 0xEEC7C7C7, true)
			end
		end
	end
end

function cmd_changepos()
	lua_thread.create(function()
		showCursor(true, true)
		while not isKeyDown(0x01) do wait(0) x,y = getCursorPos() end
		showCursor(false, false)
		settingsIni.coordsmainhud.xcoord = x
		settingsIni.coordsmainhud.ycoord = y
		inicfg.save(mainIni, settings)
	end)
end
			
function getAmmoInClip()
	local struct = getCharPointer(PLAYER_PED)
	local prisv = struct + 0x0718
	local prisv = memory.getint8(prisv, false)
	local prisv = prisv * 0x1C
	local prisv2 = struct + 0x5A0
	local prisv2 = prisv2 + prisv
	local prisv2 = prisv2 + 0x8
	local ammo = memory.getint32(prisv2, false)
	return ammo
end

function onScriptTerminate(script, quitGame)
	if script == thisScript() then displayHud(true) end
end

function getWaterLocalPlayer()
    local float = memory.getfloat(0xB7CDE0)
    return float/39.97000244
end

function getSprintLocalPlayer()
    local float = memory.getfloat(0xB7CDB4)
    return float/31.47000244
end

function comma_value(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)')
	return left..(num:reverse():gsub('(%d%d%d)','%1.'):reverse())..right
end

function separator(text)
	for S in string.gmatch(text, "%d+") do
	    local replace = comma_value(S)
	    text = string.gsub(text, S, replace)
	end
	return text
end