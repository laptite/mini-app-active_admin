initialize =
  objects: ->
    inited = []
    $('[data-init]').not('[data-load]').each (index, element) =>
      if $.inArray($(element).data('init'), inited) == -1
        inited.push($(element).data('init'))
        window[$(element).data('init')].init()
  load_objects: ->
    $('[data-load]').each (index, element) =>
      window[$(element).data('load')].init()

jQuery ->
  initialize.objects()

$(window).load ->
  initialize.load_objects()
