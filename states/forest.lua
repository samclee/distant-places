local forest = {}

local gates = {}
local walls = {AABB(600,10,50,70)}


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
	for _,g in pairs(gates) do
		g:update()
	end
end

function forest:draw()
	p:draw()
	for _,w in pairs(walls) do
		w:draw()
	end

	
end

return forest