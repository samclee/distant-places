local clouds = {}
 
local gates = {Gate(0,0,1,600,'waterfall',730,400),Gate(800,0,2,600,'forest',10,450)}
local walls = {AABB(0,600,800,2),AABB(0,0,800,2)}
local ppl = {}
local src = assets.songs.clouds

function clouds:enter(from,px,py)
	p:teleport(px,py)
	if not game_end then src:play() end
	add_many(walls)
	add_many(gates)
end

function clouds:leave()
	src:stop()
	rm_many(walls)
	rm_many(gates)
end

function clouds:update(dt)
	update_many(gates)
	update_many(ppl, dt)
end

function clouds:draw()
	lg.setColor(colors.white)
	lg.draw(assets.bg.clouds)
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

return clouds