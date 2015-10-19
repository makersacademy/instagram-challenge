$(document).ready(function() {

  $('.likes-link').on('click', function(event){
      event.preventDefault();

      var likesCount = $(this).siblings('.likes-count');

      $.post(this.href, function(response){
        likesCount.text(response.new_like_count);
    })
  })
})
