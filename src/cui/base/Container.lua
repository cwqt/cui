local Generic = require((...):match("(.+)%.[^%.]+$") .. ".Generic")
local Container
do
  local _class_0
  local _parent_0 = Generic
  local _base_0 = {
    draw = function(self)
      _class_0.__parent.draw(self)
      do
        local _with_0 = love.graphics
        _with_0.push()
        _with_0.translate(self.x, self.y)
        for k, child in pairs(self.children) do
          child:draw()
        end
        _with_0.pop()
        return _with_0
      end
    end,
    mousemoved = function(self, x, y)
      self:detectHover()
      if self.state.hover then
        for k, child in pairs(self.children) do
          child:mousemoved(x, y)
        end
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, params, children, ...)
      self.children = children
      _class_0.__parent.__init(self, params, ...)
      self.isParent = true
      for k, child in pairs(self.children) do
        child.parent = self
        child.key = k
        child:instantiate()
      end
    end,
    __base = _base_0,
    __name = "Container",
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
  Container = _class_0
end
return Container
