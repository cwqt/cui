Child = require (...)\match("(.+)%.[^%.]+$")\match("(.-)[^%.]+$") .. ".base.Child"

class Text extends Child
	new: (value, ...) =>
		super(...)
		@setState({"value":value})

	draw: () =>
		super\draw!
		with love.graphics
			.push!
			.translate(@px, @py)
			.print(@state.value or "", 0, 0)
			.pop!

return Text