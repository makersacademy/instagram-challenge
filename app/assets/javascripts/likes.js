$(document).ready(function() {

  $('.like').on('click', function(event){
      event.preventDefault();

      var likesCount = $(this).siblings('.likes-count');

      $.post(this.href, function(response){
        likesCount.text(response.newLikeCount);
    })
  })
})
