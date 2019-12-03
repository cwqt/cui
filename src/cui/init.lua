local PATH = ...
local inspect = require(PATH .. '.libs.inspect')
local lume = require(PATH .. '.libs.lume')
local M = require(PATH .. '.libs.moses')
local Timer = require(PATH .. '.libs.timer')
local deep = require(PATH .. '.libs.deep')
local cui = {
  _VERSION = 'cui v1.0.0',
  _DESCRIPTION = 'practical oo löve ui library',
  _URL = 'https://gitlab.com/cxss/cui',
  _LICENSE = 'mit'
}
cui.load = function()
  love.window.setMode(1280, 720, {
    highdpi = true
  })
  cui.Timer = Timer()
end
cui.update = function(dt)
  return cui.Timer:update(dt)
end
local Generic
do
  local _class_0
  local _base_0 = {
    activate = function(self)
      self.active = true
      return print(inspect(self, {
        depth = 2
      }))
    end,
    update = function(self, dt)
      if not self.active then
        return 
      end
    end,
    draw = function(self)
      if not self.active then
        return 
      end
    end,
    destroy = function(self) end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, id)
      self.id = id
      self.active = false
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
local Container
do
  local _class_0
  local _parent_0 = Generic
  local _base_0 = {
    update = function(self, dt)
      return _class_0.__parent.update(self)
    end,
    draw = function(self)
      return _class_0.__parent.draw(self)
    end,
    add = function(self, obj)
      obj.parent = self
      self.pool[obj.id] = obj
    end,
    remove = function(self, id)
      self.pool[id] = nil
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pool, id)
      if pool == nil then
        pool = { }
      end
      self.pool = { }
      for _, obj in pairs(pool) do
        self:add(obj)
      end
      return _class_0.__parent.__init(self, id)
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
local View
do
  local _class_0
  local _parent_0 = Container
  local _base_0 = {
    activate = function(self)
      _class_0.__parent.activate(self)
      self.m = {
        10,
        10,
        10,
        10
      }
      self.p = {
        10,
        10,
        10,
        10
      }
      self.mx, self.my = self.x + self.m[4], self.y + self.m[1]
      self.mw, self.mh = self.w - (self.m[2] + self.m[4]), self.h - (self.m[3] + self.m[1])
      self.px, self.py = self.mx + self.p[4], self.my + self.p[1]
      self.pw, self.ph = self.mw - (self.p[2] + self.p[4]), self.mh - (self.p[3] + self.p[1])
    end,
    draw = function(self)
      _class_0.__parent.draw(self)
      do
        local _with_0 = love.graphics
        _with_0.setColor(1, 1, 1, 1)
        _with_0.push()
        _with_0.translate(self.x, self.y)
        _with_0.rectangle("line", 0, 0, self.w, self.h)
        _with_0.push()
        _with_0.translate(self.m[4], self.m[1])
        _with_0.rectangle("line", 0, 0, self.mw, self.mh)
        _with_0.push()
        _with_0.translate(self.p[4], self.p[1])
        _with_0.rectangle("line", 0, 0, self.pw, self.ph)
        for i = 1, 3 do
          _with_0.pop()
        end
        return _with_0
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, x, y, w, h, pool, id)
      if pool == nil then
        pool = { }
      end
      self.x, self.y, self.w, self.h = x, y, w, h
      return _class_0.__parent.__init(self, pool, id)
    end,
    __base = _base_0,
    __name = "View",
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
  View = _class_0
end
local Row
do
  local _class_0
  local _parent_0 = Container
  local _base_0 = {
    draw = function(self) end,
    update = function(self, dt) end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, itemWidths, pool, id)
      self.itemWidths = itemWidths
      return _class_0.__parent.__init(self, pool, id)
    end,
    __base = _base_0,
    __name = "Row",
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
  Row = _class_0
end
local Child
do
  local _class_0
  local _parent_0 = Generic
  local _base_0 = {
    draw = function(self)
      love.graphics.setColor(0, 0, 0, 1)
      return love.graphics.printf("hello", 0, 0, 10)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, id)
      return _class_0.__parent.__init(self, id)
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
cui.Generic = Generic
cui.View = View
cui.Row = Row
cui.Column = Column
cui.Child = Child
return cui
