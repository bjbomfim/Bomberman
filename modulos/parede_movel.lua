parede_movel = {}
local fotoparede

local function verifica(num_y, num_x)
	for j=1, #parede_fixa do
		if ((grid[num_y][num_x].x ~= parede_fixa[j].x) and (grid[num_y][num_x].y ~= parede_fixa[j].y)) and ((grid[num_y][num_x].x ~= jogador[1].x) or (grid[num_y][num_x].y ~= jogador[1].y)) and ((grid[num_y][num_x].x ~= jogador[1].x) or (grid[num_y][num_x].y ~= jogador[1].y-64)) and ((grid[num_y][num_x].x ~= jogador[1].x-64) or (grid[num_y][num_x].y ~= jogador[1].y)) then
			return true
		else
			return false
		end
	end
end

local function geraParedemovel()
	local num_paredes = math.random(60, 90)
	for  i = 1, num_paredes do
		local num_y = math.random(0, 9)
		local num_x = math.random(0, 13)
		if verifica(num_y, num_x) == true then
			table.insert(parede_movel, {x = grid[num_y][num_x].x, y = grid[num_y][num_x].y, foto = fotoparede, altu = 64, larg = 64})
		end
	end
end

function parede_movel:load()
	fotoparede = love.graphics.newImage("imagens/objects_house_0053_Layer-54.png")
	geraParedemovel()
end

function parede_movel:draw()
	if #parede_movel ~= 0 then
		for i = 1, #parede_movel do
			love.graphics.draw(parede_movel[i].foto, parede_movel[i].x, parede_movel[i].y)
		end
	end
end

math.randomseed(os.time())