function _()
    (""):Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()
    (""):Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()
    (""):Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()
    (""):Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()
    (""):Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()():Ж()
end

script_name('Minimalistic HUD')
script_version("1.4.2.2.1")
script_author("alexmarkel0v (јлександр ћаркелов), Rich.W, »ль€ –убинковский")

require 'libstd.deps' {
   'fyp:mimgui',
   'fyp:samp-lua'
}

local memorycheck, memory = pcall(require, "memory")
local sampevcheck, sampev = pcall(require, "lib.samp.events")
local vkeyscheck, vkeys = pcall(require, "vkeys")
local game_weapons = require 'game.weapons'
local weapons_list = game_weapons.names
local inicfg = require 'inicfg'
local mimgui, ffi = require 'mimgui', require 'ffi'
local new, str = mimgui.new, ffi.string
local encoding = require 'encoding'
encoding.default = 'CP1251'
local u8 = encoding.UTF8

ffi.cdef[[
bool SetCursorPos(int X, int Y);
]]

local mainc = mimgui.ImVec4(0.0, 0.52, 0.74, 1.0) -- —иний

local mimShow = new.bool()
local mimChangeProgressBar = new.bool()
local mimChangeHudPos = new.bool()
local mimWanted = new.bool()
local mimHud = new.bool(true)
local mimSizeFont = new.int(14)
local mimMainTextPos = new.int(0)
local mimOtherTextPos = new.int(0)
local mimProgressPos = new.int(0)
local mimMoneyPos = new.int(0)

mainIni = inicfg.load(
{
	main =
	{
		ycoord = 706,
		xcoord = 957,
		sizefont = mimSizeFont[0],
		posmaintext = mimMainTextPos[0],
		posothertext = mimOtherTextPos[0],
		posprogressbar = mimProgressPos[0],
		posmoney = mimMoneyPos[0],
		wanted = mimWanted[0],
		hud = mimHud[0],
	}
}, "min_hud.ini")

local settings = "moonloader/config/min_hud.ini"
local settingsIni = inicfg.load(mainIni, settings)

if not doesFileExist('moonloader/config/min_hud.ini') then inicfg.save(mainIni, 'min_hud.ini') end

local x = mainIni.main.xcoord
local y = mainIni.main.ycoord
local fontsize = mainIni.main.sizefont
local textposmain = mainIni.main.posmaintext
local textposother = mainIni.main.posothertext
local progressbarpos = mainIni.main.posprogressbar
local moneypos = mainIni.main.posmoney
local showhud = mainIni.main.hud
local wanted = mainIni.main.wanted
local font = renderCreateFont("Bebas Neue Bold", fontsize, 1)

local project

weapons_list[1] = ' астет'
weapons_list[2] = ' люшка дл€ гольфа'
weapons_list[3] = 'ƒубинка'
weapons_list[4] = 'Ќож'
weapons_list[5] = 'Ѕита'
weapons_list[6] = 'Ћопата'
weapons_list[7] = ' ий'
weapons_list[8] = ' атана'
weapons_list[9] = 'Ѕензопила'
weapons_list[15] = '“рость'
weapons_list[16] = '√раната'
weapons_list[17] = 'ƒымова€ граната'
weapons_list[18] = 'ћолотов'
weapons_list[23] = 'Ёлектрошокер'
weapons_list[31] = 'M4A1'
weapons_list[41] = 'ѕерцовый баллон'
weapons_list[42] = 'ќгнетушитель'
weapons_list[43] = '‘отоаппарат'
weapons_list[46] = 'ѕарашют'


