$(document).ready(function() {

  $.get("/api/photos", function(data) {
    data.photos.forEach(function(photo){
      $('#photos-index-content').append(`<div id=photos-index-photo-${photo.id}></div>`)
      $(`#photos-index-photo-${photo.id}`).append(`<p> ${photo.title}</p>`)
      $(`#photos-index-photo-${photo.id}`).append(`<img src="${photo.image_url}" />`)
      $(`#photos-index-photo-${photo.id}`).append('<form action="/api/photos/'+ photo.id + '/likes" method="post"><input type="submit" value="Like"></form>')
      $(`#photos-index-photo-${photo.id}`).append('<form action="/api/photos/'+ photo.id + '/comments" method="post"> <input type="text" name="text" placeholder="Comment"><input type="submit" value="Add Comment"></form>')
    })
  })
});
