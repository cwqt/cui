local Generic
do
  local _class_0
  local _base_0 = {
    drillState = function(self, state)
      if self.isParent then
        for k, child in pairs(self.children) do
          if child.isParent then
            self:setState(state)
            child:drillState(state)
          else
            child:setState(state)
          end
        end
      end
    end,
    getWorldPosition = function(self)
      local f
      f = function(x, y, currentNode)
        local parent = currentNode.parent
        if parent then
          return f(x + parent.x, y + parent.y, parent)
        else
          if currentNode.__class.__name == "Container" then
            return x, y
          end
        end
      end
      return f(self.x, self.y, self)
    end,
    draw = function(self)
      do
        local _with_0 = love.graphics
        _with_0.push()
        _with_0.translate(self.x, self.y)
        _with_0.setColor(1, 1, 1, .5)
        _with_0.rectangle("line", 0, 0, self.w, self.h)
        if self.state.hover then
          _with_0.setColor(1, 1, 1, 0.1)
          _with_0.rectangle("fill", 0, 0, self.w, self.h)
        end
        if self.__class.__name == "Child" then
          _with_0.print(self.__class.__name .. " " .. tostring(self.id) .. "\n " .. tostring(math.ceil(self.x)) .. ", " .. tostring(math.ceil(self.y)), 0, 0)
        end
        _with_0.pop()
        return _with_0
      end
    end,
    instantiate = function(self)
      if self.id and self.parent then
        self.parent[self.id] = self
      end
    end,
    detectHover = function(self, x, y, w, h)
      if x == nil then
        x = self.x
      end
      if y == nil then
        y = self.y
      end
      if w == nil then
        w = self.w
      end
      if h == nil then
        h = self.h
      end
      local mx, my = love.mouse.getPosition()
      x, y = self:getWorldPosition()
      if x <= mx and mx <= x + w and y <= my and my <= y + h then
        if self.state.hover == false then
          local _list_0 = self.events["mouseEnter"]
          for _index_0 = 1, #_list_0 do
            local f = _list_0[_index_0]
            f(x, y)
          end
        end
        return true
      end
      if self.state.hover == true then
        local _list_0 = self.events["mouseExit"]
        for _index_0 = 1, #_list_0 do
          local f = _list_0[_index_0]
          f(x, y)
        end
      end
      return false
    end,
    update = function(self) end,
    mousepressed = function(self) end,
    mousemoved = function(self) end,
    keypressed = function(self) end,
    keyreleased = function(self) end,
    applyStyle = function(self) end,
    setState = function(self, newState)
      for key, value in pairs(newState) do
        self.state[key] = value
      end
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, dimensions, id)
      self.id = id
      self.x, self.y, self.w, self.h = unpack(dimensions or {
        0,
        0,
        0,
        0
      })
      self.isParent = false
      self.state = {
        hover = false
      }
      self.style = {
        m = {
          10,
          10,
          10,
          10
        },
        p = {
          10,
          10,
          10,
          10
        }
      }
      self.events = {
        ["mouseEnter"] = {
          function(x, y)
            return print("enter", self.id or self.__class.__name, x, y)
          end,
          function(x, y)
            return self:setState({
              ["hover"] = true
            })
          end
        },
        ["mouseExit"] = {
          function(x, y)
            return print("exit", self.id or self.__class.__name, x, y)
          end,
          function(x, y)
            return self:setState({
              ["hover"] = false
            })
          end,
          function(x, y)
            return self:drillState({
              ["hover"] = false
            })
          end
        },
        ["mouseMoved"] = { },
        ["mousePressed"] = { },
        ["keyPressed"] = { },
        ["keyReleased"] = { }
      }
    end,
    __base = _base_0,
    __name = "Generic"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Generic = _class_0
end
return Generic
