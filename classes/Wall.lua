local Wall = Class{ __includes = AABB }

function Wall:init(x, y, w, h)
	self.id = 'wall'
	AABB.init(self,x,y,w,h)
	world:add(self, self:get_rect())
end

function Wall:draw()
	AABB.draw(self)
end

return Wall