io.stdout\setvbuf("no")

export cui = require 'cui'
export inspect = require 'cui.libs.inspect'

love.load = () ->
	os.execute("clear")
	print("cui\n")
	love.window.setMode(660, 260, {highdpi:true, x:400, y:300})
	export circle = love.graphics.newImage "circle.png"

	export Infobar = cui.Container {30, 30, 600, 200}, {
		cui.Row {2,4,4,2}, {
			cui.Child "StartChild"
			cui.Child "Child2"
			cui.Column({4,4,4}, {
				cui.Child "Child3"
				cui.Child "Child4"		
				cui.Row({6,6}, {
					cui.Child "Child5"
					cui.Child "Child6"			
				}, "BottomRow")
			}, "Column")
			cui.Child "EndChild"
		}, "MainRow"
	}

	-- export Infobar = cui.Container {60,60, 540, 200}, {
	-- 	cui.Row {4,4,4}, {
	-- 		cui.Child "Child1"
	-- 		cui.Child "Child2"
	-- 		cui.Child "Child3"
	-- 	}, "MainRow"
	-- }

	-- print Infobar["MainRow"]["Child2"]\getWorldPosition!
	-- print Infobar["MainRow"]["Child3"]\getWorldPosition!

	-- Helvetica = cui.Font("Roboto.ttf")
	-- BigText = cui.Style({
	-- 	"font-family": Helvetica,
	-- 	"font-size": 40,
	-- 	"font-color": {1,1,0,1},
	-- 	"background-color": {1,1,1,1},
	-- 	"margin": {10, 20, 30, 40},
	-- 	"padding": {5,5,5,5},
	-- })

	-- export Infobar2 = cui.Container {30, 260, 600, 200}, {
	-- 	cui.Row {1,3, 4, 3,1}, {
	-- 		cui.Child!
	-- 		cui.Column {6,4}, {
	-- 			with cui.Text "Hello World!", "title"
	-- 				\applyStyle(BigText)
	-- 			cui.Child!			
	-- 		}, "left"
	-- 		cui.Child!
	-- 		cui.Column {6,4}, {
	-- 			cui.Child!
	-- 			cui.Child!			
	-- 		}
	-- 		cui.Child!			
	-- 	}, "main-row"
	-- }

	-- cui.Timer\after 2, ->
	-- 	Infobar2["main-row"]["left"]["title"]\setState({"value":"Changed!"})


love.update = (dt) ->
	require("lovebird").update()

love.mousemoved = (x, y, dx, dy) ->
	Infobar\mousemoved(x, y)
	-- Infobar2\mousemoved(x, y)

love.keypressed = (k) ->
	switch k
		when "q"
			love.event.quit!

love.draw = () ->
	Infobar\draw()
	mx, my = love.mouse.getPosition()
	love.graphics.setColor(1,1,1,1)
	love.graphics.print("#{mx}, #{my}", mx+10, my-10)
	-- Infobar2\draw()
	-- love.graphics.setBackgroundColor(0.2,0.2,0.2,1)
	-- love.graphics.draw(circle, 0, 0)