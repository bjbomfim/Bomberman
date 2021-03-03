grid = {}
 function grid:load()
 	for  i = 0, alt/64 do
		grid[i] = {}
		for j = 0, lar/64 do
			grid[i][j] = {x = j*64, y = i*64}
		end
	end
 end