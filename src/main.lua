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
  circle = love.graphics.newImage("circle.png")
  Infobar = cui.Container({
    30,
    30,
    600,
    200
  }, {
    cui.Row({
      2,
      4,
      4,
      2
    }, {
      cui.Child("StartChild"),
      cui.Child("Child2"),
      cui.Column({
        4,
        4,
        4
      }, {
        cui.Child("Child3"),
        cui.Child("Child4"),
        cui.Row({
          6,
          6
        }, {
          cui.Child("Child5"),
          cui.Child("Child6")
        }, "BottomRow")
      }, "Column"),
      cui.Child("EndChild")
    }, "MainRow")
  })
  local Helvetica = cui.Font("Roboto.ttf")
  local BigText = cui.Style({
    ["font-family"] = Helvetica,
    ["font-size"] = 40,
    ["font-color"] = {
      1,
      1,
      0,
      1
    },
    ["background-color"] = {
      1,
      1,
      1,
      1
    },
    ["margin"] = {
      10,
      20,
      30,
      40
    },
    ["padding"] = {
      5,
      5,
      5,
      5
    }
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
      cui.Column({
        6,
        4
      }, {
        (function()
          do
            local _with_0 = cui.Text("Hello World!", "title")
            _with_0:applyStyle(BigText)
            return _with_0
          end
        end)(),
        cui.Child()
      }, "left"),
      cui.Child(),
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
end
love.update = function(dt)
  return require("lovebird").update()
end
love.mousemoved = function(x, y, dx, dy)
  Infobar:mousemoved(x, y)
  return Infobar2:mousemoved(x, y)
end
love.mousepressed = function(x, y, button)
  return Infobar:mousepressed(x, y, button)
end
love.keypressed = function(k)
  Infobar:keypressed(k)
  local _exp_0 = k
  if "q" == _exp_0 then
    return love.event.quit()
  end
end
love.draw = function()
  Infobar:draw()
  local mx, my = love.mouse.getPosition()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print(tostring(mx) .. ", " .. tostring(my), mx + 10, my - 10)
  return Infobar2:draw()
end
