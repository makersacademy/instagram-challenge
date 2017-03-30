# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ajax:success', 'form.like-post, form.new_comment', (status,data,xhr) ->
    reloadInteractions(data.id)
    return

reloadInteractions = (id) ->
    $("#interactions-#{id}").load(location.href+" #interactions-#{id}>*","");
