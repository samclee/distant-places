local credits = {}

local src = assets.songs.credits
src:setLooping(true)
src:setVolume(0.5)

function credits:enter()
	src:play()
end

function credits:draw()
	lg.setColor(colors.white)
	lg.setFont(font1)
	lg.printf('distant places', 0, 200, 800, 'center')
	lg.setFont(font2)
	lg.printf('by grace willhoite, erica cherrington, kirsten gillam, conner shaw, jack concordia, kristen shih, and sam lee', 100, 280, 600, 'center')
end

return credits