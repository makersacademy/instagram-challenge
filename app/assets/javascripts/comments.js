// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  $('.likes-link').on('click', function(event){
    event.preventDefault();

    var likeCount = $(this).siblings('.likes_count');

    $.post(this.href, function(response){
      likeCount.text(response.new_like_count);
    })
  })
})
