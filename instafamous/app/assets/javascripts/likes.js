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

      var likescount = $('.likes-link').siblings('.likes-count')
      $.ajax({
          url: $('.dislikes-link').attr('href'),
          type: 'DELETE',
          success: function(response) {
              likescount.text(response.new_like_count);
          }
      });
    });
});
