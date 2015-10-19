$(document).ready(function() {

  $('.upvotes-link').on('click', function(event){
      event.preventDefault();

      var upvoteCount = $(this).siblings('.upvotes_count');

      $.post(this.href, function(response){
        upvoteCount.text(response.new_upvote_count);
    })
  })
})