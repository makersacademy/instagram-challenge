$(document).ready(function(){
  $.get("/api/images", function(data){
    data.images.forEach(function(image){
       $('#images').append('<div id=image-' + image.id + '></div>')
       $('#image-' + image.id).append('<h4>' + image.name + '</h4>')
       $('#image-' + image.id).append('<img src=' + image.url + '>')
    })
  });
});
