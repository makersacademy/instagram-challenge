var attachLikesHandler = function() {

  var toggleLikeIcon = function(imageId){
    $("#image_"+imageId+"_likes_icon").text('favorite').addClass('liked');
  };

  $('.add-new-like').on('click', function(event){
      event.preventDefault();

      $.post(this.href, function(response){
        var likesCount = $("#image_"+response.image_id+" .likes-count");
        likesCount.text(response.new_likes_count);
        toggleLikeIcon(response.image_id);
    });
  });
};

$(document).on("turbolinks:load", attachLikesHandler);
