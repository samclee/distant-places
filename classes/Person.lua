local Person = Class{}

function Person:init(x,y,spr,r)
	self.pos = vec(x,y)
	self.w = spr:getWidth()
	self.h = spr:getHeight()
	self.spr = spr
	self.r = r
	
	self.text = text
	
	self.debug = true
end

function Person:update(dt)
	if self.pos:dist(p:get_center()) < (self.r + p.r) then
		self.talking = true
	else
		self.talking = false
	end
end

function Person:draw()
	lg.setColor(colors.white)
	lg.draw(self.spr,self.pos.x - self.w / 2,self.pos.y - self.h / 2)
	if self.debug then
		lg.setColor(colors.blue)
		lg.ellipse('line',self.pos.x,self.pos.y,self.r,self.r)
	end

end

return Person