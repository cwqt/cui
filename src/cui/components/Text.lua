local Child = require((...):match("(.+)%.[^%.]+$"):match("(.-)[^%.]+$") .. ".base.Child")
local Text
do
  local _class_0
  local _parent_0 = Child
  local _base_0 = {
    draw = function(self)
      return love.graphics.print(self.state.value or "", 0, 0)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, value, ...)
      _class_0.__parent.__init(self, ...)
      return self:setState({
        ["value"] = value
      })
    end,
    __base = _base_0,
    __name = "Text",
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
  Text = _class_0
end
return Text
