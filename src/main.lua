io.stdout:setvbuf("no")
cui = require('cui')
inspect = require('cui.libs.inspect')
love.load = function()
  os.execute("clear")
  print("cui\n")
  love.window.setMode(660, 490, {
    highdpi = true,
    x = 400,
    y = 300
  })
  Infobar = cui.Container({
    30,
    30,
    600,
    200
  }, {
    cui.Row({
      3,
      2,
      3,
      4
    }, {
      (function()
        do
          local _with_0 = cui.Image("assets/seacow.jpg")
          _with_0:applyStyle({
            object_fit = "fill"
          })
          return _with_0
        end
      end)(),
      (function()
        do
          local _with_0 = cui.Image("assets/seacow.jpg")
          _with_0:applyStyle({
            object_fit = "contain"
          })
          return _with_0
        end
      end)(),
      (function()
        do
          local _with_0 = cui.Image("assets/seacow.jpg")
          _with_0:applyStyle({
            object_fit = "cover"
          })
          return _with_0
        end
      end)(),
      cui.Column({
        4,
        4,
        4
      }, {
        (function()
          do
            local _with_0 = cui.Image("assets/seacow.jpg")
            _with_0:applyStyle({
              object_fit = "fill"
            })
            return _with_0
          end
        end)(),
        (function()
          do
            local _with_0 = cui.Image("assets/seacow.jpg")
            _with_0:applyStyle({
              object_fit = "contain"
            })
            return _with_0
          end
        end)(),
        (function()
          do
            local _with_0 = cui.Image("assets/seacow.jpg")
            _with_0:applyStyle({
              object_fit = "cover"
            })
            return _with_0
          end
        end)()
      })
    })
  })
  local Roboto = cui.Font("assets/Roboto.ttf", {
    bold = "assets/Roboto-Bold.ttf",
    italic = "assets/Roboto-Italic.ttf"
  })
  local BigText = cui.Style({
    font_family = Roboto,
    font_size = 40,
    font_style = "bold",
    word_wrap = "break_word",
    font_color = {
      1,
      1,
      1,
      1
    },
    char_offsety = -10,
    background_color = {
      .2,
      .2,
      .2,
      1
    }
  }):returnAsStyle()
  local ImageFit = cui.Style({
    width = 100,
    height = 100
  })
  Infobar2 = cui.Container({
    30,
    260,
    600,
    200
  }, {
    cui.Row({
      1,
      3,
      4,
      3,
      1
    }, {
      cui.Child(),
      (function()
        do
          local _with_0 = cui.Text("<b><red>Hello</red></b> World! This is <green>cui!</green>", "title")
          _with_0:applyStyle(BigText)
          return _with_0
        end
      end)(),
      cui.Column({
        6,
        4
      }, {
        cui.Child(),
        cui.Child()
      }),
      cui.Child()
    }, "main-row")
  })
  local x = Infobar2:getElementById("title")[1]
  return x:addEventListener("mousepressed", function()
    local r, g, b = math.random(100) / 100, math.random(100) / 100, math.random(100) / 100
    return x:applyStyle({
      ["background-color"] = {
        r,
        g,
        b
      }
    })
  end)
end
love.update = function(dt)
  return require("lovebird").update()
end
love.mousemoved = function(x, y, dx, dy)
  Infobar:mousemoved(x, y)
  return Infobar2:mousemoved(x, y)
end
love.mousepressed = function(x, y, button)
  Infobar:mousepressed(x, y, button)
  return Infobar2:mousepressed(x, y, button)
end
love.keypressed = function(k)
  Infobar:keypressed(k)
  Infobar2:keypressed(k)
  local _exp_0 = k
  if "q" == _exp_0 then
    return love.event.quit()
  end
end
love.draw = function()
  local stats = love.graphics.getStats()
  love.graphics.print("draws: " .. tostring(stats.drawcalls) .. ", txtmem: " .. tostring(stats.texturememory / 1024) .. "kB, imgs: " .. tostring(stats.images) .. ", fnts: " .. tostring(stats.fonts) .. ", rawmem: " .. tostring(math.floor(collectgarbage('count'))) .. "kB", 10, 3)
  Infobar:draw()
  Infobar2:draw()
  local mx, my = love.mouse.getPosition()
  love.graphics.setColor(1, 1, 1, 1)
  return love.graphics.print(tostring(mx) .. ", " .. tostring(my), mx + 10, my - 10)
end
