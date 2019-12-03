PATH = ...
inspect = require PATH..'.libs.inspect'
lume    = require PATH..'.libs.lume'
M       = require PATH..'.libs.moses'
Timer   = require PATH..'.libs.timer'
deep    = require PATH..'.libs.deep'

cui = {
  _VERSION: 		'cui v1.0.0'
  _DESCRIPTION: 'practical oo löve ui library'
  _URL: 				'https://gitlab.com/cxss/cui',
  _LICENSE: 		'mit'
}

cui.load = () ->
	love.window.setMode(1280, 720, {highdpi:true})
	cui.Timer = Timer!

cui.update = (dt) ->
	cui.Timer\update(dt)

class Generic
	new: (@id) =>
		@active = false

	activate: () =>
		@active = true
		print inspect(self, {depth:2})
	
	update: (dt) =>
		if not @active then return
	
	draw: () =>
		if not @active then return

	destroy: () =>

-- containables have pools
class Container extends Generic
	new: (pool={}, id) =>
		@pool = {}
		for _, obj in pairs(pool) do @add(obj)
		super(id)

	update: (dt) =>
		super\update!
		-- for k, obj in pairs @pool do obj\update(dt)

	draw: () =>
		super\draw!
		-- for k, obj in pairs @pool do obj\draw!

	add: (obj) =>
		obj.parent = self
		@pool[obj.id] = obj
		-- obj\activate!

	remove: (id) =>
		@pool[id] = nil

class View extends Container
	new: (@x, @y, @w, @h, pool={}, id) =>
		super(pool, id)
	
	activate: () =>
		super\activate!
		@m = {10,10,10,10}
		@p = {10,10,10,10}
		@mx, @my = @x+@m[4], @y+@m[1]
		@mw, @mh = @w-(@m[2]+@m[4]), @h-(@m[3]+@m[1])
		@px, @py = @mx+@p[4], @my+@p[1]
		@pw, @ph = @mw-(@p[2]+@p[4]), @mh-(@p[3]+@p[1])
		
	draw: () =>		
		super\draw!	

		with love.graphics
			.setColor(1,1,1,1)
			-- margin
			.push!
			.translate(@x, @y)
			.rectangle("line", 0, 0, @w, @h)
			--padding
			.push!
			.translate(@m[4], @m[1])
			.rectangle("line", 0, 0, @mw, @mh)
			--content
			.push!
			.translate(@p[4], @p[1])
			.rectangle("line", 0, 0, @pw, @ph)
			-- super\draw!
			for i=1, 3 do .pop!








class Row extends Container
	new: (@itemWidths, pool, id) =>
		-- @m = {10,10,10,10}
		-- @p = {10,10,10,10}
		-- @mx, @my = @parent.x+@m[4], @parent.y+@m[1]
		-- @mw, @mh = @w-(@m[2]+@m[4]), @h-(@m[3]+@m[1])
		-- @px, @py = @mx+@p[4], @my+@p[1]
		-- @pw, @ph = @mw-(@p[2]+@p[4]), @mh-(@p[3]+@p[1])
		super(pool, id)

	draw: () =>
		-- super\draw!

	update: (dt) =>

class Child extends Generic
	new: (id) =>
		super(id)
	draw: () =>
		love.graphics.setColor(0,0,0,1)
		love.graphics.printf("hello", 0, 0, 10)


cui.Generic = Generic
cui.View = View
cui.Row = Row
cui.Column = Column
cui.Child = Child
return cui