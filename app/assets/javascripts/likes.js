


$(document).ready(function() {

  $('.likes-link').on('click', function(event){
      event.preventDefault();

      var likeCount = $(this).siblings('.likes_count');

      console.log(this)

      $.post(this.href, function(response){
        likeCount.text(response.new_like_count);
    })
  })
})