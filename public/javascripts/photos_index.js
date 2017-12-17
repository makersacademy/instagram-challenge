$(document).ready(function() {
  var element = $('#photos');
  $.get('/api/photos', function(photos) {
    photos.photos.forEach(function(photo) {
      element.append('<div id="photo-' + photo.id + '"></div>')
      $('#photo-' + photo.id).append('<a href="/photos/' + photo.id + '"><img class="each-photo" src="' + photo.photo.url + '"></a>')
      $('#photo-' + photo.id).append('<h3>' + photo.description + '</h3>')
      $('#photo-' + photo.id).append('<p> Likes: <span id="likes-number-' + photo.id + '">' + photo.likes + '</span></p>')
      $('#photo-' + photo.id).append('<button id="like-button-' + photo.id + '"><span id="like-button-text-' + photo.id + '">Like</span></button>')
      likeButtonPostRequest(photo.id);
    })
  })

  var liking = true;

  function likeButtonPostRequest(photoId) {
    $('#like-button-' + photoId).click(function() {
      var value = $('#likes-number-' + photoId).html();
      if (liking) {
        $('#likes-number-' + photoId).html(Number(value) + 1);
        $.post('/photos/' + photoId + '/likes', function() {
        })
        $('#like-button-text-' + photoId).html('Unlike');
        liking = !liking;
      } else {
        $('#likes-number-' + photoId).html(Number(value) - 1);
        $.ajax({
          url: '/photos/' + photoId + '/likes/1',
          type: 'DELETE',
          success: function() {}
        });
        $('#like-button-text-' + photoId).html('Like');
        liking = !liking;
      }
    })
  }
})
