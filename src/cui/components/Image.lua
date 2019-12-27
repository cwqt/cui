local Child = require((...):match("(.+)%.[^%.]+$"):match("(.-)[^%.]+$") .. ".base.Child")
local Image
do
  local _class_0
  local _parent_0 = Child
  local _base_0 = {
    instantiate = function(self)
      _class_0.__parent.instantiate(self)
      local _exp_0 = self:getStyle("object_fit")
      if "fill" == _exp_0 then
        self.sx = self.pw / self.iw
        self.sy = self.ph / self.ih
      elseif "contain" == _exp_0 then
        self.sx = self.pw / self.iw
        self.sy = self.sx
      elseif "cover" == _exp_0 then
        self.sy = self.ph / self.ih
        self.sx = self.sy
      end
      local tw, th = self.iw * self.sx, self.ih * self.sy
      local pos = self:getStyle("object_position")
      local posx, posy = pos:match("([^%s]+)%s([^%s]+)")
      if posx == nil and posy == nil then
        posx, posy = pos, pos
      end
      local _exp_1 = posx
      if "left" == _exp_1 then
        self.ox = 0
      elseif "right" == _exp_1 then
        self.ox = self.pw - tw
      elseif "center" == _exp_1 then
        self.ox = (self.pw / 2) - (tw / 2)
      end
      local _exp_2 = posy
      if "top" == _exp_2 then
        self.oy = 0
      elseif "bottom" == _exp_2 then
        self.oy = self.ph - th
      elseif "center" == _exp_2 then
        self.oy = (self.ph / 2) - (th / 2)
      end
    end,
    draw = function(self)
      _class_0.__parent.draw(self)
      do
        local _with_0 = love.graphics
        _with_0.push()
        _with_0.translate(self.px + self.ox, self.py + self.oy)
        _with_0.scale(self.sx, self.sy)
        _with_0.draw(self.image, 0, 0)
        _with_0.pop()
        _with_0.push()
        _with_0.translate(self.px, self.py + self.ph - 15)
        _with_0.print(self:getStyle("object_fit"), 5, 0)
        _with_0.pop()
        return _with_0
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, src, ...)
      _class_0.__parent.__init(self, ...)
      self.image = love.graphics.newImage(src)
      self.sx, self.sy = 1, 1
      self.ox, self.oy = 0, 0
      self.iw, self.ih = self.image:getDimensions()
      self.aspect_ratio = self.iw / self.ih
      return self:applyDefaultStyle({
        overflow = "hidden",
        object_fit = "fill",
        object_position = "center"
      })
    end,
    __base = _base_0,
    __name = "Image",
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
  Image = _class_0
end
return Image
