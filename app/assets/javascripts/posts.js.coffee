# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Loading more posts...")
        $.getScript url, ->
                            $("video,audio").mediaelementplayer
                              features: ["playpause", "progress", "duration"]
                              success: (mediaElement, domObject) ->
                                mediaElement.addEventListener "ended", ((e) ->
                                  mejsPlayNext $(this).closest("ul")
                                ), false
                                mediaElement.addEventListener "play", ((e) ->
                                  mejsPlay $(this).closest("li")
                                ), false
                                mediaElement.addEventListener "pause", ((e) ->
                                  mejsPause $(this)
                                ), false



    $(window).scroll()

mejsPlayNext = (currentList) ->
      if currentList.find(" li.current").length > 0 # get the .current song
        current_item = currentList.find("li.current:first") # :first is added if we have few .current classes
        $(current_item).next().addClass("current").siblings().removeClass "current"
      else # if there is no .current class
        current_item = currentList.find("li:first") # get :first if we don't have .current class
        $(current_item).next().addClass("current").siblings().removeClass "current"
      if $(current_item).is(":last-child") # if it is last - stop playing
        current_item = currentList.find(" li:first")
        $(current_item).addClass("current").siblings().removeClass "current"
      else
        current_item.next().find("audio#audio-player").get(0).player.play();

mejsPlay = (currentItem) ->
  playIcon = '\u25B6 '
  startsWithIcon = document.title.substring(0, playIcon.length) is playIcon
  document.title = playIcon + document.title  if not startsWithIcon

  $(currentItem).addClass("current").siblings().removeClass "current"  unless $(currentItem).hasClass("current")

mejsPause = (currentItem) ->
  playIcon = '\u25B6 '
  startsWithIcon = document.title.substring(0, playIcon.length) is playIcon
  if startsWithIcon
    document.title = document.title.slice(playIcon.length)



$(document).ready ->
  $("video,audio").mediaelementplayer
    features: ["playpause", "progress", "duration"]
    success: (mediaElement, domObject) ->
      mediaElement.addEventListener "ended", ((e) ->
        mejsPlayNext $(this).closest("ul")
      ), false
      mediaElement.addEventListener "play", ((e) ->
        mejsPlay $(this).closest("li")
      ), false
      mediaElement.addEventListener "pause", ((e) ->
        mejsPause $(this)
      ), false

  offset = 220
  duration = 500
  jQuery(window).scroll ->
    if jQuery(this).scrollTop() > offset
      jQuery(".back-to-top").fadeIn duration
    else
      jQuery(".back-to-top").fadeOut duration

  jQuery(".back-to-top").click (event) ->
    event.preventDefault()
    jQuery("html, body").animate
      scrollTop: 0
    , duration
    false
  


