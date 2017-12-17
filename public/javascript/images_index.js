$(document).ready(function(){
var number_of_likes = 0

  $.get("/api/images", function(data){
      data.images.forEach(function(image){
        var number_of_likes = 0
        $('#images').prepend('<div id=image-' + image.id + '></div>')
        $('#image-' + image.id).append('<h4>' + image.name + '</h4>')
        $('#image-' + image.id).append('<img src=' + image.avatar.url+ '>')
        data.reactions.forEach(function(reaction){
          if(reaction.image_id == image.id){
            data.users.forEach(function(user){
              if(user.id == reaction.user_id){
                $('#image-' + image.id).append("<p id='reaction'>" + reaction.comment + "- " + user.name + "</p>")
              }
            })
          }
        })
        data.likes.forEach(function(like){
          if(like.image_id == image.id){
              number_of_likes ++
          }
        })
        $('#image-' + image.id).append('<p>' + number_of_likes + ' likes</p>')
        $('#image-' + image.id).append('<div id=reactions-' + image.id + '></div>')
        $('#reactions-' + image.id).append("<form id='reaction' class= "+ image.id + " method='post' action='/reactions' data-remote=true><input id='id' type='hidden' name= image_id value='" + image.id + "'><input id='comment' type='text' name='comment'><input id='submit' type='submit' value='submit'></form>")
        $('#reactions-' + image.id).append("<form id='like' class= "+ image.id + " method='post' action='/likes' data-remote=true><input id='id' type='hidden' name= image_id value='" + image.id + "'><input id='like' type='hidden' value='1' name='like'><input id='submit' type='submit' value='like'></form>")

      })
  });
});
