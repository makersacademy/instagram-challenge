$( document ).on( 'click', '.likes-link', function(event){
  event.preventDefault();

  var likeCount = $(this).siblings('.likes_count');

  $.post(this.href, function(response){
    likeCount.text(response.new_like_count);
    // if(response.new_like_count == 1) {
    //   $('.like_word').html("Like")
    // }
    // else
    // {
    //   $('.like_word').html("Likes")
    // }

   });
});