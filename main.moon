cui = require 'cui'

love.load = () ->
	os.execute("clear")
	cui.load!
	export circle = love.graphics.newImage "circle.png"

	export Infobar = cui.View 100, 100, 600, 200, {
		-- cui.Row {4,4,4}, {
		-- 	-- cui.Child "child1"
		-- 	-- cui.Child "child2"
		-- 	-- cui.Child "child3"
		-- }, "mainrow"
	}, "infobar", true

	-- print inspect Infobar.pool["child"]

love.update = (dt) ->
	cui.update(dt)
	require("lovebird").update()

love.draw = () ->
	Infobar\draw()
	-- love.graphics.setBackgroundColor(0.2,0.2,0.2,1)
	-- love.graphics.draw(circle, 0, 0)