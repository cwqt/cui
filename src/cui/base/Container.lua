local Generic = require((...):match("(.+)%.[^%.]+$") .. ".Generic")
local Container
do
  local _class_0
  local _parent_0 = Generic
  local _base_0 = {
    update = function(self, dt)
      _class_0.__parent.update(self, dt)
      local _list_0 = self.children
      for _index_0 = 1, #_list_0 do
        local child = _list_0[_index_0]
        child:update(dt)
      end
    end,
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
    getChildren = function(self)
      return self.children
    end,
    getAllElements = function(self)
      local t = { }
      local f
      f = function(node)
        if node.isParent then
          for _, child in pairs(node.children) do
            f(child)
          end
        end
        return table.insert(t, node)
      end
      f(self)
      return t
    end,
    getElementById = function(self, id)
      local t = { }
      local e = self:getAllElements()
      for _index_0 = 1, #e do
        local child = e[_index_0]
        if child.id == id then
          t[#t + 1] = child
        end
      end
      return t
    end,
    mousepressed = function(self, x, y, button)
      for k, child in pairs(self.children) do
        child:mousepressed(x, y, button)
      end
    end,
    mousemoved = function(self, x, y)
      _class_0.__parent.mousemoved(self, x, y)
      if self.state.hover then
        local _list_0 = self.children
        for _index_0 = 1, #_list_0 do
          local child = _list_0[_index_0]
          child:mousemoved(x, y)
        end
      end
    end,
    mousepressed = function(self, x, y, button)
      _class_0.__parent.mousepressed(self, x, y, button)
      if self.state.hover then
        local _list_0 = self.children
        for _index_0 = 1, #_list_0 do
          local child = _list_0[_index_0]
          if child.state.hover then
            child:mousepressed(x, y, button)
          end
        end
      end
    end,
    keypressed = function(self, k)
      _class_0.__parent.keypressed(self, k)
      if self.state.hover then
        local _list_0 = self.children
        for _index_0 = 1, #_list_0 do
          local child = _list_0[_index_0]
          if child.state.hover or self.selectedElement == child then
            child:keypressed(k)
          end
        end
      end
    end,
    keyreleased = function(self, k)
      _class_0.__parent.keyreleased(self, k)
      if self.state.hover then
        local _list_0 = self.children
        for _index_0 = 1, #_list_0 do
          local child = _list_0[_index_0]
          if child.state.hover or self.selectedElement == child then
            child:keyreleased(k)
          end
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
      self.selectedElement = nil
      if self.__class.__name == "Container" then
        for k, child in pairs(self.children) do
          child.parent = self
          child.key = k
          child:instantiate()
        end
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
