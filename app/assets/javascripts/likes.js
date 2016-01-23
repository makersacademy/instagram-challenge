// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {

  $('.like-link').on('click', function(event){
    event.preventDefault();
    var likesCount = $(this).siblings('.likes_count');
    var flashNotice = $('.notice');
    $.post(this.href, function(response){
      if (response.new_likes_count !== undefined) {
        likesCount.text(response.new_likes_count);
      } else {
        flashNotice.text(response.already_liked_message);
      }
    });
  });
});
