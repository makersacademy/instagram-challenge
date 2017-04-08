var likesHandler = function() {
  $('.add-new-like').on('click', function(event){
      event.preventDefault();


      $.post(this.href, function(response){
        var likesCount = $("#picture_"+response.picture_id+" .likes_count");

        likesCount.text(response.new_likes_count);
    });
  });
};

$(document).on("turbolinks:load", likesHandler);
