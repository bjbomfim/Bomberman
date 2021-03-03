bomba = {}
local xb = 0
local yb = 0
local fotoplayer3
--Perimitir a criação da bomba
local flag = false
local temp = 5

function bomba:load()
	fotoplayer3 = love.graphics.newImage("imagens/bomba.jfif")	
end

local function localbomba()
	for  i = 0, 9 do
		for j = 0, 13 do
			if (jogador[1].x + 32 >= grid[i][j].x and jogador[1].x + 32 <= grid[i][j].x+64) and (jogador[1].y+32 >= grid[i][j].y and jogador[1].y+32 <= grid[i][j].y+64) then
				xb = grid[i][j].x
				yb = grid[i][j].y
			end
		end
	end
end

local function bombaexplode()
	for i = #parede_movel, 1, -1 do
		if (bomba[1].x == parede_movel[i].x + parede_movel[i].larg and bomba[1].y == parede_movel[i].y) or (bomba[1].y == parede_movel[i].y + parede_movel[i].altu and bomba[1].x == parede_movel[i].x) or (bomba[1].x == parede_movel[i].x - parede_movel[i].larg and bomba[1].y == parede_movel[i].y) or (bomba[1].y == parede_movel[i].y - parede_movel[i].altu and bomba[1].x == parede_movel[i].x) then
			table.remove(parede_movel, i)
		end
	end
end

local function geraBomba()
	localbomba()
	table.insert(bomba, {x = xb, y = yb, foto = fotoplayer3})
end

function bomba:update(dt)
	if love.keyboard.isDown("a") then
		if #bomba == 0 then
			flag = true
			geraBomba()
		end
	end
	if flag == true then
		temp = temp - dt
	end
	if temp <= 0 then
		flag = false
		temp = 5
		bombaexplode()
		table.remove(bomba, 1)
	end
end

local function printbomba()
	if flag == true then
		for  i = 1, #bomba do
			love.graphics.draw(bomba[i].foto, bomba[i].x+16, bomba[i].y+16)
		end
	end
end

function bomba:draw()
	printbomba()
end