setGxtEntry("LANDSTK","LANDSTALKER")
setGxtEntry("BRAVURA","BRAVURA")
setGxtEntry("BUFFALO","BUFFALO")
setGxtEntry("LINERUN","LINERUNNER")
setGxtEntry("PEREN","PERENIAL")
setGxtEntry("SENTINL","SENTINEL")
setGxtEntry("DUMPER","DUMPER")
setGxtEntry("FIRETRK","FIRE TRUCK")
setGxtEntry("TRASHM","TRASHMASTER")
setGxtEntry("STRETCH","STRETCH")
setGxtEntry("MANANA","MANANA")
setGxtEntry("INFERNU","INFERNUS")
setGxtEntry("VOODOO","VOODOO")
setGxtEntry("PONY","PONY")
setGxtEntry("MULE","MULE")
setGxtEntry("CHEETAH","CHEETAH")
setGxtEntry("AMBULAN","AMBULANCE")
setGxtEntry("LEVIATH","LEVIATHAN")
setGxtEntry("MOONBM","MOONBEAM")
setGxtEntry("ESPERAN","ESPERANTO")
setGxtEntry("TAXI","TAXI")
setGxtEntry("WASHING","WASHINGTON")
setGxtEntry("BOBCAT","BOBCAT")
setGxtEntry("WHOOPEE","Mr.WHOOPEE")
setGxtEntry("BFINJC","BF INJECTION")
setGxtEntry("HUNTER","HUNTER")
setGxtEntry("PREMIER","PREMIER")
setGxtEntry("ENFORCR","ENFORCER")
setGxtEntry("SECURI","SECURICAR")
setGxtEntry("BANSHEE","BANSHEE")
setGxtEntry("PREDATR","PREDATOR")
setGxtEntry("BUS","BUS")
setGxtEntry("RHINO","RHINO")
setGxtEntry("BARRCKS","BARRACKS")
setGxtEntry("HOTKNIF","HOTKNIFE")
setGxtEntry("ARTICT1","ARTICT 1")
setGxtEntry("PREVION","PREVION")
setGxtEntry("COACH","COACH")
setGxtEntry("CABBIE","CABBIE")
setGxtEntry("STALION","STALLION")
setGxtEntry("RUMPO","RUMPO")
setGxtEntry("RCBANDT","RC BANDIT")
setGxtEntry("ROMERO","ROMERO")
setGxtEntry("PACKER","PACKER")
setGxtEntry("MONSTER","MONSTER")
setGxtEntry("ADMIRAL","ADMIRAL")
setGxtEntry("SQUALO","SQUALO")
setGxtEntry("SEASPAR","SEASPARROW")
setGxtEntry("PIZZABO","PIZZABOY")
setGxtEntry("TRAM","TRAM")
setGxtEntry("ARTICT2","ARTICT 2")
setGxtEntry("TURISMO","TURISMO")
setGxtEntry("SPEEDER","SPEEDER")
setGxtEntry("REEFER","REEFER")
setGxtEntry("TROPIC","TROPIC")
setGxtEntry("FLATBED","FLATBED")
setGxtEntry("YANKEE","YANKEE")
setGxtEntry("CADDY","CADDY")
setGxtEntry("SOLAIR","SOLAIR")
setGxtEntry("TOPFUN","BERKLEY's RC VAN")
setGxtEntry("SKIMMER","SKIMMER")
setGxtEntry("PCJ600","PCJ-600")
setGxtEntry("FAGGIO","FAGGIO")
setGxtEntry("FREEWAY","FREEWAY")
setGxtEntry("RCBARON","RC BARON")
setGxtEntry("RCRAIDE","RC RAIDER")
setGxtEntry("GLENDAL","GLENDALE")
setGxtEntry("OCEANIC","OCEANIC")
setGxtEntry("SANCHEZ","SANCHEZ")
setGxtEntry("SPARROW","SPARROW")
setGxtEntry("PATRIOT","PATRIOT")
setGxtEntry("QUAD","QUADBIKE")
setGxtEntry("COASTG","COASTGUARD")
setGxtEntry("DINGHY","DINGHY")
setGxtEntry("HERMES","HERMES")
setGxtEntry("SABRE","SABRE")
setGxtEntry("RUSTLER","RUSTLER")
setGxtEntry("ZR350","ZR-350")
setGxtEntry("WALTON","WALTON")
setGxtEntry("REGINA","REGINA")
setGxtEntry("COMET","COMET")
setGxtEntry("BMX","BMX")
setGxtEntry("BURRITO","BURRITO")
setGxtEntry("CAMPER","CAMPER")
setGxtEntry("MARQUIS","MARQUIS")
setGxtEntry("BAGGAGE","BAGGAGE")
setGxtEntry("DOZER","DOZER")
setGxtEntry("MAVERIC","MAVERICK")
setGxtEntry("SANMAV","NEWS CHOPPER")
setGxtEntry("RANCHER","RANCHER")
setGxtEntry("FBIRANC","FBI RANCHER")
setGxtEntry("VIRGO","VIRGO")
setGxtEntry("GREENWO","GREENWOOD")
setGxtEntry("JETMAX","JETMAX")
setGxtEntry("HOTRING","HOTRING RACER")
setGxtEntry("SANDKIN","SANDKING")
setGxtEntry("BLISTAC","BLISTA COMPACT")
setGxtEntry("POLMAV","POLICE MAVERICK")
setGxtEntry("BOXVILL","BOXVILLE")
setGxtEntry("BENSON","BENSON")
setGxtEntry("MESAA","MESA")
setGxtEntry("RCGOBLI","RC GOBLIN")
setGxtEntry("HOTRINA","HOTRING RACER A")
setGxtEntry("HOTRINB","HOTRING RACER B")
setGxtEntry("BLOODRA","BLOODRING BANGER")
setGxtEntry("RANCHER","RANCHER")
setGxtEntry("SUPERGT","SUPER GT")
setGxtEntry("ELEGANT","ELEGANT")
setGxtEntry("JOURNEY","JOURNEY")
setGxtEntry("BIKE","BIKE")
setGxtEntry("MTBIKE","MOUNTAIN BIKE")
setGxtEntry("BEAGLE","BEAGLE")
setGxtEntry("CROPDST","CROPDUSTER")
setGxtEntry("STUNT","STUNTPLANE")
setGxtEntry("PETROL","TANKER")
setGxtEntry("RDTRAIN","ROADTRAIN")
setGxtEntry("NEBULA","NEBULA")
setGxtEntry("MAJESTC","MAJESTIC")
setGxtEntry("BUCCANE","BUCCANEER")
setGxtEntry("SHAMAL","SHAMAL")
setGxtEntry("HYDRA","HYDRA")
setGxtEntry("FCR900","FCR-900")
setGxtEntry("NRG500","NRG-500")
setGxtEntry("HPV1000","HPV-1000")
setGxtEntry("CEMENT","CEMENT TRUCK")
setGxtEntry("TOWTRUK","TOWTRUCK")
setGxtEntry("FORTUNE","FORTUNE")
setGxtEntry("CADRONA","CADRONA")
setGxtEntry("FBITRUK","FBI TRUCK")
setGxtEntry("WILLARD","WILLARD")
setGxtEntry("FORKLFT","FORKLIFT")
setGxtEntry("TRACTOR","TRACTOR")
setGxtEntry("COMBINE","COMBINE HARVESTER")
setGxtEntry("FELTZER","FELTZER")
setGxtEntry("REMING","REMINGTON")
setGxtEntry("SLAMVAN","SLAMVAN")
setGxtEntry("BLADE","BLADE")
setGxtEntry("FREIGHT","FREIGHT")
setGxtEntry("STREAK","BROWN STREAK")
setGxtEntry("VORTEX","VORTEX")
setGxtEntry("VINCENT","VINCENT")
setGxtEntry("BULLET","BULLET")
setGxtEntry("CLOVER","CLOVER")
setGxtEntry("SADLER","SADLER")
setGxtEntry("FIRELA","FIRE TRUCK")
setGxtEntry("HUSTLER","HUSTLER")
setGxtEntry("INTRUDR","INTRUDER")
setGxtEntry("PRIMO","PRIMO")
setGxtEntry("CARGOBB","CARGOBOB")
setGxtEntry("TAMPA","TAMPA")
setGxtEntry("SUNRISE","SUNRISE")
setGxtEntry("MERIT","MERIT")
setGxtEntry("UTILITY","UTILLITY VAN")
setGxtEntry("NEVADA","NEVADA")
setGxtEntry("YOSEMIT","YOSEMITE")
setGxtEntry("WINDSOR","WINDSOR")
setGxtEntry("MONSTA","MONSTER A")
setGxtEntry("MONSTB","MONSTER B")
setGxtEntry("URANUS","URANUS")
setGxtEntry("JESTER","JESTER")
setGxtEntry("SULTAN","SULTAN")
setGxtEntry("STRATUM","STRATUM")
setGxtEntry("ELEGY","ELEGY")
setGxtEntry("RAINDNC","RAINDANCE")
setGxtEntry("RCTIGER","RC TIGER")
setGxtEntry("FLASH","FLASH")
setGxtEntry("TAHOMA","TAHOMA")
setGxtEntry("SAVANNA","SAVANNA")
setGxtEntry("BANDITO","BANDITO")
setGxtEntry("FRFLAT","FRIGHTFLAT")
setGxtEntry("STREAKC","STREAK")
setGxtEntry("KART","KART")
setGxtEntry("MOWER","MOWER")
setGxtEntry("DUNE","DUNE")
setGxtEntry("SWEEPER","SWEEPER")
setGxtEntry("BROADWY","BROADWAY")
setGxtEntry("TORNADO","TORNADO")
setGxtEntry("AT400","AT-400")
setGxtEntry("DFT30","DFT-30")
setGxtEntry("HUNTLEY","HUNTLEY")
setGxtEntry("STAFFRD","STAFFORD")
setGxtEntry("BF400","BF-400")
setGxtEntry("NEWSVAN","NEWSVAN")
setGxtEntry("TUG","TUG")
setGxtEntry("PETROTR","PETROL TRAILER")
setGxtEntry("EMPEROR","EMPEROR")
setGxtEntry("WAYFARE","WAYFARER")
setGxtEntry("EUROS","EUROS")
setGxtEntry("HOTDOG","HOTDOG")
setGxtEntry("CLUB","CLUB")
setGxtEntry("FRBOX","FRIGHTBOX")
setGxtEntry("ARTICT3","ARTICT 3")
setGxtEntry("ANDROM","ANDROMADA")
setGxtEntry("DODO","DODO")
setGxtEntry("RCCAM","RC CAM")
setGxtEntry("LAUNCH","LAUNCH")
setGxtEntry("POLICAR","POLICE CAR")
setGxtEntry("POLICAR","POLICE CAR")
setGxtEntry("POLICAR","POLICE CAR")
setGxtEntry("RANGER","RANGER")
setGxtEntry("PICADOR","PICADOR")
setGxtEntry("SWATVAN","S.W.A.T.")
setGxtEntry("ALPHA","ALPHA")
setGxtEntry("PHOENIX","PHOENIX")
setGxtEntry("GLENSHI","GLENSHIT")
setGxtEntry("SADLSHI","SADLSHIT")
setGxtEntry("BAGBOXA","BAGBOX A")
setGxtEntry("BAGBOXB","BAGBOX B")
setGxtEntry("TUGSTAI","TUGSTAIR")
setGxtEntry("BOXBURG","BOXBURG")
setGxtEntry("FARMTR1","FARMTRAILER")
setGxtEntry("UTILTR1","UTILLTYTRAILER")

