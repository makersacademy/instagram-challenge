$(document).ready(function(){


  $.get("/api/images", function(data){
      data.images.forEach(function(image){
        $('#images').append('<div id=image-' + image.id + '></div>')
        $('#image-' + image.id).append('<h4>' + image.name + '</h4>')
        $('#image-' + image.id).append('<img src=' + image.url + '>')
        $('#image-' + image.id).append('<div id=reactions-' + image.id + '></div>')
        $('#reactions-' + image.id).append("<form id='reaction' class= "+ image.id + " method='post' action='/reactions'><input id='id' type='hidden' name= image_id value='" + image.id + "'><input id='comment' type='text' name='comment'><input id='submit' type='submit' value='submit'></form>")
        // $('#reactions-' + image.id).append("<form")
      });
  });

});
