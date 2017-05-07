$(document).ready(function() {
  $('.likes-link').on('click', function(event) {
    event.preventDefault();

    var likeCount = $(this).data('post-id');

    $.post(this.href, function(response){
      $("#like_number" + likeCount).text(response.new_like_count);
    });
  });
});
