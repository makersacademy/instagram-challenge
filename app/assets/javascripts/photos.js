$(document).ready(function() {
  var element = $('#photos');
  $.get('/api/photos', function(photos) {
    photos.photos.forEach(function(photo) {
      element.append(`<img class="each-photo" src="${photo.photo.url}">`)
      element.append(`<h3>${photo.description}</h3>`)
    })
  })
})