function main()
	if getMoonloaderVersion() <= 26 then 
		print("¬ерси€ moonloader'а ниже 0.27. —качивание библиотек невозможно.")
		thisScript():unload()
	end
	
	if memorycheck == false or sampevcheck == false or vkeyscheck == false then
		print("ќдна из важных библиотек (memory, SAMP.Lua, vkeys) отсутствует.")
		print("ѕроверьте их наличие у себ€ в папке с игрой и перезайдите.")
		thisScript():unload()
	end
	
	mimHud[0] = showhud
	mimSizeFont[0] = fontsize
	mimMainTextPos[0] = textposmain
	mimOtherTextPos[0] = textposother
	mimProgressPos[0] = progressbarpos
	mimWanted[0] = wanted
	mimMoneyPos[0] = moneypos
	
	while not isSampAvailable() do wait(50) end
	while not sampIsLocalPlayerSpawned() do wait(50) end
	
	if showhud then displayHud(false) end
	
	print('«агрузка завершена. Ќастройки: /hud_settings. ѕользуйтесь :)')
	print('јвтор: alexmarkel0v (vk.com/alexmarkel0v).')
	print('ќсоба€ благодарность: Rich.W (vk.com/id233900209)')
	print('» также спасибо за помощь в тесте »лье –убинковскому (vk.com/id334546143)')
	
	sampRegisterChatCommand('hud_pos', cmd_changepos)
	sampRegisterChatCommand('hud_settings', cmd_settings)
	
	while true do wait(0)
		if showhud then
			check_project()
			local HP = getCharHealth(PLAYER_PED) < 100 and getCharHealth(PLAYER_PED) > -1 and getCharHealth(PLAYER_PED) or 100
			local ARMOR = getCharArmour(PLAYER_PED) < 100 and getCharArmour(PLAYER_PED) or 100
			local OXYGEN = getWaterLocalPlayer() < 100 and getWaterLocalPlayer() or 100
			local SPRINT = getSprintLocalPlayer() < 100 and getSprintLocalPlayer() or 100
			local weapon = getCurrentCharWeapon(PLAYER_PED)
			local money = getPlayerMoney(PLAYER_HANDLE)
			local ScreenX, ScreenY = getScreenResolution()
			local wantedlevel = memory.getuint8(0x58DB60)
			local righttext = string.upper(game_weapons.get_name(weapon))..(weapon > 15 and weapon ~= 46 and ' ('..getAmmoInClip() ..'/'.. getAmmoInCharWeapon(PLAYER_PED, weapon) - getAmmoInClip()..')' or '')
			renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) - 2, ScreenX / 4.5, ScreenY / 250, 0xFF818381)
			if HP > 0 then
				renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 30, (ScreenX / 450) * 100, ScreenY / 230, 0x557D7F7D)
				renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 30, (ScreenX / 450) * HP, ScreenY / 230, 0xEEDC5A63)
			end
			if ARMOR > 0 and HP > 0 then
				renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 35 - progressbarpos, (ScreenX / 450) * 100, ScreenY / 230, 0x557D7F7D)
				renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 35 - progressbarpos, (ScreenX / 450) * ARMOR, ScreenY / 230, 0xEE818381)
			end
			if isCharInWater(PLAYER_PED) or isCharInAnyCar(PLAYER_PED) and isCarInWater(storeCarCharIsInNoSave(PLAYER_PED)) and HP > 0 then 
				renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + (ARMOR > 0 and 40 or 35) - (ARMOR > 0 and progressbarpos*2 or progressbarpos), (ScreenX / 450) * 100, ScreenY / 230, 0x557D7F7D)
				renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + (ARMOR > 0 and 40 or 35) - (ARMOR > 0 and progressbarpos*2 or progressbarpos), (ScreenX / 450) * OXYGEN , ScreenY / 230, 0xEE4682B4)
			end
			if mimChangeProgressBar[0] then
				renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 30, (ScreenX / 450) * 100, ScreenY / 230, 0xEEDC5A63)
				renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 35 - progressbarpos, (ScreenX / 450) * 100, ScreenY / 230, 0xEE818381)
				renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 40 - progressbarpos*2, (ScreenX / 450) * 100, ScreenY / 230, 0xEE4682B4)
			end
			if ScreenX < 1920 then
				renderDrawBox(ScreenX * (x / ScreenX), ScreenY * (y / ScreenY), ScreenX / 4.5, ScreenY / 26.1, 0xEE111111)
				if isCharInAnyCar(PLAYER_PED) then
					local speed = getCarSpeed(storeCarCharIsInNoSave(PLAYER_PED))
					renderFontDrawText(font, 'L', ScreenX * (x / ScreenX) + (ScreenX / 4.6), ScreenY * (y / ScreenY) - 23.5 - textposother, (isCarLightsOn(storeCarCharIsInNoSave(PLAYER_PED)) and 0xEEDC5A63 or 0xEEC7C7C7), (isCarLightsOn(storeCarCharIsInNoSave(PLAYER_PED)) and false or true))
					renderFontDrawText(font, 'E', ScreenX * (x / ScreenX) + (ScreenX / 4.95), ScreenY * (y / ScreenY) - 23.5 - textposother, (isCarEngineOn(storeCarCharIsInNoSave(PLAYER_PED)) and 0xEEDC5A63 or 0xEEC7C7C7), (isCarEngineOn(storeCarCharIsInNoSave(PLAYER_PED)) and false or true))
					if project == 0 then
						renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 23.5 - textposother, (getCarDoorLockStatus(storeCarCharIsInNoSave(PLAYER_PED)) == 2 and 0xEEDC5A63 or 0xEEC7C7C7), (getCarDoorLockStatus(storeCarCharIsInNoSave(PLAYER_PED)) == 2 and false or true))
						renderFontDrawText(font, math.floor(speed*3.77)..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, math.floor(speed*3.77)..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 6 - textposmain, 0xEEC7C7C7, true)
					else
						if project == 1 then
							if sampTextdrawIsExists(2264) then
								_, colordoors, _, _ = sampTextdrawGetBoxEnabledColorAndSize(2264)
								renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 23.5 - textposother, (colordoors ~= 671088640 and 0xEEDC5A63 or 0xEEC7C7C7), (colordoors ~= 671088640 and false or true))
							end
							if sampTextdrawIsExists(2265) then
								_, colorsport, _, _ = sampTextdrawGetBoxEnabledColorAndSize(2265)
								renderFontDrawText(font, 'S', ScreenX * (x / ScreenX) + (ScreenX / 5.915), ScreenY * (y / ScreenY) - 23.5 - textposother, (colorsport ~= 671088640 and 0xEEDC5A63 or 0xEEC7C7C7), (colorsport ~= 671088640 and false or true))
							end
							if sampTextdrawIsExists(2256) then
								speed1 = sampTextdrawGetString(2256)
								renderFontDrawText(font, string.match(speed1, "(%d+)")..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, string.match(speed1, "(%d+)")..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 6 - textposmain, 0xEEC7C7C7, true)
							else
								renderFontDrawText(font, math.floor(speed*3.77)..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, math.floor(speed*3.77)..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 6 - textposmain, 0xEEC7C7C7, true)
							end
							if sampTextdrawIsExists(2261) then
								liters = sampTextdrawGetString(2261)
								renderFontDrawText(font, string.match(liters, "(%d+)")..' L', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, string.match(liters, "(%d+)")..' L') * (600 / ScreenX), ScreenY * (y / ScreenY) + 6 - textposmain, 0xEEC7C7C7, true)
							end
						end
					end
					if mimWanted[0] and wantedlevel > 0 then 
						renderFontDrawText(font, getGxtText(getNameOfVehicleModel(getCarModel(storeCarCharIsInNoSave(PLAYER_PED)))), ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) - 40 - textposother*2, 0xEEC7C7C7, true)
						renderFontDrawText(font, "¬ розыске! (".. wantedlevel ..")", ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) - 23.5 - textposother, 0xEEC7C7C7, true)
					else 
						renderFontDrawText(font, getGxtText(getNameOfVehicleModel(getCarModel(storeCarCharIsInNoSave(PLAYER_PED)))), ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) - 23.5 - textposother, 0xEEC7C7C7, true)
					end
					renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + 3, (ScreenY * (y / ScreenY)) + 6 - textposmain, 0xEEC7C7C7, true)
					if isCharInModel(PLAYER_PED) ~= 537 or isCharInModel(PLAYER_PED) ~= 538 or isCharInModel(PLAYER_PED) ~= 569 or isCharInModel(PLAYER_PED) ~= 570 or isCharInModel(PLAYER_PED) ~= 590 then
						local carhp = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED))
						renderFontDrawText(font, (carhp/10)..'%', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, (carhp/10)..'%') * (600 / ScreenX), ScreenY * (y / ScreenY) - 23.5 - textposother, 0xEEC7C7C7, true)
					end
				else
					if weapon == 0 then
						renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, money..'$') * (600 / ScreenX) - moneypos, ScreenY * (y / ScreenY) + 6 - textposmain, 0xEEC7C7C7, true)
					else
						renderFontDrawText(font, righttext, ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, righttext) - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 6 - textposmain, 0xEEC7C7C7, true)
						renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + 3, ScreenY * (y / ScreenY) + 6 - textposmain, 0xEEC7C7C7, true)
					end
					if mimWanted[0] and wantedlevel > 0 then
						renderFontDrawText(font, "¬ розыске! (".. wantedlevel ..")", ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) - 23.5 - textposother, 0xEEC7C7C7, true)
					end
				end
			end
			if ScreenX == 1920 then
				renderDrawBox(ScreenX * (x / ScreenX), ScreenY * (y / ScreenY), ScreenX / 4.5, ScreenY / 35, 0xEE111111)
				if isCharInAnyCar(PLAYER_PED) then
					local speed = getCarSpeed(storeCarCharIsInNoSave(PLAYER_PED))
					renderFontDrawText(font, 'L', ScreenX * (x / ScreenX) + (ScreenX / 4.6), ScreenY * (y / ScreenY) - 26.5 - textposother, (isCarLightsOn(storeCarCharIsInNoSave(PLAYER_PED)) and 0xEEDC5A63 or 0xEEC7C7C7), (isCarLightsOn(storeCarCharIsInNoSave(PLAYER_PED)) and false or true))
					renderFontDrawText(font, 'E', ScreenX * (x / ScreenX) + (ScreenX / 4.95), ScreenY * (y / ScreenY) - 26.5 - textposother, (isCarEngineOn(storeCarCharIsInNoSave(PLAYER_PED)) and 0xEEDC5A63 or 0xEEC7C7C7), (isCarEngineOn(storeCarCharIsInNoSave(PLAYER_PED)) and false or true))
					if project == 0 then
						renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 26.5 - textposother, (getCarDoorLockStatus(storeCarCharIsInNoSave(PLAYER_PED)) == 2 and 0xEEDC5A63 or 0xEEC7C7C7), (getCarDoorLockStatus(storeCarCharIsInNoSave(PLAYER_PED)) == 2 and false or true))
						renderFontDrawText(font, math.floor(speed*3.77)..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, math.floor(speed*3.77)..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 3 - textposmain, 0xEEC7C7C7, true)
					else
						if project == 1 then
							if sampTextdrawIsExists(2264) then
								_, colordoors, _, _ = sampTextdrawGetBoxEnabledColorAndSize(2264)
								renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 26.5 - textposother, (colordoors ~= 671088640 and 0xEEDC5A63 or 0xEEC7C7C7), (colordoors ~= 671088640 and false or true))
							end
							if sampTextdrawIsExists(2265) then
								_, colorsport, _, _ = sampTextdrawGetBoxEnabledColorAndSize(2265)
								renderFontDrawText(font, 'S', ScreenX * (x / ScreenX) + (ScreenX / 5.915), ScreenY * (y / ScreenY) - 26.5 - textposother, (colorsport ~= 671088640 and 0xEEDC5A63 or 0xEEC7C7C7), (colorsport ~= 671088640 and false or true))
							end
							if sampTextdrawIsExists(2256) then
								speed1 = sampTextdrawGetString(2256)
								renderFontDrawText(font, string.match(speed1, "(%d+)")..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, string.match(speed1, "(%d+)")..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 3 - textposmain, 0xEEC7C7C7, true)
							else
								renderFontDrawText(font, math.floor(speed*3.77)..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, math.floor(speed*3.77)..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 3 - textposmain, 0xEEC7C7C7, true)
							end
							if sampTextdrawIsExists(2261) then
								liters = sampTextdrawGetString(2261)
								renderFontDrawText(font, string.match(liters, "(%d+)")..' L', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, string.match(liters, "(%d+)")..' L') * (600 / ScreenX), ScreenY * (y / ScreenY) + 3 - textposmain, 0xEEC7C7C7, true)
							end
						end
					end
					if mimWanted[0] and wantedlevel > 0 then 
						renderFontDrawText(font, getGxtText(getNameOfVehicleModel(getCarModel(storeCarCharIsInNoSave(PLAYER_PED)))), ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) - 43.5 - textposother*2, 0xEEC7C7C7, true)
						renderFontDrawText(font, "¬ розыске! (".. wantedlevel ..")", ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) - 26.5 + textposother, 0xEEC7C7C7, true)
					else 
						renderFontDrawText(font, getGxtText(getNameOfVehicleModel(getCarModel(storeCarCharIsInNoSave(PLAYER_PED)))), ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) - 26.5 - textposother, 0xEEC7C7C7, true)
					end
					renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + 3, (ScreenY * (y / ScreenY)) + 3 - textposmain, 0xEEC7C7C7, true)
					if isCharInModel(PLAYER_PED) ~= 537 or isCharInModel(PLAYER_PED) ~= 538 or isCharInModel(PLAYER_PED) ~= 569 or isCharInModel(PLAYER_PED) ~= 570 or isCharInModel(PLAYER_PED) ~= 590 then
						local carhp = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED))
						renderFontDrawText(font, (carhp/10)..'%', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, (carhp/10)..'%') * (600 / ScreenX), ScreenY * (y / ScreenY) - 26.5 - textposother, 0xEEC7C7C7, true)
					end
				else
					if weapon == 0 then
						renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, money..'$') * (600 / ScreenX) - moneypos, ScreenY * (y / ScreenY) + 3 - textposmain, 0xEEC7C7C7, true)
					else
						renderFontDrawText(font, righttext, ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, righttext) - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 3 - textposmain, 0xEEC7C7C7, true)
						renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + 3, ScreenY * (y / ScreenY) + 3 - textposmain, 0xEEC7C7C7, true)
					end
					if mimWanted[0] and wantedlevel > 0 then
						renderFontDrawText(font, "¬ розыске! (".. wantedlevel ..")", ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) - 26.5 - textposother, 0xEEC7C7C7, true)
					end
				end
			end
		end
	end
