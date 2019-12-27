Container = require (...)\match("(.+)%.[^%.]+$") .. ".Container"

class Column extends Container
	new: (@childDimensions, ...) =>
		super(nil, ...)

	instantiate: () =>
		super\instantiate!
		@w = @parent.w
		@h = @parent.h
		if @parent.__class.__name == "Row"
			@w = (@parent.w/12) * @parent.childDimensions[@key]
		if @parent.__class.__name == "Column"
			@h = (@parent.h/12) * @parent.childDimensions[@key]

		sy = 0
		for k, child in pairs(@children)
			child.parent = self
			child.key = k
			child.w = @w
			child.h = (@h/12) * @childDimensions[k]
			child.y = sy
			sy += child.h
			child\instantiate!

	draw: () =>
		super\draw!

return Column
