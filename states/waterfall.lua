local waterfall = {}
 
local gates = {Gate(0,0,1,600,'city',730,600-64),Gate(800,0,2,600,'forest',10,450)}
local walls = {AABB(190,0,651-190,420)}
local ppl = {Person(245,486,assets.ppl.umbrella,80,15),
			Person(740,520,assets.ppl.witch,80,17)}

local rain = assets.songs.rain
rain:setVolume(3)

rain_pic = {spr = assets.ppl.rain, y = -600}

function waterfall:enter(from,px,py)
	p:teleport(px,py)
	rain:play()
	add_many(walls)
	add_many(gates)
end

function waterfall:leave()

	rain:stop()
	rm_many(walls)
	rm_many(gates)
end

function waterfall:update(dt)
	update_many(gates)
	update_many(ppl, dt)
	rain_pic.y = rain_pic.y + 45
	if rain_pic.y > 0 then rain_pic.y = -600 end

end

function waterfall:draw()
	lg.setColor(colors.white)
	lg.draw(assets.bg.waterfall)
	for _,g in pairs(gates) do
		g:draw()
	end
	for _,w in pairs(walls) do
		w:draw()
	end
	draw_many(ppl)
	p:draw()
	draw_ui(ppl)

	lg.setColor(colors.white)
	lg.draw(rain_pic.spr,0,rain_pic.y)

	lg.setColor({0,0,0,0.2})
	lg.rectangle('fill',0,0,800,600)
end

return waterfall