Generic = require (...)\match("(.+)%.[^%.]+$") .. ".Generic"

class Container extends Generic
	new: (params, @children, ...) =>
		super(params, ...)
		@isParent = true
		for k, child in pairs(@children) do
			child.parent = self
			child.key = k
			child\instantiate!

	draw: () =>
		super\draw!
		with love.graphics
			.push!
			.translate(@x, @y)
			for k, child in pairs(@children) do
				child\draw()
			.pop!

	mousemoved: (x, y) =>
		@detectHover!
		if @state.hover
			for k, child in pairs(@children) do
				child\mousemoved(x, y)


return Container