local Title = {}

function Title:draw()
	lg.setColor(colors.white)
	lg.draw(assets.bg.title,0,0)
end

function Title:keypressed(k)
	gamestate.switch(states.home, 80,200)
end

return Title