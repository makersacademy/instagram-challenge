$(document).ready(function(){
var id = window.location.pathname.split('/')[2]

$.get("/userapi/profiles", function(data){
  data.images.forEach(function(image){
    var number_of_likes = 0
    $('#users_images').prepend("<div class='users_image' id=image-"  + image.id + "></div>")
    $('#image-' + image.id).append('<h4>' + image.name + '</h4>')
    $('#image-' + image.id).append('<img id=jpeg src=' + image.avatar.url+ '>')
    data.likes.forEach(function(like){
      if(like.image_id == image.id){
          number_of_likes ++
      }
    })
    $('#image-' + image.id).append('<p>' + number_of_likes + ' likes</p>')
    data.reactions.forEach(function(reaction){
      if(reaction.image_id == image.id){
        data.users.forEach(function(user){
          if(user.id == reaction.user_id){
            $('#image-' + image.id).append("<p id='reaction'>" + reaction.comment + " - " + user.name + "</p>")
          }
        })
      }
    })
  });
});


});
