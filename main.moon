io.stdout\setvbuf("no")

export cui = require 'cui'
export inspect = require 'cui.libs.inspect'

love.load = () ->
	os.execute("clear")
	print("cui\n")
	love.window.setMode(660, 490, {highdpi:true, x:400, y:300})

	-- export Infobar = cui.Container {30, 30, 600, 200}, {
	-- 	cui.Row {2,4,4,2}, {
	-- 		cui.Child "StartChild"
	-- 		cui.Child "Child2"
	-- 		cui.Column({4,4,4}, {
	-- 			cui.Child "Child3"
	-- 			cui.Child "Child4"		
	-- 			cui.Row({6,6}, {
	-- 				cui.Child "Child5"
	-- 				cui.Child "Child6"			
	-- 			}, "BottomRow")
	-- 		}, "Column")
	-- 		cui.Child "EndChild"
	-- 	}, "MainRow"
	-- }
	export Infobar = cui.Container {30,30,600,200}, {
		cui.Row {3,2,3,4}, {
			with cui.Image "assets/seacow.jpg"
				\applyStyle({object_fit:"fill"})
			with cui.Image "assets/seacow.jpg"
				\applyStyle({object_fit:"contain"})
			with cui.Image "assets/seacow.jpg"
				\applyStyle({object_fit:"cover"})
			cui.Column {4,4,4}, {
				with cui.Image "assets/seacow.jpg"
					\applyStyle({object_fit:"fill"})
				with cui.Image "assets/seacow.jpg"
					\applyStyle({object_fit:"contain"})				
				with cui.Image "assets/seacow.jpg"
					\applyStyle({object_fit:"cover"})				
			}
		}
	}

	-- print Infobar\getAllElements!
	-- print(Infobar\getElementById("Child6"))
	-- print(Infobar\getElementByClass("Child"))

	Roboto = cui.Font("assets/Roboto.ttf", {
		bold: "assets/Roboto-Bold.ttf",
		italic: "assets/Roboto-Italic.ttf",
	})

	BigText = cui.Style({
		font_family: 	Roboto,
		font_size: 		40,
		font_style:   "bold",
		word_wrap:    "break_word",
		font_color: 	{1,1,1,1},
		char_offsety: -10,
		background_color: {.2,.2,.2,1},
	})\returnAsStyle!

	ImageFit = cui.Style({
		width: 100,
		height: 100,
	})

	export Infobar2 = cui.Container {30, 260, 600, 200}, {
		cui.Row {1,3, 4, 3,1}, {
			cui.Child!
			with cui.Text "<b><red>Hello</red></b> World! This is <green>cui!</green>", "title"
				\applyStyle(BigText)
			-- cui.Image "assets/seacow.jpg"
			cui.Column {6,4}, {
				cui.Child!
				cui.Child!			
			}
			cui.Child!			
		}, "main-row"
	}

	x = Infobar2\getElementById("title")[1]

	x\addEventListener "mousepressed", ->
		r,g,b = math.random(100)/100, math.random(100)/100, math.random(100)/100
		x\applyStyle({"background-color":{r,g,b}})

	-- x\addEventListener "keypressed",
	-- 	(k) -> x\setState({"value":x\getState("value") .. k}),
	-- 	"hello"

	-- x\addEventListener "keypressed",
	-- 	(k) -> if k == "escape" then x\removeEventListener("keypressed", "hello")


love.update = (dt) ->
	require("lovebird").update()

love.mousemoved = (x, y, dx, dy) ->
	Infobar\mousemoved(x, y)
	Infobar2\mousemoved(x, y)

love.mousepressed = (x,y,button) ->
	Infobar\mousepressed(x,y,button)
	Infobar2\mousepressed(x, y, button)

love.keypressed = (k) ->
	Infobar\keypressed(k)
	Infobar2\keypressed(k)

	switch k
		when "q"
			love.event.quit!

love.draw = () ->
	stats = love.graphics.getStats!
	love.graphics.print("draws: #{stats.drawcalls}, txtmem: #{stats.texturememory/1024}kB, imgs: #{stats.images}, fnts: #{stats.fonts}, rawmem: #{math.floor(collectgarbage('count'))}kB", 10, 3)

	Infobar\draw()
	Infobar2\draw()

	mx, my = love.mouse.getPosition()
	love.graphics.setColor(1,1,1,1)
	love.graphics.print("#{mx}, #{my}", mx+10, my-10)
	-- love.graphics.setBackgroundColor(0.2,0.2,0.2,1)
	-- love.graphics.draw(circle, 0, 0)