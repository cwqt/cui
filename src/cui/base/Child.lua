local Generic = require((...):match("(.+)%.[^%.]+$") .. ".Generic")
local accepted_styles = {
  "margin",
  "padding",
  "background-color"
}
local Child
do
  local _class_0
  local _parent_0 = Generic
  local _base_0 = {
    instantiate = function(self)
      _class_0.__parent.instantiate(self)
      self.mx = self.x + self.style.m[4]
      self.my = self.y + self.style.m[1]
      self.mw = self.w - (self.style.m[2] + self.style.m[4])
      self.mh = self.h - (self.style.m[1] + self.style.m[3])
      self.px = self.mx + self.style.p[4]
      self.py = self.my + self.style.p[1]
      self.pw = self.mw - (self.style.p[2] + self.style.p[4])
      self.ph = self.mh - (self.style.p[1] + self.style.p[3])
    end,
    draw = function(self)
      _class_0.__parent.draw(self)
      do
        local _with_0 = love.graphics
        _with_0.setColor(0.5, 1, 1, 1)
        _with_0.rectangle("line", self.mx, self.my, self.mw, self.mh)
        _with_0.setColor(0.2, 1, 1, 1)
        _with_0.rectangle("line", self.px, self.py, self.pw, self.ph)
        _with_0.setColor(1, 1, 1, 1)
        _with_0.setColor(self.style["background-color"])
        _with_0.rectangle("fill", self.mx, self.my, self.mw, self.mh)
        _with_0.setColor(1, 1, 1, 1)
        return _with_0
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, nil, ...)
    end,
    __base = _base_0,
    __name = "Child",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Child = _class_0
end
return Child
