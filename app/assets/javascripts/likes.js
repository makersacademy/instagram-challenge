$(document).ready(function() {

  $('.likes-link').on('click', function(event){
      event.preventDefault();

      var likeCount = $(this).siblings('.likes_count');

      $.post(this.href, function(response){
        likeCount.text(response.new_like_count);
    })
  });

  $('.unlikes-link').on('click', function(event) {
    event.preventDefault();

    var likeCount = $(this).siblings('.likes_count');

    $.ajax({
      url: this.href,
      type: 'delete',
      success: function(response){
        likeCount.text(response.destroy_like_count);
      }
    })
  });

})
