$(document).ready( function() {
    $('.likes-link').on('click', function(event) {
      event.preventDefault();

      var likescount = $(this).siblings('.likes-count')
      $.post(this.href, function(response) {
        likescount.text(response.new_like_count);
      });
    });

     $('.dislikes-link').on('click', function(event) {
      event.preventDefault();

      var likescount = $(this).siblings('.likes-count')
      $.ajax({
          url: this.href,
          type: 'DELETE',
          success: function(response) {
              console.log(response)
              likescount.text(response.new_like_count);
          }
      });
    });
});
