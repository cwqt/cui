Generic = require (...)\match("(.+)%.[^%.]+$") .. ".Generic"

class Child extends Generic
	new: (...) =>
		super(nil, ...)

	instantiate: () =>
		super\instantiate!
		m = @getStyle("m")
		p = @getStyle("p")
		@mx = @x + m[4]
		@my = @y + m[1]
		@mw = @w - (m[2] + m[4])
		@mh = @h - (m[1] + m[3])
		@px = @mx + p[4]
		@py = @my + p[1]
		@pw = @mw - (p[2] + p[4])
		@ph = @mh - (p[1] + p[3])

	draw: () =>
		super\draw()
		with love.graphics
			.setColor(0.5,1,1,1)
			.rectangle("line", @mx, @my, @mw, @mh)
			.setColor(0.2,1,1,1)
			.rectangle("line", @px, @py, @pw, @ph)
			.setColor(1,1,1,1)
			.setColor(@getStyle("background_color"))
			.rectangle("fill", @mx,@my,@mw,@mh)
			.setColor(1,1,1,1)

			if @getStyle("overflow") == "hidden"
				x, y = @getWorldPosition!
				.setScissor(x+(@px-@x), y+(@py-@y), @pw, @ph)


return Child