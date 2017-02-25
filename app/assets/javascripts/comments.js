$(document).ready(function() {

  $('.add-new-comment').on('click', function(event){
      event.preventDefault();
      var commentText = $(this).siblings('.new-comment-field').val();

      $.post(this.href, { "comment_text": commentText }, function(response){
        var imageId = response.image_id;
        var commentHTML = "<li>"+response.new_comment_text+"</li>";
        $("#image_"+imageId+"_comments").append(commentHTML);
    })
  })
})