end

function cmd_changepos()
	lua_thread.create(function()
		showCursor(true, true)
		while not wasKeyPressed(vkeys.VK_LBUTTON) do wait(0) x,y = getCursorPos() end
		showCursor(false, false)
		settingsIni.main.xcoord = x
		settingsIni.main.ycoord = y
		inicfg.save(mainIni, settings)
	end)
end

function cmd_settings()
	mimShow[0] = not mimShow[0]
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

function isCarLightsOn(car)
	return readMemory(getCarPointer(car) + 0x428, 1) > 62
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

function check_project()
	if sampGetCurrentServerName():lower():match("pears project") or sampGetCurrentServerName():lower():match("Х test project Х") then project = 1
	else project = 0
	end
end

function apply_custom_style()
   local style = mimgui.GetStyle()
   local colors = style.Colors
   local clr = mimgui.Col
   local ImVec4 = mimgui.ImVec4
   style.WindowRounding = 1.5
   style.WindowTitleAlign = mimgui.ImVec2(0.5, 0.5)
   style.FrameRounding = 1.0
   style.ItemSpacing = mimgui.ImVec2(4.0, 4.0)
   style.ScrollbarSize = 13.0
   style.ScrollbarRounding = 0
   style.GrabMinSize = 8.0
   style.GrabRounding = 1.0
   style.WindowBorderSize = 0.0
   style.WindowPadding = mimgui.ImVec2(4.0, 4.0)
   style.FramePadding = mimgui.ImVec2(2.5, 3.5)
   style.ButtonTextAlign = mimgui.ImVec2(0.5, 0.35)
   style.WindowMinSize = mimgui.ImVec2(550, 235)
 
   colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
   colors[clr.TextDisabled]           = ImVec4(0.7, 0.7, 0.7, 1.0)
   colors[clr.WindowBg]               = ImVec4(0.07, 0.07, 0.07, 1.0)
   colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
   colors[clr.Border]                 = ImVec4(mainc.x, mainc.y, mainc.z, 0.4)
   colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
   colors[clr.FrameBg]                = ImVec4(mainc.x, mainc.y, mainc.z, 0.7)
   colors[clr.FrameBgHovered]         = ImVec4(mainc.x, mainc.y, mainc.z, 0.4)
   colors[clr.FrameBgActive]          = ImVec4(mainc.x, mainc.y, mainc.z, 0.9)
   colors[clr.TitleBg]                = ImVec4(mainc.x, mainc.y, mainc.z, 1.0)
   colors[clr.TitleBgActive]          = ImVec4(mainc.x, mainc.y, mainc.z, 1.0)
   colors[clr.TitleBgCollapsed]       = ImVec4(mainc.x, mainc.y, mainc.z, 0.79)
   colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
   colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
   colors[clr.ScrollbarGrab]          = ImVec4(mainc.x, mainc.y, mainc.z, 0.8)
   colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
   colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
   colors[clr.CheckMark]              = ImVec4(mainc.x + 0.13, mainc.y + 0.13, mainc.z + 0.13, 1.00)
   colors[clr.SliderGrab]             = ImVec4(0.28, 0.28, 0.28, 1.00)
   colors[clr.SliderGrabActive]       = ImVec4(0.35, 0.35, 0.35, 1.00)
   colors[clr.Button]                 = ImVec4(mainc.x, mainc.y, mainc.z, 0.8)
   colors[clr.ButtonHovered]          = ImVec4(mainc.x, mainc.y, mainc.z, 0.63)
   colors[clr.ButtonActive]           = ImVec4(mainc.x, mainc.y, mainc.z, 1.0)
   colors[clr.Header]                 = ImVec4(mainc.x, mainc.y, mainc.z, 0.6)
   colors[clr.HeaderHovered]          = ImVec4(mainc.x, mainc.y, mainc.z, 0.43)
   colors[clr.HeaderActive]           = ImVec4(mainc.x, mainc.y, mainc.z, 0.8)
   colors[clr.Separator]              = colors[clr.Border]
   colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
   colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
   colors[clr.ResizeGrip]             = ImVec4(mainc.x, mainc.y, mainc.z, 0.8)
   colors[clr.ResizeGripHovered]      = ImVec4(mainc.x, mainc.y, mainc.z, 0.63)
   colors[clr.ResizeGripActive]       = ImVec4(mainc.x, mainc.y, mainc.z, 1.0)
   colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
   colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
   colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
   colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
   colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
