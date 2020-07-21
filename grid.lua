local grid = {}
math.randomseed(os.time())


-- confere se o modulo foi carregado corretamente
function grid.is_loaded()
    print("grid module loaded")
end


--Cria um novo grid e retorna a sua matrix 2D (map)
function grid.new(size_x,size_y)
    local map= {}
    for i=0,size_x/64 do
        map[i] = {}
        for j=0,size_y/64 do
            map[i][j] = {x=i*64,y=j*64,wall=false}
        end
    end
    return map
end

--Adiciona uma parede
function grid.add_wall(map,x,y)
    map[x][y].wall = true
    return map
end


--Remove uma parede
function grid.delete_wall(map,x,y)
    map[x][y].wall = false
    return map
end

--Desenha o Grid
function grid.draw(map)
    for x=0,#map do
        for y=0,#map[x] do
            if map[x][y].wall then
                love.graphics.setColor(0,0,0) -- altera a cor
                love.graphics.rectangle("fill", map[x][y].x, map[x][y].y, 64, 64 )
            else
                love.graphics.setColor(0,0,0) -- altera a cor 
                love.graphics.rectangle("line", map[x][y].x, map[x][y].y, 64, 64 )
            end
        end
    end    
end


--adiciona paredes aleatoriamente: percent= porcetagem do grid que serao parede
function grid.random_walls(map,percent)
    local percent = 0.55 or percent
    local cut= 100 * percent
    for x=0,#map do
        for y=0,#map[x] do
            local rd = math.random(1,100)
            if rd<=cut then
                map[x][y].wall = true
            else
                map[x][y].wall = false
            end
        end
    end
    return map
end



return grid