HalfPI    = Math.PI / 2
Tau       = Math.PI * 2
TauDiv360 = Tau / 360

polarToCart = (r, theta) ->
  [ r * Math.cos theta
    r * Math.sin theta ]

toRadians = (degrees) -> TauDiv360 * degrees

class Simulator
  constructor: (@root = window) ->
    { @document } = @root
    { @body } = @document
    @document
      .getElementsByTagName 'title'
      [0]
      .innerText = title

    @createElement = (args...) => @document.createElement args...

    @canvas = @createElement 'canvas'
    @canvas.onclick = => @toggleRunning()
    @ctx = @canvas.getContext '2d'
    @body.appendChild @canvas

    @resize()
    @root.onresize = => @resize()

  start: ->
    @running = true
    @animate()

  toggleRunning: =>
    if @running
      @stop()
    else
      @start()

  restart: ->
    @stop()
    @start()

  stop: ->
    @running = false

    if @animationRequest
      id = @animationRequest
      @animationRequest = null
      @root.cancelAnimationFrame id

  animate: ->
    return unless @running

    @animationRequest ?= @root.requestAnimationFrame =>
      @tick++
      @animationRequest = null
      @iterate()
      @drawFrame()

      @animate()

  resize: ->
    { innerWidth: @width, innerHeight: @height } = @root
    @mx = @width  / 2
    @my = @height / 2

    Object.assign @canvas, { @width, @height }

  clearFrame: (color) ->
    @ctx.fillStyle   =
    @ctx.strokeStyle = color
    @ctx.fillRect 0, 0, @width, @height

  drawCircle: (x, y, radius, color) ->
    @ctx.fillStyle   =
    @ctx.strokeStyle = color
    @ctx.beginPath()
    @ctx.arc x, y, radius, 0, Tau
    @ctx.fill()


class Worm extends Simulator
  constructor: (args...) ->
    super args...

    @length = 64
    @vel    = 5
    @radius = 10
    @turnSpeed = (Tau / 360) * 30

    {mx: x, my: y} = @
    @segments  = [1..@length].map -> {x, y}
    @dir       = Math.random() * Tau
    @shadeStep = 127 / @length

  iterate: ->
    @dir += (Math.random() - 0.5) * @turnSpeed

    @dir -= Tau if @dir >  Math.PI
    @dir += Tau if @dir < -Math.PI

    [dx, dy] = polarToCart @vel, @dir

    {x, y} = @segments[0]
    x = (x + dx + @width)  % @width
    y = (y + dy + @height) % @height

    @segments.unshift {x, y}
    @segments.pop()

  resize: ->
    super arguments...

    @clearFrame 'rgb(128,32,0)'

  drawFrame: ->
    for {x, y}, i in @segments[..-3]
      c = Math.floor ((@length - i) * @shadeStep + 128)
      @drawCircle x, y, @radius, color = "rgb(#{[c, c, c].join ','}"

    tail = @segments[-2..]
    {x, y} = tail[1]; @drawCircle x, y, @radius, 'black'
    {x, y} = tail[0]; @drawCircle x, y, @radius, color

Object.assign window, {Simulator, Worm}

(window.worm = new Worm).start()
