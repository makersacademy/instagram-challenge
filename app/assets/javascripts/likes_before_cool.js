$(document).ready(function() {
 $('.likes-link').on('click', function(event){
      event.stopImmediatePropagation();
      event.preventDefault();

      var likeCount = $(this).siblings('.likes_before_cool_count');

      $.post(this.href, function(response){
        likeCount.text(response.new_likes_before_cool_count);
    })
  })
})




