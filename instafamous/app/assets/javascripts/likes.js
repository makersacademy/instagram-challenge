$(document).ready( function() {
    $('.likes').on('click', function(event) {
      event.preventDefault();

      var likescount = $('.likes-link').siblings('.likes-count')
      $.post($('.likes-link').attr('href'), function(response) {
        likescount.text(response.new_like_count);
      });
    });

     $('.dislikes').on('click', function(event) {
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

