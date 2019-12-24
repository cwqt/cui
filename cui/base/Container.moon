Generic = require (...)\match("(.+)%.[^%.]+$") .. ".Generic"

class Container extends Generic
	new: (params, @children, ...) =>
		super(params, ...)
		@isParent = true
		@selectedElement = nil
		for k, child in pairs(@children) do
			child.parent = self
			child.key = k
			child\instantiate!

	update: (dt) =>
		super\update(dt)
		for child in *@children do
			child\update(dt)

	draw: () =>
		super\draw!
		with love.graphics
			.push!
			.translate(@x, @y)
			for k, child in pairs(@children) do
				child\draw()
			.pop!

	mousepressed: (x,y,button) =>
		for k, child in pairs(@children)
			child\mousepressed(x,y,button)

	mousemoved: (x, y) =>
		super\mousemoved(x,y)
		if @state.hover
			for child in *@children do
				child\mousemoved(x, y)

	mousepressed: (x,y,button) =>
		super\mousepressed(x,y,button)
		if @state.hover
			for child in *@children do
				if child.state.hover
					child\mousepressed(x, y, button)

	keypressed: (k) =>
		super\keypressed(k)
		if @state.hover
			for child in *@children do
				if child.state.hover or @selectedElement == child
					child\keypressed(k)

	keyreleased: (k) =>
		super\keyreleased(k)
		if @state.hover
			for child in *@children do
				if child.state.hover or @selectedElement == child
					child\keyreleased(k)


return Container