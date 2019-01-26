local Player = Class{ __includes = AABB }

function Player:init(x, y, spr, r)
	self.spr = spr
	self.r = r
	self.spd = 6
	self.id = 'player'
	AABB.init(self,x,y,spr:getWidth(),spr:getHeight())
	world:add(self, self:get_rect())
	self.filter = function(item,other)
		if other.id == 'gate' then
			return 'cross'
		end

		return 'slide'
	end
end

function Player:update(dx,dy)
	local dir = vec(dx,dy)
	dir = dir:normalized() * self.spd

	local actualX, actualY, cols, len = world:move(self, self.pos.x + dir.x, 
                                            self.pos.y + dir.y, self.filter)
	self.pos.x, self.pos.y = actualX, actualY
end

function Player:draw()
	lg.setColor(colors.white)
	lg.draw(self.spr,self.pos.x,self.pos.y)

	if self.debug then
		lg.setColor(colors.red)
		lg.ellipse('line',self.pos.x+self.w/2,self.pos.y+self.h/2,self.r,self.r)
	end

	AABB.draw(self)
end

function Player:teleport(nx,ny)
	world:update(self,nx,ny)
	self.pos.x, self.pos.y = nx, ny
end

return Player