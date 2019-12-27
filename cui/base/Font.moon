class Font
	new: (@filename, @fallbacks) =>

	generateNewSize: (size, fontStyle) =>
		if not fontStyle then return love.graphics.newFont(@filename, size)
		for k, font in pairs(@fallbacks) do
			if fontStyle == k
				return love.graphics.newFont(@fallbacks[fontStyle], size)

return Font