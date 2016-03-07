 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready( function() {

  $('.image-link').hover(
    function() {
      $(this).find('.popularity').css('display', 'block');
      $(this).find('.count').css('display', 'block');
    }, function() {
      $(this).find('.popularity').css('display', '');
      $(this).find('.count').css('display', '');
    }
  );

});
