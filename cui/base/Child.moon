Generic = require (...)\match("(.+)%.[^%.]+$") .. ".Generic"

accepted_styles = {
	"margin",
	"padding",
	"background-color",
} 

class Child extends Generic
	new: (...) =>
		super(nil, ...)

	instantiate: () =>
		super\instantiate!
		-- @mx = @x + @style.m[4]
		-- @my = @y + @style.m[1]
		-- @mw = @w - (@style.m[2] + @style.m[4])
		-- @mh = @h - (@style.m[1] + @style.m[3])
		-- @px = @mx + @style.p[4]
		-- @py = @my + @style.p[1]
		-- @pw = @mw - (@style.p[2] + @style.p[4])
		-- @ph = @mh - (@style.p[1] + @style.p[3])

	draw: () =>
		super\draw()
		-- with love.graphics
		-- 	.setColor(0.5,1,1,1)
		-- 	.rectangle("line", @mx, @my, @mw, @mh)
		-- 	.setColor(0.2,1,1,1)
		-- 	.rectangle("line", @px, @py, @pw, @ph)
		-- 	.setColor(1,1,1,1)

	mousemoved: (x, y) =>
		@detectHover!


return Child