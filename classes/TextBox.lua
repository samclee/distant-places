local TextBox = Class{}

function TextBox:init(x,y,w,h,line,bg_clr,txt_clr)
	self.x=x
	self.y=y
	self.w=w
	self.h=h
	self.line=line
	self.bg_clr=bg_clr
	self.txt_clr=txt_clr
end

function TextBox:draw()
	lg.setColor(self.bg_clr)
	lg.rectangle('fill',self.x,self.y,self.w,self.h)
	lg.setColor(self.txt_clr)
	lg.printf(self.line,self.x+3,self.y+3,self.w-3)
end

return TextBox