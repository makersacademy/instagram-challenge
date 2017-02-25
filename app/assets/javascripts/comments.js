$(document).ready(function() {

  $('.add-new-comment').on('click', function(event){
      event.preventDefault();
      var commentText = $(this).siblings('.new-comment-field').val();
      var imageId = "";

      $.post(this.href, { "comment_text": commentText }, function(response){
        imageId = response.image_id;
        var commentHTML = "<li><span class=\"user-name\">"+response.user_name+": </span>"+response.new_comment_text+"</li>";
        $("#image_"+imageId+"_comments").append(commentHTML);

        if ($("#image_"+imageId+"_comments").has($(".no-comments-message"))) {
          $("#image_"+imageId+"_comments > .no-comments-message").remove();
        }
      });
  });
});
