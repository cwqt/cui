Child = require (...)\match("(.+)%.[^%.]+$")\match("(.-)[^%.]+$") .. ".base.Child"

class Text extends Child
  new: (rawString, ...) =>
    super(...)
    @setState({"rawString":rawString})
    @executionStack = {}
    @tags = {
      "<red>":  -> love.graphics.setColor(1,0,0,1)
      "</red>": -> love.graphics.setColor(@getStyle("font_color"))
      "<green>":  -> love.graphics.setColor(0,1,0,1)
      "</green>": -> love.graphics.setColor(@getStyle("font_color"))
    }
    @applyDefaultStyle({
      font:         love.graphics.getFont()
      font_color:   {1,1,1,1},
      line_height:  1,
      text_align:   "left",
      char_offsetx: 0,
      char_offsety: 0
    })
    -- print inspect @style

  instantiate: () =>
    super\instantiate!
    @executionStack = @parseString(@state.rawString)

  parseString: (rawString) =>
    executionStack = {}

    -- Split 'html' into tags and strings: {"<h1>", "Hello!", "</h1>"}
    words = {}
    for a in rawString\gsub('%b<>','\0%0\0')\gmatch('%Z+') do
      table.insert(words, a)

    -- Current sum string positions
    sx, sy = 0, 0
    currentFont = @getStyle("font")
    charHeight = currentFont\getHeight(" ")
    -- print string positions
    positions = {}
    for k, word in pairs(words) do
      -- Insert function to execution stack to alter visuals depending on tag
      if word\match("<.+>") then
        if @tags[word] then
          table.insert(executionStack, @tags[word])
      else
        -- This is going to be printed to the screen
        positions[k] = {x:sx, y:sy}

        ex, key, overflow = 0, 0, false
        for character in word\gmatch(".") do
          key += 1
          ex += currentFont\getWidth(character)
          
          if sx+ex > @pw then -- Text overflows container
            -- Split overflowed string into new line
            splittedStr = word\sub(key)
            words[k] = word\sub(0, key-1)
            if @getStyle("word_wrap") == "break_word"
              -- Split to closest previous space, "this is cui" -> "s cui" -> "is cui"
              for i=key, 1, -1 do
                if word\sub(i,i) == " " then
                  splittedStr = word\sub(i+1)
                  words[k] = words[k]\sub(0, i)
                  break

            -- insert splitted part into table for next iteration
            table.insert(words, k+1, splittedStr)
            sx, sy = 0, sy + (charHeight * @getStyle("line_height"))
            overflow = true
            break

        positions[k].x += @getStyle("char_offsetx")
        positions[k].y += @getStyle("char_offsety")
        table.insert(executionStack, -> love.graphics.print(words[k], positions[k].x, positions[k].y))
        if not overflow then sx += currentFont\getWidth(word)          

    return executionStack

  draw: () =>
    super\draw!
    with love.graphics
      .push!
      .translate(@px, @py)
      .setFont(@getStyle("font"))
      for k,v in pairs(@executionStack) do v()
      .pop!
      .setFont(@style.__default.font)


return Text