io.stdout:setvbuf("no")
cui = require('cui')
inspect = require('cui.libs.inspect')
love.load = function()
  os.execute("clear")
  print("cui\n")
  love.window.setMode(660, 260, {
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
end
love.update = function(dt)
  return require("lovebird").update()
end
love.mousemoved = function(x, y, dx, dy)
  return Infobar:mousemoved(x, y)
end
love.keypressed = function(k)
  local _exp_0 = k
  if "q" == _exp_0 then
    return love.event.quit()
  end
end
love.draw = function()
  Infobar:draw()
  local mx, my = love.mouse.getPosition()
  love.graphics.setColor(1, 1, 1, 1)
  return love.graphics.print(tostring(mx) .. ", " .. tostring(my), mx + 10, my - 10)
end
