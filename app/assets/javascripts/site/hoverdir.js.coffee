(($, window, undefined_) ->
  "use strict"
  $.HoverDir = (options, element) ->
    @$el = $(element)
    @_init options

  
  # OPTIONS!!
  $.HoverDir.defaults =
    speed: 300
    easing: "ease"
    hoverDelay: 0
    inverse: false

  $.HoverDir:: =
    _init: (options) ->
      
      # options
      @options = $.extend(true, {}, $.HoverDir.defaults, options)
      
      # transition properties
      @transitionProp = "all " + @options.speed + "ms " + @options.easing
      
      # support for CSS transitions
      @support = Modernizr.csstransitions
      
      # load the events
      @_loadEvents()

    _loadEvents: ->
      self = this
      @$el.on "mouseenter.hoverdir, mouseleave.hoverdir", (event) ->
        $el = $(this)
        $hoverElem = $el.find("div")
        direction = self._getDir($el,
          x: event.pageX
          y: event.pageY
        )
        styleCSS = self._getStyle(direction)
        if event.type is "mouseenter"
          $hoverElem.hide().css styleCSS.from
          clearTimeout self.tmhover
          self.tmhover = setTimeout(->
            $hoverElem.show 0, ->
              $el = $(this)
              $el.css "transition", self.transitionProp  if self.support
              self._applyAnimation $el, styleCSS.to, self.options.speed

          , self.options.hoverDelay)
        else
          $hoverElem.css "transition", self.transitionProp  if self.support
          clearTimeout self.tmhover
          self._applyAnimation $hoverElem, styleCSS.from, self.options.speed


    
    # credits : http://stackoverflow.com/a/3647634
    _getDir: ($el, coordinates) ->
      
      # the width and height of the current div
      w = $el.width()
      h = $el.height()
      
      # calculate the x and y to get an angle to the center of the div from that x and y.
      # gets the x value relative to the center of the DIV and "normalize" it
      x = (coordinates.x - $el.offset().left - (w / 2)) * ((if w > h then (h / w) else 1))
      y = (coordinates.y - $el.offset().top - (h / 2)) * ((if h > w then (w / h) else 1))
      
      # the angle and the direction from where the mouse came in/went out clockwise (TRBL=0123);
      # first calculate the angle of the point,
      # add 180 deg to get rid of the negative values
      # divide by 90 to get the quadrant
      # add 3 and do a modulo by 4  to shift the quadrants to a proper clockwise TRBL (top/right/bottom/left) **/
      direction = Math.round((((Math.atan2(y, x) * (180 / Math.PI)) + 180) / 90) + 3) % 4
      direction

    _getStyle: (direction) ->
      fromStyle = undefined
      toStyle = undefined
      slideFromTop =
        left: "0px"
        top: "-100%"

      slideFromBottom =
        left: "0px"
        top: "100%"

      slideFromLeft =
        left: "-100%"
        top: "0px"

      slideFromRight =
        left: "100%"
        top: "0px"

      slideTop = top: "0px"
      slideLeft = left: "0px"
      switch direction
        when 0
          
          # from top
          fromStyle = (if not @options.inverse then slideFromTop else slideFromBottom)
          toStyle = slideTop
        when 1
          
          # from right
          fromStyle = (if not @options.inverse then slideFromRight else slideFromLeft)
          toStyle = slideLeft
        when 2
          
          # from bottom
          fromStyle = (if not @options.inverse then slideFromBottom else slideFromTop)
          toStyle = slideTop
        when 3
          
          # from left
          fromStyle = (if not @options.inverse then slideFromLeft else slideFromRight)
          toStyle = slideLeft
      from: fromStyle
      to: toStyle

    
    # apply a transition or fallback to jquery animate based on Modernizr.csstransitions support
    _applyAnimation: (el, styleCSS, speed) ->
      $.fn.applyStyle = (if @support then $.fn.css else $.fn.animate)
      el.stop().applyStyle styleCSS, $.extend(true, [],
        duration: speed + "ms"
      )

  logError = (message) ->
    window.console.error message  if window.console

  $.fn.hoverdir = (options) ->
    instance = $.data(this, "hoverdir")
    if typeof options is "string"
      args = Array::slice.call(arguments_, 1)
      @each ->
        unless instance
          logError "cannot call methods on hoverdir prior to initialization; " + "attempted to call method '" + options + "'"
          return
        if not $.isFunction(instance[options]) or options.charAt(0) is "_"
          logError "no such method '" + options + "' for hoverdir instance"
          return
        instance[options].apply instance, args

    else
      @each ->
        if instance
          instance._init()
        else
          instance = $.data(this, "hoverdir", new $.HoverDir(options, this))

    instance
) jQuery, window