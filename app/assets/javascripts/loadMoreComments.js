$(document).on('turbolinks:load', function(){
  $('body').on('click', '.more-comments', function() {
    $(this).on('ajax:success', function(event, data, status, xhr) {
      var postId = $(this).data("post-id");
      console.log('Returned data is: ', data);
      $("#comments_" + postId).html(data);
    });
  });
});
