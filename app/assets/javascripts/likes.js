
$(document).ready(function() {

  $('.like-button').on('click', function(event){
      event.preventDefault();

      var likeCount = $(this).siblings('.likes_count');

      $.post(this.href, function(response){
        likeCount.text(response.new_likes_count);

    });
  });
});
