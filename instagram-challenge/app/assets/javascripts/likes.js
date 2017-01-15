$(document).ready(function(){
  $(".like").on('click', function(event){
    event.preventDefault();

    var likeCount = $(this).siblings('.like_count');

    $.post(this.href, function(response){
      likeCount.text(response.new_like_count);
    })

  })
})
