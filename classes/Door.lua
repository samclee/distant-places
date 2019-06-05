local Door = class('Door', PhysAABB)

function Door:initialize(p)
  self.id = 'Door'
  self.to = p.to
  self.dirIdx = p.dirIdx

  PhysAABB.initialize(self, p)

end

function Door:update(wld)
  local items, len = wld:queryRect(self.pos.x, self.pos.y, self.w, self.h)
  for i=1, len do
    if items[1].id == 'player' then
      return true
    end
  end

  return false
end

function Door:draw()
  lg.setColor(0,1,0, 0.5)
  lg.rectangle('fill', self.pos.x, self.pos.y, self.w, self.h)
end

return Door