local rm1 = {}

local gates = {}
local walls = {AABB(600,10,50,70)}


function rm1:enter(from,px,py)
	p:teleport(px,py)
	add_many(walls)
	add_many(gates)
end

function rm1:update(dt)
	for _,g in pairs(gates) do
		g:update()
	end
end

function rm1:draw()
	p:draw()
	for _,w in pairs(walls) do
		w:draw()
	end

	
end

return rm1