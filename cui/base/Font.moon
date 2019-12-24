class Font
	new: (@filename) =>

	generateNewSize: (size) =>
		return love.graphics.newFont(@filename, size)

return Font