jogador = {}
local fotoplayer
local fotoplayer2
local fotoplayer3
local fotoplayer_inver
local fotoplayer2_inver
local fotoplayer3_inver
local flag = false
local temp = 0
local flag2 = true
local flag3 = true
local velocidade_pernas = 1/14

local function geraJogador()
	local x = 64*12
	local y = 64*8
	local velo = 75
	table.insert(jogador, {x = x, y = y, velo = velo, altu = 55, larg = 55, foto = fotoplayer, foto2 = fotoplayer2, foto3 = fotoplayer3, foto_inver = fotoplayer_inver, foto2_inver = fotoplayer2_inver, foto3_inver = fotoplayer3_inver})
end

function calculaColisaoCima(dt, parede_total)
	for i = 1, #parede_total do
		if ((jogador[1].x > parede_total[i].x and jogador[1].x < parede_total[i].x + parede_total[i].larg) or (jogador[1].x + jogador[1].larg > parede_total[i].x and jogador[1].x + jogador[1].larg < parede_total[i].x + parede_total[i].larg)) and ((jogador[1].y > parede_total[i].y and jogador[1].y < parede_total[i].y + parede_total[i].altu)) then
			jogador[1].y = (jogador[1].y + (jogador[1].velo) * dt)
		end
	end
end

function calculaColisaoBaixo(dt, parede_total)
	for i = 1, #parede_total do
		if ((jogador[1].x + jogador[1].larg > parede_total[i].x and jogador[1].x + jogador[1].larg < parede_total[i].x + parede_total[i].larg) or (jogador[1].x > parede_total[i].x and jogador[1].x < parede_total[i].x + parede_total[i].larg)) and (jogador[1].y + jogador[1].altu > parede_total[i].y and jogador[1].y + jogador[1].altu < parede_total[i].y + parede_total[i].altu) then
			jogador[1].y = (jogador[1].y - (jogador[1].velo) * dt)
		end
	end
end

function calculaColisaoDi(dt, parede_total)
	for i = 1, #parede_total do
		if (jogador[1].x + jogador[1].larg > parede_total[i].x and jogador[1].x + jogador[1].larg < parede_total[i].x + parede_total[i].larg) and ((jogador[1].y > parede_total[i].y and jogador[1].y < parede_total[i].y + parede_total[i].altu) or (jogador[1].y + jogador[1].altu > parede_total[i].y and jogador[1].y + jogador[1].altu < parede_total[i].y + parede_total[i].altu)) then
			jogador[1].x = (jogador[1].x - (jogador[1].velo) * dt)
		end	
	end
end

function calculaColisaoEs(dt, parede_total)
	for i = 1, #parede_total do
		if (jogador[1].x > parede_total[i].x and jogador[1].x < parede_total[i].x + parede_total[i].larg) and ((jogador[1].y > parede_total[i].y and jogador[1].y < parede_total[i].y + parede_total[i].altu) or (jogador[1].y + jogador[1].altu > parede_total[i].y and jogador[1].y + jogador[1].altu < parede_total[i].y + parede_total[i].altu)) then
			jogador[1].x = (jogador[1].x + (jogador[1].velo) * dt)
		end
	end
end

local function movimento(dt)
	if love.keyboard.isDown ("up") then
		calculaColisaoCima(dt, parede_fixa)
		if jogador[1].y >= 0 then
			jogador[1].y = (jogador[1].y - jogador[1].velo * dt)
			flag = true
		end
	elseif love.keyboard.isDown ("down") then
		calculaColisaoBaixo(dt, parede_fixa)
		if jogador[1].y + jogador[1].altu <= alt then
			jogador[1].y = (jogador[1].y + jogador[1].velo * dt)
			flag = true
		end
	elseif love.keyboard.isDown ("right") then
		calculaColisaoDi(dt, parede_fixa)
		if jogador[1].x + jogador[1].larg < lar then
			jogador[1].x = (jogador[1].x + jogador[1].velo * dt)
			flag = true
			flag3 = true
		end
	elseif love.keyboard.isDown ("left") then
		calculaColisaoEs(dt, parede_fixa)
		if jogador[1].x > 0 then
			jogador[1].x = (jogador[1].x - jogador[1].velo * dt)
			flag = true
			flag3 = false
		end
	else
		flag = false
	end
end

local function printJogador()
	if flag == false then
		if flag3 == true then
			love.graphics.draw(jogador[1].foto, jogador[1].x, jogador[1].y)
		else
			love.graphics.draw(jogador[1].foto_inver, jogador[1].x, jogador[1].y)
		end
	else
		if flag3 == true then
			if flag2 == true then
				love.graphics.draw(jogador[1].foto2, jogador[1].x, jogador[1].y)
			else
				love.graphics.draw(jogador[1].foto3, jogador[1].x, jogador[1].y)
			end
		else
			if flag2 == true then
				love.graphics.draw(jogador[1].foto2_inver, jogador[1].x, jogador[1].y)
			else
				love.graphics.draw(jogador[1].foto3_inver, jogador[1].x, jogador[1].y)
			end
		end
	end
end

function jogador:load()
	fotoplayer = love.graphics.newImage("imagens/0_Reaper_Man_Idle_001.png")
	fotoplayer2 = love.graphics.newImage("imagens/0_Reaper_Man_Walking_001.png")
	fotoplayer3 = love.graphics.newImage("imagens/0_Reaper_Man_Walking_013.png")
	fotoplayer_inver = love.graphics.newImage("imagens/0_Reaper_Man_Idle_001_invertida.png")
	fotoplayer2_inver = love.graphics.newImage("imagens/0_Reaper_Man_Walking_001_invertida.png")
	fotoplayer3_inver = love.graphics.newImage("imagens/0_Reaper_Man_Walking_013_invertida.png")
	geraJogador()
end

function jogador:update(dt)
	movimento(dt)
	if flag == true then
		temp = (temp + velocidade_pernas) + dt
		if math.floor(temp)%2 == 0 then
			flag2 = false
		else
			flag2 = true
		end
	else
		temp = 0
	end
end

function jogador:draw()
	printJogador()
end