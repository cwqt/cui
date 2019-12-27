class Generic
	new: (dimensions, @id) =>
		@x, @y, @w, @h = unpack(dimensions or {0,0,0,0})
		@isParent = false
		@state = {
			hover: false
		}
		@style = {
			__default: {
				m: 					{3,3,3,3},
				p: 					{6,6,6,6},
				background_color: {0,0,0,0},
				overflow: "visible"
			}
		}
		@events = {
			["mouseenter"]: 	{
				(x,y) -> print("enter", @id or @@.__name, x, y)
				(x,y) -> @setState({"hover":true})
			}
			["mouseexit"]:  	{
				(x,y) -> print("exit", @id or @@.__name, x, y)
				(x,y) -> @setState({"hover":false})
				(x,y) -> @drillState({"hover":false})
			}
			["mousemoved"]:  	{}
			["mousepressed"]: {
				(x,y,button) -> print("click", @id or @@.__name, button, x, y)
			}
			["keypressed"]:  	{
				(k) -> print("press", @id or @@.__name, k)
			}
			["keyreleased"]: 	{}
		}

	drillState: (state) =>
		if @isParent
			for k, child in pairs(@children)
				if child.isParent
					@setState(state)
					child\drillState(state)
				else
					child\setState(state)
		@setState(state)			

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
			.setScissor()
			.translate(@x, @y)
			.setColor(1,1,1,.5)
			.rectangle("line", 0, 0, @w, @h)
			if @state.hover
				.setColor(1,1,1,0.1)
				.rectangle("fill", 0, 0, @w, @h)
				.setColor(1,1,1,1)
			if @@.__name == "Child"
				.print(@@.__name .. " " .. tostring(@id) .. "\n #{math.ceil @x}, #{math.ceil @y}", 0,0)
			.pop!

	instantiate: () =>
		-- if @id and @parent then @parent[@id] = self

	detectHover: (x=@x, y=@y, w=@w, h=@h) =>
		mx, my = love.mouse.getPosition()
		
		x, y = @getWorldPosition()
		if x <= mx and mx <= x+w and y <= my and my <= y+h
			if @state.hover == false
				for f in *@events["mouseenter"] do f(x,y)
			return true

		if @state.hover == true
			for f in *@events["mouseexit"] do f(x,y)
		return false

	update: (dt) =>

	mousepressed: (x,y,button) =>
		for _, event in pairs(@events["mousepressed"]) do event(x,y,button)

	mousemoved: (x,y,dx,dy) =>
		@detectHover!
		for _, event in pairs(@events["mousemoved"]) do event(x,y,dx,dy)

	keypressed: (k) =>
		for _, event in pairs(@events["keypressed"]) do event(k)

	keyreleased: (k) =>
		for _, event in pairs(@events["keyreleased"]) do event(k)

	applyStyle: (style) =>
		print inspect style
		for k, v in pairs(style) do @style[k] = v

	applyDefaultStyle: (style) =>
		for k,v in pairs(style) do @style.__default[k] = v

	getStyle: (key) =>
		return @style[key] or @style.__default[key]

	setState: (newState) =>
		-- print inspect newState
		for key, value in pairs(newState) do
			@state[key] = value

	addEventListener: (event, f, id) =>
		hasEvent = false
		for k,v in pairs(@events) do if @events[event] then hasEvent = true
		assert(hasEvent, "No such event listener: #{event}")

		if id
			@events[event][id] = f
		else
			table.insert(@events[event], f)

	removeEventListener: (eventType, id) =>
		if @events[eventType][id] then
			@events[eventType][id] = nil


return Generic