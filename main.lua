function love.load()
	state = "title"
	stone = love.graphics.newImage("res/stone.png")
	flag = love.graphics.newImage("res/flag.png")

	player = {
        grid_x = 256,
        grid_y = 256,
        act_x = 200,
        act_y = 200,
        speed = 12,
        stage1 = love.graphics.newImage("res/player-stage1.png")
    }
    map1 = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, 1 },
        { 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1 },
        { 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1 },
        { 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
end

function love.draw()
	if state == "title" then
		love.graphics.print('Press the right (>) arrow on your keyboard to start!', 20, 20)
	elseif state == "level1" then
		love.graphics.draw(player.stage1, player.act_x, player.act_y)
		love.graphics.print('FPS: '..love.timer.getFPS(), 10, 10)
	    for y=1, #map1 do
	        for x=1, #map1[y] do
	            if map1[y][x] == 1 then
	                love.graphics.draw(stone, x * 32, y * 32)
	            end
	            if map1[y][x] == 2 then
	                love.graphics.draw(flag, x * 32, y * 32)
	            end
	        end
	    end
	end
end

function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
    player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
end

function love.keypressed(key)
	if state == "title" then
		if key == "right" then
			if state == "title" then
				state = "level1"
			end
		end
	elseif state == "level1" then
			if key == "up" then
	        if testMap(0, -1) then
	            player.grid_y = player.grid_y - 32
	        end
	        if isEnd(0, 0) then
	            love.event.push('quit')
	        end
	    elseif key == "down" then
	        if testMap(0, 1) then
	            player.grid_y = player.grid_y + 32
	        end
	        if isEnd(0, 0) then
	            love.event.push('quit')
	        end
	    elseif key == "left" then
	        if testMap(-1, 0) then
	            player.grid_x = player.grid_x - 32
	        end
	        if isEnd(0, 0) then
	            love.event.push('quit')
	        end
	    elseif key == "right" then
	        if testMap(1, 0) then
	            player.grid_x = player.grid_x + 32
	        end
	        if isEnd(0, 0) then
	            love.event.push('quit')
	        end
    	end
	end
end

function testMap(x, y)
    if map1[(player.grid_y / 32) + y][(player.grid_x / 32) + x] == 1 then
        return false
    end
    return true
end

function isEnd(x, y)
    if map1[(player.grid_y / 32) + y][(player.grid_x / 32) + x] == 2 then
        return true
    end
    return false
end