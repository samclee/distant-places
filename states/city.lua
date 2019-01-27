local city = {}

 
local gates = {Gate(0,0,1,600,'beach',730,300),Gate(799,0,5,600,'waterfall',40,400)}
local walls = {AABB(0,530,800,5),
				AABB(0,600,800,5)}
local ppl = {Person(200,550,assets.ppl.invis,60,9),
			  Person(600,550,assets.ppl.invis,60,11)}
local src = assets.songs.city

function city:enter(from,px,py)
	p:teleport(px,py)
	if not game_end then src:play() end
	add_many(walls)
	add_many(gates)
end

function city:leave()
	src:stop()
	rm_many(walls)
	rm_many(gates)
end

function city:update(dt)
	update_many(gates)
	update_many(ppl, dt)
end

function city:draw()
	lg.setColor(colors.white)
	lg.draw(assets.bg.city)
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

return city