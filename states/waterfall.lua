local waterfall = {}
 
local gates = {Gate(0,0,1,600,'city',730,600-64),Gate(799,0,5,600,'clouds',40,400)}
local walls = {}
local ppl = {}
local src = assets.songs.waterfall

function waterfall:enter(from,px,py)
	p:teleport(px,py)
	if not game_end then src:play() end
	add_many(walls)
	add_many(gates)
end

function waterfall:leave()
	src:stop()
	rm_many(walls)
	rm_many(gates)
end

function waterfall:update(dt)
	update_many(gates)
	update_many(ppl, dt)
end

function waterfall:draw()
	lg.setColor(colors.white)
	--lg.draw(assets.bg.waterfall)
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

return waterfall