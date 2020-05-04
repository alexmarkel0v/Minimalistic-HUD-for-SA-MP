script_name('Minimalistic HUD')
script_version("1.1")
script_author("#Northn | developez | crybaby | alexmarkel0v")

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

function main()
	while not isSampAvailable() do wait(50) end
	while not sampIsLocalPlayerSpawned() do wait(50) end
	displayHud(false)	
	
	sampRegisterChatCommand('chpos', cmd_changepos)
	
	while true do wait(0)
		--sx,sy = getCursorPos()
        --gx,gy = convertWindowScreenCoordsToGameScreenCoords(sx,sy)
        --renderFontDrawText(font, gx..':'..gy, sx,sy,0xFFFFAE86)
		local HP = getCharHealth(PLAYER_PED) < 100 and getCharHealth(PLAYER_PED) > -1 and getCharHealth(PLAYER_PED) or 100
		local ARMOR = getCharArmour(PLAYER_PED) < 100 and getCharArmour(PLAYER_PED) or 100
		local OXYGEN = getWaterLocalPlayer() < 100 and getWaterLocalPlayer() or 100
		local SPRINT = getSprintLocalPlayer() < 100 and getSprintLocalPlayer() or 100
		local weapon = getCurrentCharWeapon(PLAYER_PED)
		local money = getPlayerMoney(PLAYER_HANDLE)
		ScreenX, ScreenY = getScreenResolution()
		local righttext = string.upper(game_weapons.get_name(weapon))..(weapon > 15 and weapon ~= 46 and ' ('..getAmmoInClip() ..'/'.. getAmmoInCharWeapon(PLAYER_PED, weapon) - getAmmoInClip()..')' or '')
		renderDrawBox(ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) - 1, ScreenX / 4.5, ScreenY / 250, 0xff818381)
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
			renderFontDrawText(font, 'Вне т/с', ScreenX * (x / ScreenX),  (ScreenY * (y / ScreenY)) - 22.5, 0xEEC7C7C7, true)
		end
		if isCharInAnyCar(PLAYER_PED) then
			renderFontDrawText(font, getNameOfVehicleModel(getCarModel(storeCarCharIsInNoSave(PLAYER_PED))), ScreenX * (x / ScreenX), (ScreenY * (y / ScreenY)) - 22.5, 0xEEC7C7C7, true)
			if isCharInModel(PLAYER_PED) ~= 537 or isCharInModel(PLAYER_PED) ~= 538 or isCharInModel(PLAYER_PED) ~= 569 or isCharInModel(PLAYER_PED) ~= 570 or isCharInModel(PLAYER_PED) ~= 590 then
				local carhp = getCarHealth(storeCarCharIsInNoSave(PLAYER_PED))
				renderDrawBox(ScreenX * (x / ScreenX),  ScreenY * (y / ScreenY) + 44, (ScreenX / 450) * carhp/10, ScreenY / 230, 0xEED2B48C)
			end
		end
		if weapon == 0 then
			renderFontDrawText(font, money..'$', ScreenX * (x / ScreenX) + (ScreenX / 4.5) / 2 - renderGetFontDrawTextLength(font, money..'$') * (600 / ScreenX), ScreenY * (y / ScreenY) + 5.5, 0xEEC7C7C7, true)
		else
			renderFontDrawText(font, righttext, ScreenX * (x / ScreenX) - renderGetFontDrawTextLength(font, righttext)-3 + (ScreenX / 4.5), (ScreenY * (y / ScreenY)) + 5.5, 0xEEC7C7C7, true)
			renderFontDrawText(font, money..'$', ScreenX * (x / ScreenX) + 3, (ScreenY * (y / ScreenY)) + 5.5, 0xEEC7C7C7, true)
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