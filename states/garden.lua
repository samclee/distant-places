local garden = {}

 
local gates = {Gate(0,0,1,600,'home',500,200),Gate(0,599,800,10,'beach',40,40)}
local walls = {AABB(350,180,100,60)}
local ppl = {}
local src = assets.songs.garden

function garden:enter(from,px,py)
	p:teleport(px,py)
	src:play()
	add_many(walls)
	add_many(gates)
end

function garden:leave()
	src:stop()
	rm_many(walls)
	rm_many(gates)
end

function garden:update(dt)
	update_many(gates)
	update_many(ppl, dt)
end

function garden:draw()
	lg.setColor(colors.white)
	lg.draw(assets.bg.garden)
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

return garden