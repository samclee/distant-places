local home = {}

 
local gates = {Gate(799,0,5,600,'garden',60,150)}
local walls = {}
local ppl = {}

function home:enter(from,px,py)
	p:teleport(px,py)
	
	add_many(walls)
	add_many(gates)
end

function home:leave()
	rm_many(walls)
	rm_many(gates)
end

function home:update(dt)
	update_many(gates)
	update_many(ppl, dt)
end

function home:draw()
	lg.setColor(colors.white)
	lg.draw(assets.bg.home)
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

return home