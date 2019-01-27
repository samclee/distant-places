local beach = {}

 
local gates = {}
local walls = {}
local ppl = {Person(200,390,assets.ppl.fish,70,3)}
local src = assets.songs.beach

function beach:enter(from,px,py)
	p:teleport(px,py)
	src:play()
	add_many(walls)
	add_many(gates)
end

function beach:leave()
	src:stop()
	rm_many(walls)
	rm_many(gates)
end

function beach:update(dt)
	update_many(gates)
	update_many(ppl, dt)
end

function beach:draw()
	lg.setColor(colors.white)
	lg.draw(assets.bg.beach)
	for _,g in pairs(gates) do
		g:draw()
	end
	for _,w in pairs(walls) do
		w:draw()
	end
	draw_many(ppl)
	p:draw()
	draw_ui(ppl)
end

return beach