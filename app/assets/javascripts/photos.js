// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(function() {
  $("a[data-remote]").on("ajax:success", function(e, data, status, xhr) {
    $("#like-" + this.dataset.id).load(location.href + " #like-" + this.dataset.id);
  });
});
