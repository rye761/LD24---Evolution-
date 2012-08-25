function love.load()
	state = "title"
	--set up images
	stone = love.graphics.newImage("res/stone.png")
	flag = love.graphics.newImage("res/flag.png")
	title = love.graphics.newImage("res/title.png")

	--load up sounds
	sound = {
		finish = love.audio.newSource("res/finish.wav", "static"),
		evolve = love.audio.newSource("res/evolve.wav", "static"),
		won = love.audio.newSource("res/won.wav")
	}

	currentLevel = "2"

	--player variables
	player = {
        grid_x = 256,
        grid_y = 256,
        act_x = 200,
        act_y = 200,
        speed = 2,
        stage1 = love.graphics.newImage("res/player-stage1.png"),
        stage2 = love.graphics.newImage("res/player-stage2.png"),
        stage3 = love.graphics.newImage("res/player-stage3.png")
    }
    map1 = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 2, 1 },
        { 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1 },
        { 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1 },
        { 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
    map2 = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
    map3 = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 2, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1 },
        { 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
    map4 = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1 },
        { 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 },
        { 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1 },
        { 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
    map5 = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 1, 0, 1, 2, 0, 0, 1, 0, 1, 0, 0, 1 },
        { 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1 },
        { 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1 },
        { 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1 },
        { 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1 },
        { 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
    map6 = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1 },
        { 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1 },
        { 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1 },
        { 1, 0, 1, 0, 1, 0, 0, 2, 1, 1, 0, 1, 0, 1 },
        { 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1 },
        { 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1 },
        { 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1 },
        { 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1 },
        { 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1 },
        { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    }
end

function love.draw()
	love.graphics.setBackgroundColor(20, 160, 250)
	if state == "title" then
		love.graphics.draw(title, 100, 10)
		love.graphics.print('Press the right (>) arrow on your keyboard to start!', 150, 200, 0, 1.2)
		love.graphics.print('Press A for about!', 150, 250, 0, 1.2)
		love.graphics.print('Press H for How-To play!', 150, 300, 0, 1.2)
	elseif state == "level1" then
		love.graphics.draw(player.stage1, player.act_x, player.act_y)
		love.graphics.print('FPS: '..love.timer.getFPS(), 10, 10)
		currentMap = map1
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
	elseif state == "about" then
		love.graphics.print("This is a game for LD24!", 150, 200, 0, 1.2)
		love.graphics.print("Made by ryebread761 with love 2D and lua ;)", 150, 250, 0, 1.2)
		love.graphics.print("Press t to leave this screen", 150, 300, 0, 1.2)
		if love.keyboard.isDown("t") then
			state = "title"
		end
	elseif state == "level2" then
		love.graphics.draw(player.stage1, player.act_x, player.act_y)
		love.graphics.print('FPS: '..love.timer.getFPS(), 10, 10)
		currentMap = map2
		currentLevel = "_evolve1"
	    for y=1, #map2 do
	        for x=1, #map2[y] do
	            if map2[y][x] == 1 then
	                love.graphics.draw(stone, x * 32, y * 32)
	            end
	            if map2[y][x] == 2 then
	                love.graphics.draw(flag, x * 32, y * 32)
	            end
	        end
	    end
	elseif state == "level3" then
		love.graphics.draw(player.stage2, player.act_x, player.act_y)
		love.graphics.print('FPS: '..love.timer.getFPS(), 10, 10)
		currentMap = map3
		currentLevel = "4"
	    for y=1, #map3 do
	        for x=1, #map3[y] do
	            if map3[y][x] == 1 then
	                love.graphics.draw(stone, x * 32, y * 32)
	            end
	            if map3[y][x] == 2 then
	                love.graphics.draw(flag, x * 32, y * 32)
	            end
	        end
	    end
	elseif state == "level_evolve1" then
		love.graphics.print("You have evolved", 150, 200, 0, 1.2)
		love.graphics.print("You are now stage 2!", 150, 250, 0, 1.2)
		love.graphics.print("Press space to get to level 3", 150, 300, 0, 1.2)
		if love.keyboard.isDown(" ") then
			state = "level3"
			player.speed = 7
		end
		love.audio.play(sound.evolve)
	elseif state == "level4" then
		love.graphics.draw(player.stage2, player.act_x, player.act_y)
		love.graphics.print('FPS: '..love.timer.getFPS(), 10, 10)
		currentMap = map4
		currentLevel = "_evolve2"
	    for y=1, #map4 do
	        for x=1, #map4[y] do
	            if map4[y][x] == 1 then
	                love.graphics.draw(stone, x * 32, y * 32)
	            end
	            if map4[y][x] == 2 then
	                love.graphics.draw(flag, x * 32, y * 32)
	            end
	        end
	    end
	elseif state == "level_evolve2" then
		love.graphics.print("You have evolved", 150, 200, 0, 1.2)
		love.graphics.print("You are now stage 3!", 150, 250, 0, 1.2)
		love.graphics.print("Press space to get to level 5", 150, 300, 0, 1.2)
		if love.keyboard.isDown(" ") then
			state = "level5"
			player.speed = 15
		end
		love.audio.play(sound.evolve)
	elseif state == "level5" then
		love.graphics.draw(player.stage3, player.act_x, player.act_y)
		love.graphics.print('FPS: '..love.timer.getFPS(), 10, 10)
		currentMap = map5
		currentLevel = "6"
	    for y=1, #map5 do
	        for x=1, #map5[y] do
	            if map5[y][x] == 1 then
	                love.graphics.draw(stone, x * 32, y * 32)
	            end
	            if map5[y][x] == 2 then
	                love.graphics.draw(flag, x * 32, y * 32)
	            end
	        end
	    end
	elseif state == "level6" then
		love.graphics.draw(player.stage3, player.act_x, player.act_y)
		love.graphics.print('FPS: '..love.timer.getFPS(), 10, 10)
		currentMap = map6
		currentLevel = "_end"
	    for y=1, #map6 do
	        for x=1, #map6[y] do
	            if map6[y][x] == 1 then
	                love.graphics.draw(stone, x * 32, y * 32)
	            end
	            if map6[y][x] == 2 then
	                love.graphics.draw(flag, x * 32, y * 32)
	            end
	        end
	    end
	elseif state == "level_end" then
		love.graphics.print("That was my LD24 game!", 150, 200, 0, 1.2)
		love.graphics.print("Made by ryebread761 with love 2D and lua ;)", 150, 250, 0, 1.2)
		love.graphics.print("Thanks for Playing! Hope you enjoyed!", 150, 300, 0, 1.2)
		love.audio.play(sound.won)
	elseif state == "how_to_play" then
			love.graphics.print("Arrows to move", 150, 200, 0, 1.2)
			love.graphics.print("Go to the green flag for the next level", 150, 250, 0, 1.2)
			love.graphics.print("Press t to leave this screen", 150, 300, 0, 1.2)
			if love.keyboard.isDown("t") then
				state = "title"
			end
	end
	love.graphics.print(state, 400, 10)
