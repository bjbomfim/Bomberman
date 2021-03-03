parede_fixa = {}
local fotoparede

local function geraParedeFixa()
	for y = 64, (64*7), (64*2) do
		for x = 64 , (64*11), (64*2) do
			local color = {165/255, 42/255, 42/255}
			table.insert(parede_fixa, { x = x, y = y, altu = 64, larg = 64, foto = fotoparede})
		end
	end
end

local function printParedeFixa()
	for i = 1, #parede_fixa do
		love.graphics.draw(parede_fixa[i].foto, parede_fixa[i].x, parede_fixa[i].y)
	end
end

function parede_fixa:load()
	fotoparede = love.graphics.newImage("imagens/objects_house_0053_Layer-54.png")
	geraParedeFixa()
end

function parede_fixa:draw()
	printParedeFixa()
end