end

-- mimgui.OnInitialize() вызываетс€ всего раз, перед первым показом рендера
mimgui.OnInitialize(function()
	apply_custom_style() -- применим кастомный стиль
end)

mimgui.OnFrame(function () return mimShow[0] end,
function ()
    local w, h = getScreenResolution()
    mimgui.SetNextWindowPos(mimgui.ImVec2(w / 2, h / 2), mimgui.Cond.Always, mimgui.ImVec2(0.5, 0.5))
    mimgui.SetNextWindowSize(mimgui.ImVec2(550, 235), mimgui.Cond.Always)
    mimgui.Begin(u8"Ќастройки HUD'a", mimShow, mimgui.WindowFlags.NoCollapse + mimgui.WindowFlags.NoResize + mimgui.WindowFlags.NoMove + mimgui.WindowFlags.NoBringToFrontOnFocus + mimgui.WindowFlags.AlwaysAutoResize)
	if mimgui.Checkbox(u8"ќтображать HUD (произойдЄт перезагрузка)", mimHud) then 
		showhud = tostring(mimHud[0])
		settingsIni.main.hud = showhud
		inicfg.save(mainIni, settings)
		thisScript():reload()
	end
	mimgui.Checkbox(u8"ќтображать прогресс бары (если настраиваете смещение прогресс баров)", mimChangeProgressBar)
	if mimgui.Checkbox(u8"ќтображать уровень розыска", mimWanted) then
		wanted = tostring(mimWanted[0])
		settingsIni.main.wanted = wanted
		inicfg.save(mainIni, settings)
	end
	mimgui.Separator()
	if mimgui.SliderInt(u8"–азмер текста HUD'a", mimSizeFont, 4, 25) then
		fontsize = tostring(mimSizeFont[0])
		font = nil
		font = renderCreateFont("Bebas Neue Bold", fontsize, 1)
		settingsIni.main.sizefont = fontsize
		inicfg.save(mainIni, settings)
	end
	if mimgui.SliderInt(u8"—мещение по оси Y текста на HUD'e", mimMainTextPos, -8, 8) then
		textposmain = tostring(mimMainTextPos[0])
		settingsIni.main.posmaintext = textposmain
		inicfg.save(mainIni, settings)
	end
	if mimgui.SliderInt(u8"—мещение по оси Y текста выше HUD'a", mimOtherTextPos, -8, 8) then
		textposother = tostring(mimOtherTextPos[0])
		settingsIni.main.posothertext = textposother
		inicfg.save(mainIni, settings)
	end
	if mimgui.SliderInt(u8"—мещение по оси Y прогресс баров", mimProgressPos, -8, 8) then
		progressbarpos = tostring(mimProgressPos[0])
		settingsIni.main.posprogressbar = progressbarpos
		inicfg.save(mainIni, settings)
	end
	if mimgui.SliderInt(u8"—мещение по оси X денег", mimMoneyPos, -12, 12) then
		moneypos = tostring(mimMoneyPos[0])
		settingsIni.main.posmoney = moneypos
		inicfg.save(mainIni, settings)
	end
	mimgui.Separator()
	if mimgui.Button(u8"»зменить позицию HUD'a") then
		cmd_changepos()
		ffi.C.SetCursorPos(x, y)
	end
    mimgui.End()
end)

function sampev.onShowTextDraw(id, data)
    if project == 1 then
		for i = 2255, 2269 do
			if i == id then
				data.position.x = 5000
				data.position.y = 5000
			end
		end
	end
    return {id, data}
end