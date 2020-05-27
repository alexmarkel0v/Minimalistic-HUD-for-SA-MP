script_name('Minimalistic HUD')
script_version("1.3.4.1")
script_author("alexmarkel0v")

local memorycheck, memory = pcall(require, "memory")
local sampevcheck, sampev = pcall(require, "lib.samp.events")
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

local project

local font = renderCreateFont("Bebas Neue Bold", 14, 1)

weapons_list[1] = '������'
weapons_list[2] = '������ ��� ������'
weapons_list[3] = '�������'
weapons_list[4] = '���'
weapons_list[5] = '����'
weapons_list[6] = '������'
weapons_list[7] = '���'
weapons_list[8] = '������'
weapons_list[9] = '���������'
weapons_list[15] = '������'
weapons_list[16] = '�������'
weapons_list[17] = '������� �������'
weapons_list[18] = '�������'
weapons_list[23] = '������������'
weapons_list[31] = 'M4A1'
weapons_list[41] = '�������� ������'
weapons_list[42] = '������������'
weapons_list[43] = '�����������'
weapons_list[46] = '�������'

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
	if memorycheck == false or sampevcheck == false then
		print("���� �� ������ ��������� (memory, SAMP.Lua) �����������.")
		print("��������� �� ������� � ���� � ����� � ����� � �����������.")
		thisScript():unload()
	end

	print("Authors: "..unpack(thisScript().authors))
	
	while not isSampAvailable() do wait(50) end
	while not sampIsLocalPlayerSpawned() do wait(50) end
	
	displayHud(false)	
	
	sampRegisterChatCommand('chpos', cmd_changepos)
	
	while true do wait(0)
		check_project()
		local HP = getCharHealth(PLAYER_PED) < 100 and getCharHealth(PLAYER_PED) > -1 and getCharHealth(PLAYER_PED) or 100
		local ARMOR = getCharArmour(PLAYER_PED) < 100 and getCharArmour(PLAYER_PED) or 100
		local OXYGEN = getWaterLocalPlayer() < 100 and getWaterLocalPlayer() or 100
		local SPRINT = getSprintLocalPlayer() < 100 and getSprintLocalPlayer() or 100
		local weapon = getCurrentCharWeapon(PLAYER_PED)
		local money = getPlayerMoney(PLAYER_HANDLE)
		local ScreenX, ScreenY = getScreenResolution()
		local righttext = string.upper(game_weapons.get_name(weapon))..(weapon > 15 and weapon ~= 46 and ' ('..getAmmoInClip() ..'/'.. getAmmoInCharWeapon(PLAYER_PED, weapon) - getAmmoInClip()..')' or '')
		renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) - 2, ScreenX / 4.5, ScreenY / 250, 0xFF818381)
		if HP > 0 then
			renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 30, (ScreenX / 450) * 100, ScreenY / 230, 0x557D7F7D)
		end
		renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 30, (ScreenX / 450) * HP, ScreenY / 230, 0xEEDC5A63)
		if ARMOR > 0 then
			renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 37, (ScreenX / 450) * 100, ScreenY / 230, 0x557D7F7D)
		end
		renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 37, (ScreenX / 450) * ARMOR, ScreenY / 230, 0xEE818381)
		if isCharInWater(PLAYER_PED) then 
			renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 44, (ScreenX / 450) * 100, ScreenY / 230, 0x557D7F7D)
			renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) + 44, (ScreenX / 450) * OXYGEN , ScreenY / 230, 0xEE4682B4)
		end
		if ScreenX < 1920 then
			renderDrawBox(ScreenX * (x / ScreenX), ScreenY * (y / ScreenY), ScreenX / 4.5, ScreenY / 26.1, 0xEE111111)
			if isCharInAnyCar(PLAYER_PED) then
				local speed = getCarSpeed(storeCarCharIsInNoSave(PLAYER_PED))
				if isCarLightsOn(storeCarCharIsInNoSave(PLAYER_PED)) then
					renderFontDrawText(font, 'L', ScreenX * (x / ScreenX) + (ScreenX / 4.6), ScreenY * (y / ScreenY) - 23.5, 0xEEDC5A63)
				else
					renderFontDrawText(font, 'L', ScreenX * (x / ScreenX) + (ScreenX / 4.6), ScreenY * (y / ScreenY) - 23.5, 0xEEC7C7C7, true)
				end
				if isCarEngineOn(storeCarCharIsInNoSave(PLAYER_PED)) then
					renderFontDrawText(font, 'E', ScreenX * (x / ScreenX) + (ScreenX / 4.95), ScreenY * (y / ScreenY) - 23.5, 0xEEDC5A63)
				else
					renderFontDrawText(font, 'E', ScreenX * (x / ScreenX) + (ScreenX / 4.95), ScreenY * (y / ScreenY) - 23.5, 0xEEC7C7C7, true)
				end
				if project == 0 then
					if getCarDoorLockStatus(storeCarCharIsInNoSave(PLAYER_PED)) then
						renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 23.5, 0xEEC7C7C7)
					else
						renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 23.5, 0xEEDC5A63, true)
					end
					renderFontDrawText(font, math.ceil(speed*3.77)..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, math.ceil(speed*3.77)..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 6, 0xEEC7C7C7, true)
				else
					if project == 1 then
						if sampTextdrawIsExists(2264) then
							_, colordoors, _, _ = sampTextdrawGetBoxEnabledColorAndSize(2264)
							if colordoors ~= 671088640 then
								renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 23.5, 0xEEDC5A63, true)
							else
								renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 23.5, 0xEEC7C7C7)
							end
						end
						if sampTextdrawIsExists(2265) then
							_, colorsport, _, _ = sampTextdrawGetBoxEnabledColorAndSize(2265)
							if colorsport ~= 671088640 then
								renderFontDrawText(font, 'S', ScreenX * (x / ScreenX) + (ScreenX / 5.915), ScreenY * (y / ScreenY) - 23.5, 0xEEDC5A63, true)
							else
								renderFontDrawText(font, 'S', ScreenX * (x / ScreenX) + (ScreenX / 5.915), ScreenY * (y / ScreenY) - 23.5, 0xEEC7C7C7)
							end
						end
						if sampTextdrawIsExists(2256) then
							speed1 = sampTextdrawGetString(2256)
							renderFontDrawText(font, string.match(speed1, "(%d+)")..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, string.match(speed1, "(%d+)")..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 6, 0xEEC7C7C7, true)
						else
							renderFontDrawText(font, math.ceil(speed*3.77)..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, math.ceil(speed*3.77)..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 6, 0xEEC7C7C7, true)
						end
						if sampTextdrawIsExists(2261) then
							liters = sampTextdrawGetString(2261)
							renderFontDrawText(font, string.match(liters, "(%d+)")..' L', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, string.match(liters, "(%d+)")..' L') * (600 / ScreenX), ScreenY * (y / ScreenY) + 6, 0xEEC7C7C7, true)
						end
					end
				end
				renderFontDrawText(font, getGxtText(getNameOfVehicleModel(getCarModel(storeCarCharIsInNoSave(PLAYER_PED)))), ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) - 23.5, 0xEEC7C7C7, true)
				renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + 3, (ScreenY * (y / ScreenY)) + 6, 0xEEC7C7C7, true)
				if isCharInModel(PLAYER_PED) ~= 537 or isCharInModel(PLAYER_PED) ~= 538 or isCharInModel(PLAYER_PED) ~= 569 or isCharInModel(PLAYER_PED) ~= 570 or isCharInModel(PLAYER_PED) ~= 590 then
					local carhp = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED))
					renderFontDrawText(font, (carhp/10)..'%', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, (carhp/10)..'%') * (600 / ScreenX), ScreenY * (y / ScreenY) - 23.5, 0xEEC7C7C7, true)
				end
			else
				if weapon == 0 then
					renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, money..'$') * (600 / ScreenX), ScreenY * (y / ScreenY) + 6, 0xEEC7C7C7, true)
				else
					renderFontDrawText(font, righttext, ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, righttext) - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 6, 0xEEC7C7C7, true)
					renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + 3, ScreenY * (y / ScreenY) + 6, 0xEEC7C7C7, true)
				end
			end
		end
		if ScreenX == 1920 then
			renderDrawBox(ScreenX * (x / ScreenX), ScreenY * (y / ScreenY), ScreenX / 4.5, ScreenY / 35, 0xEE111111)
			if isCharInAnyCar(PLAYER_PED) then
				local speed = getCarSpeed(storeCarCharIsInNoSave(PLAYER_PED))
				if isCarLightsOn(storeCarCharIsInNoSave(PLAYER_PED)) then
					renderFontDrawText(font, 'L', ScreenX * (x / ScreenX) + (ScreenX / 4.6), ScreenY * (y / ScreenY) - 26.5, 0xEEDC5A63)
				else
					renderFontDrawText(font, 'L', ScreenX * (x / ScreenX) + (ScreenX / 4.6), ScreenY * (y / ScreenY) - 26.5, 0xEEC7C7C7, true)
				end
				if isCarEngineOn(storeCarCharIsInNoSave(PLAYER_PED)) then
					renderFontDrawText(font, 'E', ScreenX * (x / ScreenX) + (ScreenX / 4.95), ScreenY * (y / ScreenY) - 26.5, 0xEEDC5A63)
				else
					renderFontDrawText(font, 'E', ScreenX * (x / ScreenX) + (ScreenX / 4.95), ScreenY * (y / ScreenY) - 26.5, 0xEEC7C7C7, true)
				end
				if project == 0 then
					if getCarDoorLockStatus(storeCarCharIsInNoSave(PLAYER_PED)) then
						renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 26.5, 0xEEC7C7C7)
					else
						renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 26.5, 0xEEDC5A63, true)
					end
					renderFontDrawText(font, math.ceil(speed*3.77)..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, math.ceil(speed*3.77)..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 3, 0xEEC7C7C7, true)
				else
					if project == 1 then
						if sampTextdrawIsExists(2264) then
							_, colordoors, _, _ = sampTextdrawGetBoxEnabledColorAndSize(2264)
							if colordoors ~= 671088640 then
								renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 26.5, 0xEEDC5A63, true)
							else
								renderFontDrawText(font, 'D', ScreenX * (x / ScreenX) + (ScreenX / 5.4), ScreenY * (y / ScreenY) - 26.5, 0xEEC7C7C7)
							end
						end
						if sampTextdrawIsExists(2265) then
							_, colorsport, _, _ = sampTextdrawGetBoxEnabledColorAndSize(2265)
							if colorsport ~= 671088640 then
								renderFontDrawText(font, 'S', ScreenX * (x / ScreenX) + (ScreenX / 5.915), ScreenY * (y / ScreenY) - 26.5, 0xEEDC5A63, true)
							else
								renderFontDrawText(font, 'S', ScreenX * (x / ScreenX) + (ScreenX / 5.915), ScreenY * (y / ScreenY) - 26.5, 0xEEC7C7C7)
							end
						end
						if sampTextdrawIsExists(2256) then
							speed1 = sampTextdrawGetString(2256)
							renderFontDrawText(font, string.match(speed1, "(%d+)")..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, string.match(speed1, "(%d+)")..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 3, 0xEEC7C7C7, true)
						else
							renderFontDrawText(font, math.ceil(speed*3.77)..' KM/H', ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, math.ceil(speed*3.77)..' KM/H') - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 3, 0xEEC7C7C7, true)
						end
						if sampTextdrawIsExists(2261) then
							liters = sampTextdrawGetString(2261)
							renderFontDrawText(font, string.match(liters, "(%d+)")..' L', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, string.match(liters, "(%d+)")..' L') * (600 / ScreenX), ScreenY * (y / ScreenY) + 3, 0xEEC7C7C7, true)
						end
					end
				end
				renderFontDrawText(font, getGxtText(getNameOfVehicleModel(getCarModel(storeCarCharIsInNoSave(PLAYER_PED)))), ScreenX * (x / ScreenX), ScreenY * (y / ScreenY) - 26.5, 0xEEC7C7C7, true)
				renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + 3, (ScreenY * (y / ScreenY)) + 3, 0xEEC7C7C7, true)
				if isCharInModel(PLAYER_PED) ~= 537 or isCharInModel(PLAYER_PED) ~= 538 or isCharInModel(PLAYER_PED) ~= 569 or isCharInModel(PLAYER_PED) ~= 570 or isCharInModel(PLAYER_PED) ~= 590 then
					local carhp = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED))
					renderFontDrawText(font, (carhp/10)..'%', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, (carhp/10)..'%') * (600 / ScreenX), ScreenY * (y / ScreenY) - 26.5, 0xEEC7C7C7, true)
				end
			else
				if weapon == 0 then
					renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, money..'$') * (600 / ScreenX), ScreenY * (y / ScreenY) + 3, 0xEEC7C7C7, true)
				else
					renderFontDrawText(font, righttext, ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, righttext) - 3 + (ScreenX / 4.5), ScreenY * (y / ScreenY) + 3, 0xEEC7C7C7, true)
					renderFontDrawText(font, separator(money)..'$', ScreenX * (x / ScreenX) + 3, ScreenY * (y / ScreenY) + 3, 0xEEC7C7C7, true)
				end
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
	if sampGetCurrentServerName():lower():match("pears project") or sampGetCurrentServerName():lower():match("� test project �") then project = 1
	else project = 0
	end
end

function sampev.onShowTextDraw(id, data)
    if project == 1 then
		for i = 2255, 2269 do
			if i == id then
				data.position.x = 2000
				data.position.y = 2000
			end
		end
	end
    return {id, data}
end