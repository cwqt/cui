class Generic
	new: (dimensions, @id) =>
		@x, @y, @w, @h = unpack(dimensions or {0,0,0,0})
		@isParent = false
		@state = {
			hover: false
		}
		@style = {
			m: {10,10,10,10},
			p: {10,10,10,10},
		}
		@events = {
			["mouseEnter"]: 	{
				(x,y) -> print("enter", @id or @@.__name, x, y)
				(x,y) -> @setState({"hover":true})
			}
			["mouseExit"]:  	{
				(x,y) -> print("exit", @id or @@.__name, x, y)
				(x,y) -> @setState({"hover":false})
				(x,y) -> @drillState({"hover":false})
			}
			["mouseMoved"]:  	{}
			["mousePressed"]: {}
			["keyPressed"]:  	{}
			["keyReleased"]: 	{}
		}

	drillState: (state) =>
		if @isParent
			for k, child in pairs(@children)
				if child.isParent
					@setState(state)
					child\drillState(state)
				else
					child\setState(state)

	getWorldPosition: () =>
		f = (x, y, currentNode) ->
			parent = currentNode.parent
			-- print currentNode.__class.__name\sub(1,4), currentNode.x, currentNode.y
			if parent 
				f(x+parent.x, y+parent.y, parent)
			else
				if currentNode.__class.__name == "Container"
					return x, y

		return f(@x, @y, self)

	draw: () =>
		with love.graphics
			.push!
			.translate(@x, @y)
			.setColor(1,1,1,.5)
			.rectangle("line", 0, 0, @w, @h)
			if @state.hover
				.setColor(1,1,1,0.1)
				.rectangle("fill", 0, 0, @w, @h)
			if @@.__name == "Child"
				.print(@@.__name .. " " .. tostring(@id) .. "\n #{math.ceil @x}, #{math.ceil @y}", 0,0)
			.pop!

	instantiate: () =>
		if @id and @parent then @parent[@id] = self

	detectHover: (x=@x, y=@y, w=@w, h=@h) =>
		mx, my = love.mouse.getPosition()
		
		x, y = @getWorldPosition()
		if x <= mx and mx <= x+w and y <= my and my <= y+h
			if @state.hover == false
				for f in *@events["mouseEnter"] do f(x,y)
			return true

		if @state.hover == true
			for f in *@events["mouseExit"] do f(x,y)
		return false

	update: () =>
	mousepressed: () =>
	mousemoved: () =>
	keypressed: () =>
	keyreleased: () =>
	applyStyle: () =>

	setState: (newState) =>
		-- print inspect newState
		for key, value in pairs(newState) do
			@state[key] = value


return Generic