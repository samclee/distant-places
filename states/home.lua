local home = {}
 
local gates = {Gate(799,0,5,600,'garden',60,150)}
local walls = {}
local ppl = {Person(240,110,assets.ppl.desk,60,19)}
local src = assets.songs.home
local crickets = assets.songs.crickets
crickets:setLooping(true)
crickets:setVolume(1)
local bed_loc = vec(370,79+32)
local bed_time = false


function home:enter(from,px,py)
	p:teleport(px,py)
	screen = {v=0.5,c=1}
	if not game_end then src:play() end
	if game_end then to_home:stop() crickets:play() p.spd=1 end
	add_many(walls)
	add_many(gates)
end

function home:leave()
	src:stop()
	crickets:stop()
	rm_many(walls)
	rm_many(gates)
end

function home:update(dt)
	update_many(gates)
	update_many(ppl, dt)
	crickets:setVolume(screen.c)

	if (p:get_center():dist(bed_loc) < 60) and game_end and bed_time == false then
		bed_time = true
		p.spd=0
		Timer.tween(5,screen,{v=1,c=0},'linear',function() gamestate.switch(credits) end)
	end

	Timer.update(dt)
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
	lg.draw(assets.ppl.bed, bed_loc.x-50,bed_loc.y-32)
	p:draw()
	draw_ui(ppl)

	if game_end then lg.setColor(0, 0, 0.1, screen.v) lg.rectangle('fill',0,0,800,600) end
end

return home