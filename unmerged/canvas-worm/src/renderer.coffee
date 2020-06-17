Tau       = Math.PI * 2
TauDiv360 = Tau / 360

polarToCartesian = (radius, angle) ->
  [ radius * Math.cos angle
    radius * Math.sin angle ]

degreesToRadians = (degrees) -> TauDiv360 * degrees

class Simulator
  constructor: (@root = window, @config = {}) ->
    @document = @root.document
    @body     = @document.body
    @tick     = 0

    @setTitle @config.title or 'A Simulation'
    @initCanvas()
    @resize()
    @root.onresize = => @resize()

  createElement: (args...) ->
    @document.createElement args...

  initCanvas: ->
    @canvas = @createElement 'canvas'
    @canvas.onclick = => @toggleRunning()
    @ctx = @canvas.getContext '2d'
    @body.appendChild @canvas

  setTitle: (title) ->
    titleElement = @document.getElementsByTagName('title')[0]
    titleElement.innerText = title

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
    if @running and not @animationRequest
      @animationRequest = @root.requestAnimationFrame =>
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
    @ctx.fillStyle   = color
    @ctx.strokeStyle = color
    @ctx.fillRect 0, 0, @width, @height

  drawCircle: (x, y, radius, color) ->
    @ctx.fillStyle   = color
    @ctx.strokeStyle = color
    @ctx.beginPath()
    @ctx.arc x, y, radius, 0, Tau
    @ctx.fill()


class Worm extends Simulator
  constructor: (args...) ->
    super args...

    @length    = 64
    @velocity  = 5
    @radius    = 10
    @turnSpeed = degreesToRadians 30

    {mx: x, my: y} = @
    @segments  = [1..@length].map -> {x, y}
    @dir       = Math.random() * Tau
    @shadeStep = 127 / @length

  iterate: ->
    @dir += (Math.random() - 0.5) * @turnSpeed

    @dir -= Tau if @dir >  Math.PI
    @dir += Tau if @dir < -Math.PI

    [dx, dy] = polarToCartesian @velocity, @dir

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

(window.worm = new Worm window, title: 'A Worm').start()
