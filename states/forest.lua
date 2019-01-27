local forest = {}
 
local gates = {Gate(0,600,800,1,'clouds',350,10)}
local walls = {}
local ppl = {}
local src = assets.songs.to_home
src:setLooping(true)

function hit_em_with_the_tears()
	src:play()
	game_end = true
end

function forest:enter(from,px,py)
	p:teleport(px,py)
	add_many(walls)
	add_many(gates)
	
end

function forest:leave()
	rm_many(walls)
	rm_many(gates)
end

function forest:update(dt)
	update_many(gates)
	update_many(ppl, dt)
end

function forest:draw()
	lg.setColor(colors.white)
	--lg.draw(assets.bg.forest)
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

return forest