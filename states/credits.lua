local credits = {}

function credits:draw()
	lg.setColor(colors.white)
	lg.setFont(font1)
	lg.printf('distant places', 0, 200, 800, 'center')
	lg.setFont(font2)
	lg.printf('by grace, kirsten, jack, and sam', 0, 250, 800, 'center')
end

return credits