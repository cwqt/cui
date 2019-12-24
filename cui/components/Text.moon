Child = require (...)\match("(.+)%.[^%.]+$")\match("(.-)[^%.]+$") .. ".base.Child"

class Text extends Child
	new: (value, ...) =>
		super(...)
		@setState({"value":value})

	draw: () =>
		love.graphics.print(@state.value or "", 0, 0)

return Text