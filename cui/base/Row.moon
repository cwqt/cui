Container = require (...)\match("(.+)%.[^%.]+$") .. ".Container"

class Row extends Container
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

		sx = 0
		for k, child in pairs(@children)
			child.parent = self
			child.key = k
			child.w = (@w/12) * @childDimensions[k]
			child.h = @h
			child.x = sx
			sx += child.w
			child\instantiate!
		
	draw: () =>
		super\draw!

return Row
