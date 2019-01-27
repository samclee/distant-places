local forest = {}
 
local gates = {Gate(0,0,2,600,'waterfall',730,400)}
local walls = {AABB(800,0,2,600),AABB(0,600,800,2),AABB(0,400,800,2)}
local ppl = {Person(395,438,assets.ppl.invis,160,13)}

local flower = assets.ppl.flower
local flower_loc = vec(320+75,363+75)

function hit_em_with_the_tears()
	to_home:play()
	game_end = true
end

function forest:enter(from,px,py)
	p:teleport(px,py)
	add_many(walls)
	add_many(gates)
	p.spd = 1
end

function forest:leave()
	rm_many(walls)
	rm_many(gates)
	p.spd=2
end

function forest:update(dt)
	update_many(gates)
	update_many(ppl, dt)
	if (p:get_center():dist(flower_loc) < 80) then
		hit_em_with_the_tears()
		flower = assets.ppl.invis
	end
end

function forest:draw()
	lg.setColor(colors.white)
	lg.draw(assets.bg.forest)
	for _,g in pairs(gates) do
		g:draw()
	end
	for _,w in pairs(walls) do
		w:draw()
	end
	draw_many(ppl)
	lg.setColor(colors.white)
	lg.draw(flower,320,363)
	p:draw()
	draw_ui(ppl)
end

return forest