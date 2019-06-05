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
Timer = require 'libs/timer'

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

function draw_many(to_draw)
	for _,t in pairs(to_draw) do
		t:draw()
	end
end

function update_many(to_update, dt)
	for _,t in pairs(to_update) do
		if world:hasItem(t) or t.id == 'person' then
			t:update(dt)
		end
	end
end

function draw_ui(ppl)
	for i,p in pairs(ppl) do
		if p.talking then
			local talk_index = p.t_idx
			if game_end then
				talk_index = talk_index + 1
			end
			lg.setFont(font2)
			textboxes[talk_index]:draw()
		end
	end
end

-- ui
font1 = assets.rainyhearts(54)
font3 = assets.rainyhearts(32)
font2 = assets.PixelOperator(36)

-- globals
game_end = false

to_home = assets.songs.to_home
to_home:setLooping(true)

-- classes
Class = require 'libs/class'
AABB = require 'classes/AABB'

Player = require 'classes/Player'
p = Player(10,10,assets.ppl.Player,40)

Gate = require 'classes/Gate'
TextBox = require 'classes/TextBox'

textboxes = require 'assets/textboxes'
Person = require 'classes/Person'

-- states
gamestate = require 'libs/gamestate'

--framerate correction
tick_time = 1/50
accum = 0.0

states = {}
states.title = require 'states/title'
states.home = require 'states/home'
states.garden = require 'states/garden'
states.beach = require 'states/beach'
states.city = require 'states/city'
states.waterfall = require 'states/waterfall'
states.clouds = require 'states/clouds'
states.forest = require 'states/forest'

credits = require 'states/credits'

function love.load()
	gamestate.registerEvents()
	gamestate.switch(states.title)
end

function love.draw()

end

function love.update(dt)
	accum = accum + dt
	if accum >= tick_time then
		accum = accum - tick_time
		myupdate()
	end
end

function myupdate()
	local dx,dy=0,0
	if lk.isDown('left') then dx=dx-1 end
	if lk.isDown('right') then dx=dx+1 end
	if lk.isDown('up') then dy=dy-1 end
	if lk.isDown('down') then dy=dy+1 end

	p:update(dx,dy)
end

function love.keypressed(k)
	if k == 'a' then
		p.spd = 10
	end
end