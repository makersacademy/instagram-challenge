$(document).ready(function() {

  $('.like-link').click('on', function(event) {
    event.preventDefault();
    event.stopImmediatePropagation();

    var $this = $(this);

    $.post(this.href, function(response) {
      $this.children('.fa').removeClass('fa-heart-o').addClass('fa-heart');
      $this.siblings('.likes-count').text(response.likes_count);
    });
  });

});
// 
// var icon = $(this).children('.fa');
//
// $.post(this.href, function(response) {
//   if (icon.attr('fa-heart-o')) {
//     icon.removeClass('fa-heart-o').addClass('fa-heart');
//   } else {
//     icon.removeClass('fa-heart').addClass('fa-heart-o');
//   }
