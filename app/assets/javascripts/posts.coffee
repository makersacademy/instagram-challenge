# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ajax:success', 'a.like', (status,data,xhr) ->
    $("#interactions-#{data.id}").load(location.href+" #interactions-#{data.id}>*","");
    return
