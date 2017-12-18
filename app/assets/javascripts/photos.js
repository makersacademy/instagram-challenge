$(document).ready(function() {

  $.get("/api/photos", function(data) {
    data.photos.forEach(function(photo){
      var photoId = photo.id
      $('#photos-index-content').append(`<div id=photos-index-photo-${photo.id}></div>`)
      $(`#photos-index-photo-${photoId}`).append(`<p> ${photo.title}</p>`)
      $(`#photos-index-photo-${photoId}`).append(`<img src="${photo.image_url}" />`)
      $(`#photos-index-photo-${photoId}`).append('<form action="/api/photos/'+ photoId+ '/likes" method="post"><input type="submit" value="Like"></form>')
      $.get(`/api/photos/${photoId}/likes`, function(likesData) {
        $(`#photos-index-photo-${photoId}`).append(`<p> ${likesData.likes.length} likes! </p>`)
        $(`#photos-index-photo-${photoId}`).append('<form action="/api/photos/'+ photoId + '/comments" method="post"> <input type="text" name="text" placeholder="Comment"><input type="submit" value="Add Comment"></form>')
        $.get(`/api/photos/${photoId}/comments`, function(commentsData) {
          commentsData.comments.forEach(function(comment) {
            $(`#photos-index-photo-${photoId}`).append(`<p> ${comment.text} </p>`)
          })
        })
      })
    })
  })
});
