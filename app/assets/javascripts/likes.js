$(document).ready(function() {

  $('.add-new-like').on('click', function(event){
      event.preventDefault();

      $.post(this.href, function(response){
        var likesCount = $("#image_"+response.image_id+" .likes-count");
        likesCount.text(response.new_likes_count);
    })
  })
})
