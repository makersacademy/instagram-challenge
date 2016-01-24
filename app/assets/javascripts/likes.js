$(document).ready(function() {

  $('.like-link').click('on', function(event) {
    event.preventDefault();
    event.stopImmediatePropagation();

    var $this = $(this);

    $.post($this.href, function(response) {
      $this.removeClass('.fa-heart-o').addClass('.fa-heart');
      $this.sibilings('.likes-count').text(response.likes_count);
    });
  });

});
