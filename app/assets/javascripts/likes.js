var likesHandler = function() {
  $('.add-new-like').on('click', function(event){
      event.preventDefault();

      var likesCount = $("#picture_"+response.picture_id+" .likes_count");

      $.post(this.href, function(response){
        likesCount.text(response.new_likes_count);
    });
  });
};

$(document).on("turbolinks:load", likesHandler);
