local home = {}

 
local gates = {Gate(799,200,30,400,'rm1',200,400)}
local walls = {AABB(10,10,500,70),
				AABB(10,500,400,30)}
local boxes = {TextBox(600, 450, 100,40,'hello',colors.white,colors.black)}
local ppl = {Person(600,500,assets.ppl.s1,30,{"Hi there", "Okay bye"})}


function home:enter(from,px,py)
	p:teleport(px,py)
	
	add_many(walls)
	add_many(gates)
end

function home:leave()
	rm_many(walls)
	rm_many(gates)
end

function home:update(dt)
	for _,g in pairs(gates) do
		g:update()
	end

	for _,p in pairs(ppl) do
		p:update()
	end
end

function home:draw()
	p:draw()
	for _,g in pairs(gates) do
		g:draw()
	end
	for _,w in pairs(walls) do
		w:draw()
	end
	for _,p in pairs(ppl) do
		p:draw()
	end
	for i,p in pairs(ppl) do
		if p.talking then
			boxes[i]:draw()
		end
	end
end

return home