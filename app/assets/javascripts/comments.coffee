# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#new-comment').submit ->
    event.preventDefault()

    commentBody = $('#comment_body').val()

    $.post this.attr('action'), (response) ->
      commentBody.text response.new_comment_body
