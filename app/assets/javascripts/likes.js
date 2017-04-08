$(document).ready(function() {

  $('.likes-link').on('click', function(event){
      event.preventDefault();

      var likeCount = $(this).siblings('.likes_count');
      likeLink = $(this);
      $.post(this.href, function(response){
        var likes_text = "♥ " + response.new_like_count;
        likeCount.text(likes_text );
        likeLink.text('');
    });
  });
});
