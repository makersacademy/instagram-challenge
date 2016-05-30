'use strict';
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$( document ).ready(function() {
  $('.iron').click(function(event) {
    event.preventDefault();
    event.stopPropagation();

    var url = $(this).attr('href');
    var method = $(this).data('method');

    var ironWrapperParent = $(this).closest('.iron-wrapper');
    var ironCountElement = ironWrapperParent.find('.iron-count');

    $.ajax({
      url: url,
      method: method,
      success: function(response) {
        ironCountElement.text(response.new_irons_count)
      }
    });
  });
});
