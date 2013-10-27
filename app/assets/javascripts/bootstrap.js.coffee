$('body').on('touchstart.dropdown.data-api', (e) ->
  e.stopPropagation() )
jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()


