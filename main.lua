-- love shorthands
lg = love.graphics
lw = love.window
lk = love.keyboard
la = love.audio
le = love.event
lm = love.math
lt = love.timer
ls = love.sound

-- misc
vec = require 'libs/vector'
colors = require 'libs/colors'
assets = require('libs/cargo').init('assets')

-- collision
bump = require 'libs/bump'
world = bump.newWorld()

function add_many(to_add)
	for _,w in ipairs(to_add) do
		world:add(w, w:get_rect())
	end
end

function rm_many(to_rm)
	for _,w in ipairs(to_rm) do
		world:remove(w)
	end
end

-- globals

game_end = true

-- classes
Class = require 'libs/class'
AABB = require 'classes/AABB'

Player = require 'classes/Player'
p = Player(10,10,assets.ppl.s0,40)

Wall = require 'classes/Wall'

Gate = require 'classes/Gate'
TextBox = require 'classes/TextBox'

textboxes = require 'assets/textboxes'
Person = require 'classes/Person'



-- states
gamestate = require 'libs/gamestate'
states = {}
states.home = require 'states/home'
states.rm1 = require 'states/rm1'

function love.load()
	gamestate.registerEvents()
	gamestate.switch(states.home,100,300)
end

function love.draw()
	lg.setColor(colors.green)
	local items, len = world:getItems()
	for i=1,len do
		local x,y,w,h = world:getRect(items[i])
		lg.rectangle('line',x,y,w,h)
	end
end

function love.update(dt)
	local dx,dy=0,0
	if lk.isDown('left') then dx=dx-1 end
	if lk.isDown('right') then dx=dx+1 end
	if lk.isDown('up') then dy=dy-1 end
	if lk.isDown('down') then dy=dy+1 end

	p:update(dx,dy)
end