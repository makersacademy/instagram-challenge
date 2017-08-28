# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  var incrementLike = function(response) {
    likeCount.text(response.new_like_count);
  };

  var handleClick = function(event) {
    event.preventDefault();
    var likeCount = $(this).siblings('.likes-count');
    $.post(this.href, incrementLike);
  }

  $('.likes-link').on('click', handleClick);

});
