--[[
	Typing Game from tutorial from CS50

	Author: Louie Ho
	yu.louis.ho@gmail.com
]]

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

local font = love.graphics.newFont('fonts/font.ttf', 64)

function love.load()
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)

	love.graphics.setFont(font)
end

function love.keypressed(key)
	if key == 'escape' then 
		love.event.quit()
	end
end

function love.update(dt)

end

function love.draw()
	
	-- draw the current goal word in yellow
	love.graphics.setColor(1, 1, 0, 1)
	love.graphics.printf('CS50', 0, WINDOW_HEIGHT / 2 - 32, WINDOW_WIDTH, 'center')
	love.graphics.setColor(1, 1, 1, 1)

	-- draw the progress of the word we're typing in white
	local fullString = 'CS50'
	local halfString = 'CS5'
	love.graphics.printf(halfString, 0, WINDOW_HEIGHT / 2 + 16, 
		WINDOW_WIDTH - font:getWidth(fullString:sub(halfString:len() + 1, fullString:len())), 'center')	

	-- draw the timer in the top-left
	love.graphics.print('60')
	
	-- draw the score in the top-right
	love.graphics.printf('24', 0, 0, WINDOW_WIDTH, 'right')
	
	-- 45:07
end
