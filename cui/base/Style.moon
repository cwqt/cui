class Style
	new: (settings) =>
		if settings.margin
			settings.m = settings.margin
			settings.margin = nil

		if settings.padding
			settings.p = settings.padding
			settings.padding = nil

		if settings.font_family
			font_object = settings.font_family
			f = font_object\generateNewSize(settings.font_size or 16, settings.font_style or nil)
			settings.font = f

		@settings = settings

	returnAsStyle: () =>
		return @settings

return Style