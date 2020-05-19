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

--[[veh_id_400--]]setGxtEntry("LANDSTK","LANDSTALKER")
--[[veh_id_403--]]setGxtEntry("LINERUN","LINERUNNER")
--[[veh_id_404--]]setGxtEntry("PEREN","PERENIAL")
--[[veh_id_405--]]setGxtEntry("SENTINL","SENTINEL")
--[[veh_id_407--]]setGxtEntry("FIRETRK","FIRE TRUCK")
--[[veh_id_408--]]setGxtEntry("TRASHM","TRASHMASTER")
--[[veh_id_411--]]setGxtEntry("INFERNU","INFERNUS")
--[[veh_id_416--]]setGxtEntry("AMBULAN","AMBULANCE")
--[[veh_id_417--]]setGxtEntry("LEVIATH","LEVIATHAN")
--[[veh_id_418--]]setGxtEntry("MOONBM","MOONBEAM")
--[[veh_id_419--]]setGxtEntry("ESPERAN","ESPERANTO")
--[[veh_id_421--]]setGxtEntry("WASHING","WASHINGTON")
--[[veh_id_424--]]setGxtEntry("BFINJC","BF INJECTION")
--[[veh_id_427--]]setGxtEntry("ENFORCR","ENFORCER")
--[[veh_id_428--]]setGxtEntry("SECURI","SECURICAR")
--[[veh_id_430--]]setGxtEntry("PREDATR","PREDATOR")
--[[veh_id_433--]]setGxtEntry("BARRCKS","BARRACKS")
--[[veh_id_434--]]setGxtEntry("HOTKNIF","HOTKNIFE")
--[[veh_id_435--]]setGxtEntry("ARTICT1","ARTICT 1")
--[[veh_id_439--]]setGxtEntry("STALION","STALLION")
--[[veh_id_441--]]setGxtEntry("RCBANDT","RC BANDIT")
--[[veh_id_447--]]setGxtEntry("SEASPAR","SEASPARROW")
--[[veh_id_448--]]setGxtEntry("PIZZABO","PIZZABOY")
--[[veh_id_450--]]setGxtEntry("ARTICT2","ARTICT 2")
--[[veh_id_455--]]setGxtEntry("FLATBED","FLATBED")
--[[veh_id_461--]]setGxtEntry("PCJ600","PCJ-600")
--[[veh_id_464--]]setGxtEntry("RCBARON","RC BARON")
--[[veh_id_465--]]setGxtEntry("RCRAIDE","RC RAIDER")
--[[veh_id_466--]]setGxtEntry("GLENDAL","GLENDALE")
--[[veh_id_471--]]setGxtEntry("QUAD","QUADBIKE")
--[[veh_id_472--]]setGxtEntry("COASTG","COASTGUARD")
--[[veh_id_477--]]setGxtEntry("ZR350","ZR-350")
--[[veh_id_487--]]setGxtEntry("MAVERIC","MAVERICK")
--[[veh_id_488--]]setGxtEntry("SANMAV","NEWS CHOPPER")
--[[veh_id_489--]]setGxtEntry("RANCHER","RANCHER")
--[[veh_id_490--]]setGxtEntry("FBIRANC","FBI RANCHER")
--[[veh_id_492--]]setGxtEntry("GREENWO","GREENWOOD")
--[[veh_id_494--]]setGxtEntry("HOTRING","HOTRING RACER")
--[[veh_id_495--]]setGxtEntry("SANDKIN","SANDKING")
--[[veh_id_496--]]setGxtEntry("BLISTAC","BLISTA COMPACT")
--[[veh_id_497--]]setGxtEntry("POLMAV","POLICE MAVERICK")
--[[veh_id_498--]]setGxtEntry("BOXVILL","BOXVILLE")
--[[veh_id_501--]]setGxtEntry("RCGOBLI","RC GOBLIN")
--[[veh_id_502--]]setGxtEntry("HOTRINA","HOTRING RACER A")
--[[veh_id_503--]]setGxtEntry("HOTRINB","HOTRING RACER B")
--[[veh_id_504--]]setGxtEntry("BLOODRA","BLOODRING BANGER")
--[[veh_id_506--]]setGxtEntry("SUPERGT","SUPER GT")
--[[veh_id_510--]]setGxtEntry("MTBIKE","MOUNTAIN BIKE")
--[[veh_id_512--]]setGxtEntry("CROPDST","CROPDUSTER")
--[[veh_id_513--]]setGxtEntry("STUNT","STUNTPLANE")
--[[veh_id_514--]]setGxtEntry("PETROL","TANKER")
--[[veh_id_515--]]setGxtEntry("RDTRAIN","ROADTRAIN")
--[[veh_id_517--]]setGxtEntry("MAJESTC","MAJESTIC")
--[[veh_id_518--]]setGxtEntry("BUCCANE","BUCCANEER")
--[[veh_id_521--]]setGxtEntry("FCR900","FCR-900")
--[[veh_id_522--]]setGxtEntry("NRG500","NRG-500")
--[[veh_id_523--]]setGxtEntry("HPV1000","HPV-1000")
--[[veh_id_524--]]setGxtEntry("CEMENT","CEMENT TRUCK")
--[[veh_id_525--]]setGxtEntry("TOWTRUK","TOWTRUCK")
--[[veh_id_528--]]setGxtEntry("FBITRUK","FBI TRUCK")
--[[veh_id_530--]]setGxtEntry("FORKLFT","FORKLIFT")
--[[veh_id_532--]]setGxtEntry("COMBINE","COMBINE HARVESTER")
--[[veh_id_534--]]setGxtEntry("REMING","REMINGTON")
--[[veh_id_538--]]setGxtEntry("STREAK","BROWN STREAK")
--[[veh_id_544--]]setGxtEntry("FIRELA","FIRE TRUCK")
--[[veh_id_545--]]setGxtEntry("HUSTLER","HUSTLER")
--[[veh_id_546--]]setGxtEntry("INTRUDR","INTRUDER")
--[[veh_id_548--]]setGxtEntry("CARGOBB","CARGOBOB")
--[[veh_id_552--]]setGxtEntry("UTILITY","UTILLITY VAN")
--[[veh_id_554--]]setGxtEntry("YOSEMIT","YOSEMITE")
--[[veh_id_556--]]setGxtEntry("MONSTA","MONSTER A")
--[[veh_id_557--]]setGxtEntry("MONSTB","MONSTER B")
--[[veh_id_563--]]setGxtEntry("RAINDNC","RAINDANCE")
--[[veh_id_564--]]setGxtEntry("RCTIGER","RC TIGER")
--[[veh_id_569--]]setGxtEntry("FRFLAT","FRIGHTFLAT")
--[[veh_id_570--]]setGxtEntry("STREAKC","STREAK")
--[[veh_id_575--]]setGxtEntry("BROADWY","BROADWAY")
--[[veh_id_577--]]setGxtEntry("AT400","AT-400")
--[[veh_id_578--]]setGxtEntry("DFT30","DFT-30")
--[[veh_id_580--]]setGxtEntry("STAFFRD","STAFFORD")
--[[veh_id_581--]]setGxtEntry("BF400","BF-400")
--[[veh_id_584--]]setGxtEntry("PETROTR","PETROL TRAILER")
--[[veh_id_586--]]setGxtEntry("WAYFARE","WAYFARER")
--[[veh_id_590--]]setGxtEntry("FRBOX","FRIGHTBOX")
--[[veh_id_591--]]setGxtEntry("ARTICT3","ARTICT 3")
--[[veh_id_592--]]setGxtEntry("ANDROM","ANDROMADA")
--[[veh_id_594--]]setGxtEntry("RCCAM","RC CAM")
--[[veh_id_596--]]setGxtEntry("POLICAR","POLICE CAR")
--[[veh_id_601--]]setGxtEntry("SWATVAN","S.W.A.T.")
--[[veh_id_604--]]setGxtEntry("GLENSHI","GLENSHIT")
--[[veh_id_605--]]setGxtEntry("SADLSHI","SADLSHIT")
--[[veh_id_606--]]setGxtEntry("BAGBOXA","BAGBOX A")
--[[veh_id_607--]]setGxtEntry("BAGBOXB","BAGBOX B")
--[[veh_id_608--]]setGxtEntry("TUGSTAI","TUGSTAIR")
--[[veh_id_610--]]setGxtEntry("FARMTR1","FARMTRAILER")
--[[veh_id_611--]]setGxtEntry("UTILTR1","UTILLTYTRAILER")

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
		renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 30, (ScreenX / 450) * HP, ScreenY / 230, 0xEEDC5A63) --(265/100) * HP, 4, 0xEEDC5A63)
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