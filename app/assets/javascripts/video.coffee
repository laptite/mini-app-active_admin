window.video =

  player:   '#main-player'
  big_play: '.vjs-big-play-button'

  init: ->
    if navigator.userAgent.indexOf('Windows') != -1
      videojs.options.techOrder = ['flash', 'html5']
    $(document).on 'click', video.big_play, video.toggle_play
    video.center_video()

  active: ->
    $(video.big_play).removeClass('idle')

  inactive: ->
    $(video.big_play).addClass('idle')

  center_video: ->
    video.resize_timer()

    $(video.player).bind 'loadeddata', (e) ->
      horizontal_margin = ( $('video').width() - $('.videocontent').width() ) / 2
      $('video').css( { "margin-left": -horizontal_margin } )

  loaded: ->
    if $(video.player).length
      video.video().on 'useractive', video.active
      video.video().on 'userinactive', video.inactive

  resize_timer: ->
    resizeTimer = undefined
    $(window).on 'resize', ->
      if !resizeTimer
        resizeTimer = setTimeout((->
          $(window).trigger 'afterResize'
          resizeTimer = null
          return
        ), 500)

  video: -> videojs(video.player)

  toggle_play: ->
    if $(video.player).hasClass('vjs-playing')
      video.video().pause()
    else
      video.video().play()

$(window).load video.loaded