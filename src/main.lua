local cui = require('cui')
love.load = function()
  os.execute("clear")
  cui.load()
  circle = love.graphics.newImage("circle.png")
  Infobar = cui.View(100, 100, 600, 200, { }, "infobar", true)
end
love.update = function(dt)
  cui.update(dt)
  return require("lovebird").update()
end
love.draw = function()
  return Infobar:draw()
end
