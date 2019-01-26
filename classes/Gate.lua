local Gate = Class{ __includes = AABB }

function Gate:init(x, y, w, h, to, px, py)
	self.id = 'gate'
	self.to = to
	self.px = px
	self.py = py
	AABB.init(self,x,y,w,h)
	self.debug_clr = colors.red
	self.debug=true
	
	self.filter = function(item, other)
		if other.id == 'player' then
			return 'cross'
		end
	end
end

function Gate:update(dt)
	local aX, aY, cols, len = world:check(self, self.x, self.y, self.filter)
    
    for i=1,len do
        local col = cols[i]
        local otherObj = col.other
        
        if otherObj.id == 'player' then
            gamestate.switch(states[self.to],self.px,self.py)
        end
    end
end

function Gate:draw()
	AABB.draw(self)
end

return Gate