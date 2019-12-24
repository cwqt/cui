local Container = require((...):match("(.+)%.[^%.]+$") .. ".Container")
local Column
do
  local _class_0
  local _parent_0 = Container
  local _base_0 = {
    instantiate = function(self)
      _class_0.__parent.instantiate(self)
      self.w = self.parent.w
      self.h = self.parent.h
      if self.parent.__class.__name == "Row" then
        self.w = (self.parent.w / 12) * self.parent.childDimensions[self.key]
      end
      if self.parent.__class.__name == "Column" then
        self.h = (self.parent.h / 12) * self.parent.childDimensions[self.key]
      end
      local sy = 0
      for k, child in pairs(self.children) do
        child.parent = self
        child.w = self.w
        child.h = (self.h / 12) * self.childDimensions[k]
        child.y = sy
        sy = sy + child.h
        child:instantiate()
      end
    end,
    draw = function(self)
      return _class_0.__parent.draw(self)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, childDimensions, ...)
      self.childDimensions = childDimensions
      return _class_0.__parent.__init(self, nil, ...)
    end,
    __base = _base_0,
    __name = "Column",
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
  Column = _class_0
end
return Column
