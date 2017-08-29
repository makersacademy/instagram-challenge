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
