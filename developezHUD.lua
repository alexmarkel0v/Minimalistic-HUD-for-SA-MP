script_name('developezHUD')
script_version("1.0")
script_author("#Northn | Katsuro | developez")

local x = 500
local y = 400

local memory = require 'memory'
local game_weapons = require 'game.weapons'
local weapons_list = game_weapons.names
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

local font = renderCreateFont("Bebas Neue Bold", 14, 1)

function main()
	while not isSampAvailable() do wait(50) end
	while not sampIsLocalPlayerSpawned() do wait(50) end
	displayHud(false)
	
	sampRegisterChatCommand('devhud', changepos)
	
	while true do wait(0)
		local HP = getCharHealth(PLAYER_PED) < 100 and getCharHealth(PLAYER_PED) > -1 and getCharHealth(PLAYER_PED) or 100
		local ARMOR = getCharArmour(PLAYER_PED)
		local weapon = getCurrentCharWeapon(PLAYER_PED)
		local money = getPlayerMoney(PLAYER_HANDLE)
		local righttext = string.upper(game_weapons.get_name(weapon))..(weapon > 15 and weapon ~= 46 and ' ('..getAmmoInClip() ..'/'.. getAmmoInCharWeapon(PLAYER_PED, weapon) - getAmmoInClip()..')' or '')
		renderDrawBox(x,  y - 1, 250, 2, 0xff818381)
		renderDrawBox(x,  y, 250, 30, 0xff111111)
		renderDrawBox(x,  y + 31, (250/100) * HP, 4, 0xffDC5A63)
		renderDrawBox(x,  y + 36, (250/100) * ARMOR, 4, 0xff818381)
		if weapon == 0 then
			renderFontDrawText(font, money..'$', x + 250 / 2 - renderGetFontDrawTextLength(font, money..'$') / 2, y + 5.5, 0xffC7C7C7, true)
		else
			renderFontDrawText(font, righttext, x + 247 - renderGetFontDrawTextLength(font, righttext), y + 5.5, 0xffC7C7C7, true)
			renderFontDrawText(font, money..'$', x + 3, y + 5.5, 0xffC7C7C7, true)
		end
	end
end

function changepos()
	lua_thread.create(function()
		showCursor(true, true)
		while not isKeyDown(0x01) do wait(0) x, y = getCursorPos() end
		showCursor(false, false)
		local text = ''
		for line in io.lines(thisScript().path) do
			text = text..'\n'..line
		end
		local text = text:gsub('local x = %d+', 'local x = '.. x)
		local text = text:gsub('local y = %d+', 'local y = '.. y)
		local script = io.open(thisScript().path, 'w+')
		for w in text:gmatch('[^\r\n]+') do
			script:write(w..'\n')
		end
		script:close()
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