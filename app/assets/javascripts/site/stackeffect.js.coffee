jQuery ->
  $(window).load ->
    $container = $("#admin-features")
    image = $("#admin-features img")
    $.each image, (i, val) ->
      if i < image.length - 1
        r = Math.floor(Math.random() * 21) - 10
        $(this).css
          "-webkit-transform": "rotate(" + r + "deg)"
          "-moz-transform": "rotate(" + r + "deg)"
          transform: "rotate(" + r + "deg)"

    $("#admin-features").bind "click", ->
      $current = $container.find("img:last")
      r = Math.floor(Math.random() * 21) - 10
      currentPositions =
        marginLeft: $current.css("margin-left")
        marginTop: $current.css("margin-top")

      $new_current = $current.prev()
      $current.animate
        marginLeft: "250px"
        marginTop: "-385px"
      , 250, ->
        $(this).insertBefore($container.find("img:first")).css(
          "-moz-transform": "rotate(" + r + "deg)"
          "-webkit-transform": "rotate(" + r + "deg)"
          transform: "rotate(" + r + "deg)"
        ).animate
          marginLeft: currentPositions.marginLeft
          marginTop: currentPositions.marginTop
        , 250, ->
          $new_current.css
            "-moz-transform": "rotate(0deg)"
            "-webkit-transform": "rotate(0deg)"
            transform: "rotate(0deg)"