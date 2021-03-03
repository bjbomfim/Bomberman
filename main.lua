--Created by Alexandre Bomfim-Dragon technology

require("modulos/parede")
require("modulos/jogador")
require("modulos/bomba")
require("modulos/grid")
require("modulos/parede_movel")

local fotobackground
lar = 832
alt = 576

function love.load()
	love.window.setTitle("Bomberman")
	love.window.setMode(lar, alt)
	fotobackground = love.graphics.newImage("imagens/backgrandBomberman.png")
	grid:load()
	jogador:load()
	parede_fixa:load()
	parede_movel:load()
	bomba:load()
end

function love.update(dt)
	jogador:update(dt)
	bomba:update(dt)
end

function love.draw()
	love.graphics.draw(fotobackground, 0,0)
	bomba:draw()
	jogador:draw()
	parede_fixa:draw()
	parede_movel:draw()
end