local Font
do
  local _class_0
  local _base_0 = {
    generateNewSize = function(self, size, fontStyle)
      if not fontStyle then
        return love.graphics.newFont(self.filename, size)
      end
      for k, font in pairs(self.fallbacks) do
        if fontStyle == k then
          return love.graphics.newFont(self.fallbacks[fontStyle], size)
        end
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, filename, fallbacks)
      self.filename, self.fallbacks = filename, fallbacks
    end,
    __base = _base_0,
    __name = "Font"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Font = _class_0
end
return Font
