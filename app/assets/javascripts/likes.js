$(document).ready(function() {

  $('.likes-link').on('click', function(event){
    event.preventDefault();

    var likeCount = $('.likes_count');

    $.get(this.href, function(response){
      likeCount.text(response.new_like_count);
    });
  });
});
