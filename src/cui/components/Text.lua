local Child = require((...):match("(.+)%.[^%.]+$"):match("(.-)[^%.]+$") .. ".base.Child")
local Text
do
  local _class_0
  local _parent_0 = Child
  local _base_0 = {
    instantiate = function(self)
      _class_0.__parent.instantiate(self)
      self.executionStack = self:parseString(self.state.rawString)
    end,
    parseString = function(self, rawString)
      local executionStack = { }
      local words = { }
      for a in rawString:gsub('%b<>', '\0%0\0'):gmatch('%Z+') do
        table.insert(words, a)
      end
      local sx, sy = 0, 0
      local currentFont = self:getStyle("font")
      local charHeight = currentFont:getHeight(" ")
      local positions = { }
      for k, word in pairs(words) do
        if word:match("<.+>") then
          if self.tags[word] then
            table.insert(executionStack, self.tags[word])
          end
        else
          positions[k] = {
            x = sx,
            y = sy
          }
          local ex, key, overflow = 0, 0, false
          for character in word:gmatch(".") do
            key = key + 1
            ex = ex + currentFont:getWidth(character)
            if sx + ex > self.pw then
              local splittedStr = word:sub(key)
              words[k] = word:sub(0, key - 1)
              if self:getStyle("word_wrap") == "break_word" then
                for i = key, 1, -1 do
                  if word:sub(i, i) == " " then
                    splittedStr = word:sub(i + 1)
                    words[k] = words[k]:sub(0, i)
                    break
                  end
                end
              end
              table.insert(words, k + 1, splittedStr)
              sx, sy = 0, sy + (charHeight * self:getStyle("line_height"))
              overflow = true
              break
            end
          end
          positions[k].x = positions[k].x + self:getStyle("char_offsetx")
          positions[k].y = positions[k].y + self:getStyle("char_offsety")
          table.insert(executionStack, function()
            return love.graphics.print(words[k], positions[k].x, positions[k].y)
          end)
          if not overflow then
            sx = sx + currentFont:getWidth(word)
          end
        end
      end
      return executionStack
    end,
    draw = function(self)
      _class_0.__parent.draw(self)
      do
        local _with_0 = love.graphics
        _with_0.push()
        _with_0.translate(self.px, self.py)
        _with_0.setFont(self:getStyle("font"))
        for k, v in pairs(self.executionStack) do
          v()
        end
        _with_0.pop()
        _with_0.setFont(self.style.__default.font)
        return _with_0
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, rawString, ...)
      _class_0.__parent.__init(self, ...)
      self:setState({
        ["rawString"] = rawString
      })
      self.executionStack = { }
      self.tags = {
        ["<red>"] = function()
          return love.graphics.setColor(1, 0, 0, 1)
        end,
        ["</red>"] = function()
          return love.graphics.setColor(self:getStyle("font_color"))
        end,
        ["<green>"] = function()
          return love.graphics.setColor(0, 1, 0, 1)
        end,
        ["</green>"] = function()
          return love.graphics.setColor(self:getStyle("font_color"))
        end
      }
      return self:applyDefaultStyle({
        font = love.graphics.getFont(),
        font_color = {
          1,
          1,
          1,
          1
        },
        line_height = 1,
        text_align = "left",
        char_offsetx = 0,
        char_offsety = 0
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
