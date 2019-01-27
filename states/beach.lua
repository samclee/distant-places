local beach = {}

 
local gates = {Gate(0,0,800,1,'garden',476,524),Gate(0,0,2,600,'garden',476,524),Gate(799,0,5,600,'city',3,600-64)}
local walls = {}
local ppl = {Person(200,390,assets.ppl.fish,100,3),
			  Person(600,100,assets.ppl.crab,120,1)}
local src = assets.songs.beach
src:setVolume(.4)
local waves = assets.songs.waves
waves:setVolume(.8)

function beach:enter(from,px,py)
	p:teleport(px,py)
	waves:play()
	if not game_end then src:play() end
	add_many(walls)
	add_many(gates)
end

function beach:leave()
	src:stop()
	waves:stop()
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