end

function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
    player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
end

function love.keypressed(key)
	if state == "title" then
		if key == "right" then
			state = "level1"
		end
		if key == "a" then
			state = "about"
		end
		if key == "h" then
			state = "how_to_play"
		end
	elseif state ~= "about" or "title" or "how_to_play" then
			if key == "up" then
	        if testMap(0, -1) then
	            player.grid_y = player.grid_y - 32
	        end
	        if isEnd(0, 0) then
	            state = "level"..currentLevel
	            love.audio.play(sound.finish)
	        end
	    elseif key == "down" then
	        if testMap(0, 1) then
	            player.grid_y = player.grid_y + 32
	        end
	        if isEnd(0, 0) then
	            state = "level"..currentLevel
	            love.audio.play(sound.finish)
	        end
	    elseif key == "left" then
	        if testMap(-1, 0) then
	            player.grid_x = player.grid_x - 32
	        end
	        if isEnd(0, 0) then
	        	love.audio.play(sound.finish)
	            state = "level"..currentLevel
	        end
	    elseif key == "right" then
	        if testMap(1, 0) then
	            player.grid_x = player.grid_x + 32
	        end
	        if isEnd(0, 0) then
	            state = "level"..currentLevel
	            love.audio.play(sound.finish)
	        end
    	end
	end
	if key == "escape" then
		love.event.push('quit')
	end
end

function testMap(x, y)
    if currentMap[(player.grid_y / 32) + y][(player.grid_x / 32) + x] == 1 then
        return false
    end
    return true
end

function isEnd(x, y)
    if currentMap[(player.grid_y / 32) + y][(player.grid_x / 32) + x] == 2 then
        return true
    end
    return false
end