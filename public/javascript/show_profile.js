$(document).ready(function(){
var id = window.location.pathname.split('/')[2]

$.get("/userapi/profiles", function(data){
  // data.images.forEach(function(image){
  //   $('#users_images').prepend("<div class='image' id=image-"  + image.id + "></div>")
  //   $('#image-' + image.id).append('<h4>' + image.name + '</h4>')
  //   $('#image-' + image.id).append('<img id=jpeg src=' + image.avatar.url+ '>')
  // })
})


});
