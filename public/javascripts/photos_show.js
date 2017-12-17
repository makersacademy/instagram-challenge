$(document).ready(function() {
  var singlePhotoDiv = $('#single-photo');
  var id = window.location.pathname.split('/')[2]
  $.get('/api/photos/' + id, function(photo) {
    singlePhotoDiv.append('<img class="each-photo" src="' + photo.photo.photo.url + '">')
    singlePhotoDiv.append('<h3>' + photo.photo.description + '</h3>')
  })

  $.get('/api/photos/' + id + '/comments', function(comments) {
    comments.comments.forEach(function(comment) {
      $('#comments').append('<p>' + comment.body + '</p>')
    })
  })

  createCommentForm();

  $('#comment-form').on("submit", function(event) {
    var value = $('#comment-body').val();
    $('#comments').append('<p>' + value + '</p>');
    event.preventDefault();
    $('#comment-body').val('');
    $.post('/photos/' + id + '/comments', {body: value}, function() {
    })
  })

  function createCommentForm() {
    $('#form').append('<form id="comment-form"></form>');
    $('#comment-form').append('<input id="comment-body" type="text" name="comment[body]">');
    $('#comment-form').append('<input id="submit-button" type="submit" value="Submit">');
  }

})
