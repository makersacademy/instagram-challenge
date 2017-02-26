var attachCommentsHandler = function() {

  $(".comments-list").perfectScrollbar();

  var resetCommentField = function(thisElement){
    $(thisElement).siblings('.new-comment-field').val('Type a comment here…');
  };

  var postComment = function(thisElement, commentText){
    $.post(thisElement.href, { "comment_text": commentText }, function(response){
      imageId = response.image_id;
      var commentHTML = createCommentHTML(response);

      addComment(imageId, commentHTML);
      removeNoCommentsMessage(imageId);
      scrollToBottom(imageId);
    });
  };

  var createCommentHTML = function(response){
    return "<li><span class=\"user-name\">"+response.user_name+": </span>"+response.new_comment_text+"</li>";
  };

  var addComment = function(imageId, commentHTML){
    $("#image_"+imageId+"_comments").append(commentHTML);
  };

  var removeNoCommentsMessage = function(imageId){
    if ($("#image_"+imageId+"_comments").has($(".no-comments-message"))) {
      $("#image_"+imageId+"_comments > .no-comments-message").remove();
    }
  };

  var scrollToBottom = function(imageId){
    var commentsList = $("#image_"+imageId+"_comments");
    commentsList.scrollTop(commentsList.prop("scrollHeight"))
  };

  $('.add-new-comment').on('click', function(event){
      event.preventDefault();
      var thisElement = this;
      var commentText = $(thisElement).siblings('.new-comment-field').val();
      var imageId = "";

      resetCommentField(thisElement);
      postComment(thisElement, commentText);
  });

  $('.new-comment-form').on('keydown keypress', function(event){
      if(event.keyCode == 13){
        event.preventDefault();
        $(this).find('.add-new-comment').trigger('click');
        $(this).find('.new-comment-field').blur();
      }
  });

  $('.new-comment-field').on('click', function(){
    if ($(this).val() === 'Type a comment here…') {
      $(this).val('');
    }
  });

  $('.new-comment-field').on('focusout', function(){
    if ($(this).val() === '') {
      $(this).val('Type a comment here…');
    }
  });
};

// $(document).ready(attachCommentsHandler);
$(document).on("turbolinks:load", attachCommentsHandler);
