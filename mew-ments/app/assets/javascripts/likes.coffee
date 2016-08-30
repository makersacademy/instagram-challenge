# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.likes-link').on 'click', (event) ->
    event.preventDefault()

    likeCount = $(this).siblings '.likes_count'

    $.post this.href, (response) ->
      likeCount.text response.new_like_count
