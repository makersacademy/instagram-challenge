$(document).ready(function() {

  $('.add-new-like').on('click', function(event){
      event.preventDefault();

      var likesCount = $(this).siblings('.likes_count');

      $.post(this.href, function(response){
        likesCount.text(response.new_likes_count);
    })
  })
})
