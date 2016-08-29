$(document).ready(function() {

  $('.like-link').on('click', function(event){
      event.preventDefault();

      var likeCount = $(this).siblings('.like-count');

      $.post(this.href, function(response){
        likeCount.text(response.new_likes_count);
    });
  });
});
