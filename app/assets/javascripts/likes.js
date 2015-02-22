$(document).ready(function() {

  $('.like-link').on('click', function(event){
      event.preventDefault();
      var likeCount = $(this).parent().siblings('.likes').children('.like_count');

      $.post(this.href, function(response){
        likeCount.text(response.new_like_count);
    })
  })
})