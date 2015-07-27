$(document).ready(function() {

  $('.likes-link').on('click', function(event){
      event.preventDefault();

      var likeCount = $(this).siblings('.likes_count');
      var likePluralisation = $(this).siblings('.likes_pluralisation');

      $.post(this.href, function(response){
        likeCount.text(response.new_like_count);
        likePluralisation.text(response.new_pluralisation);
    })
  })
})