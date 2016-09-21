// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  $('.admirations-link').on('click', function(event){
      event.preventDefault();

      var admirationCount = $(this).siblings('.admirations_count');

      $.post(this.href, function(response){
        admirationCount.text(response.new_admiration_count);
    });
  });
});
