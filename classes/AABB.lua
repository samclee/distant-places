local AABB = Class{}

function AABB:init(x, y, w, h)
    self.pos = vec(x, y)
    self.w = w
    self.h = h
    self.debug=false
    self.debug_clr = colors.orange
end

function AABB:get_rect()
    return self.pos.x, self.pos.y, self.w, self.h
end

function AABB:draw()
	if self.debug then
		lg.setColor(self.debug_clr)
		lg.rectangle('line',self.pos.x,self.pos.y,self.w,self.h)
	end
end

function AABB:get_center()
	return vec(self.pos.x + self.w / 2, self.pos.y + self.h / 2)
end

return AABB