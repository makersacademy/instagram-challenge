$(document).ready(function() {

  $('.postcomments').on('click', function(event){
      event.preventDefault();

      var opinion = $(this).siblings('.opinion')[0];
      var commentUl = $(this).siblings('.commentlist');
      $.post(this.href,{comment:{opinions:opinion.value}} ,function(response){
        if (response.opinion){
          li = "<li>" + response.opinion + "</li>";
        commentUl.append(li);
        opinion.value='';
      }
    });
  });
});
