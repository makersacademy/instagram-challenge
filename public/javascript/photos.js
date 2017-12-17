$(document).ready(function() {
  $('#photos-index-content').append('YAY!')

  $.get("api/photos", function(data) {
    data.photos.forEach(function(photo){
      $('#photos-index-content').append(`<div id=photos-index-photo-${photo.id}></div>`)
      $(`#photos-index-photo-${photo.id}`).append(`<p> ${photo.title}</p>`)
      $(`#photos-index-photo-${photo.id}`).append(`<img src="${photo.image_url}" />`)
    })
  })
});
