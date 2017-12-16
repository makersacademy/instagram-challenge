$(document).ready(function() {
  var singlePhotoDiv = $('#single-photo');
  var id = window.location.pathname.split('/')[2]
  $.get('/api/photos/' + id, function(photo) {
    console.log(photo);
    singlePhotoDiv.append('<img class="each-photo" src="' + photo.photo.photo.url + '">')
    singlePhotoDiv.append('<h3>' + photo.photo.description + '</h3>')
  })
})
