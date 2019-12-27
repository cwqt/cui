Child = require (...)\match("(.+)%.[^%.]+$")\match("(.-)[^%.]+$") .. ".base.Child"

class Image extends Child
  new: (src, ...) =>
    super(...)
    @image = love.graphics.newImage(src)
    @sx, @sy = 1, 1
    @ox, @oy = 0, 0
    @iw, @ih = @image\getDimensions!
    @aspect_ratio = @iw/@ih
    @applyDefaultStyle({
      overflow: "hidden",
      object_fit: "fill",
      object_position: "center",
    })

  instantiate: () =>
    super\instantiate!
    switch @getStyle("object_fit")
      when "fill"       -- scale image to dimensions in w & h
        @sx = @pw/@iw
        @sy = @ph/@ih
      when "contain" -- fit to height, maintain aspect ratio
        @sx = @pw/@iw
        @sy = @sx
      when "cover"   -- fit to width, maintain aspect ratio
        @sy = @ph/@ih
        @sx = @sy

    tw, th = @iw*@sx, @ih*@sy
    pos = @getStyle("object_position")
    posx, posy = pos\match("([^%s]+)%s([^%s]+)")
    if posx == nil and posy == nil then posx, posy = pos, pos

    switch posx
      when "left"
        @ox = 0
      when "right"
        @ox = @pw - tw
      when "center"
        @ox = (@pw/2)-(tw/2)

    switch posy
      when "top"
        @oy = 0  
      when "bottom"
        @oy = @ph - th
      when "center"
        @oy = (@ph/2)-(th/2)

  draw: () =>
    super\draw!
    with love.graphics
      .push!
      .translate(@px+@ox, @py+@oy)
      .scale(@sx,@sy)
      .draw(@image, 0,0)
      .pop!

      .push!
      .translate(@px, @py+@ph-15)
      .print(@getStyle("object_fit"), 5, 0)
      .pop!

return Image