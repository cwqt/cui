local Style
do
  local _class_0
  local _base_0 = {
    returnAsStyle = function(self)
      return self.settings
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, settings)
      if settings.margin then
        settings.m = settings.margin
        settings.margin = nil
      end
      if settings.padding then
        settings.p = settings.padding
        settings.padding = nil
      end
      if settings.font_family then
        local font_object = settings.font_family
        local f = font_object:generateNewSize(settings.font_size or 16, settings.font_style or nil)
        settings.font = f
      end
      self.settings = settings
    end,
    __base = _base_0,
    __name = "Style"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Style = _class_0
end
return Style
