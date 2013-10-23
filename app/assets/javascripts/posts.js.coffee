# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Loading more posts...")
        $('video,audio').mediaelementplayer(
          features: ['playpause','progress','duration'],
            audioHeight: 120,
          audioWidth: 30
        )
        $.getScript(url)

    $(window).scroll()



$(document).ready ->
  $('video,audio').mediaelementplayer(
    features: ['playpause','progress','duration'],
                  audioHeight: 120,
    audioWidth: 30
  )

