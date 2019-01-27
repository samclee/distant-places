local home = {}

 
local gates = {Gate(799,0,5,600,'garden',60,150)}
local walls = {}
local ppl = {}
local src = assets.songs.home
local bed_loc = vec(220,82)
function home:enter(from,px,py)
	p:teleport(px,py)
	if not game_end then src:play() end
	add_many(walls)
	add_many(gates)
end

function home:leave()
	src:stop()
	rm_many(walls)
	rm_many(gates)
end

function home:update(dt)
	update_many(gates)
	update_many(ppl, dt)

	if (p:get_center():dist(bed_loc) < 60) and game_end then
		gamestate.switch(credits)
	end
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
	lg.setColor(colors.white)
	lg.draw(assets.ppl.desk, 50,50)
	lg.draw(assets.ppl.bed, 170,50)
	p:draw()
	draw_ui(ppl)
end

return home