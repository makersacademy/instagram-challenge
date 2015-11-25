$(document).ready(function() {
  $('.favourites-link').on('click', function(event) {
    event.preventDefault();
    var favouriteCount = $(this).siblings('.favourites_count');

    $.post(this.href, function(response) {
      favouriteCount.text(response.new_favourite_count);
    });
  });
});