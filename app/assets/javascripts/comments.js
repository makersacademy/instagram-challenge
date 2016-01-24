var ready;
ready = function() {

  $('.comment_content').keypress(function(event) {
    if (event.which == 13) {
        event.preventDefault();
        event.stopPropagation();
        var self = this;
        $.post(this.form.action, $(this.form).serialize(), function(response){
          clearCommentForm(self);
          updateComments(response, self);
        });
    }
  });

  function updateComments(comments, self) {
    var articleId = $(self).closest("article").attr("id");
    var ul = 'article#' + articleId +' ul.comments ';
    $(ul + 'li:not(:first)').remove();
    var list = $(ul);
    for (var i in comments) {
      list.append('<li><a href="">' + comments[i].username + '</a> ' + comments[i].content + '</li>');
    }
  }

  function clearCommentForm(input) {
    $(input).val('');
    $(input).blur();
  }

};

$(document).ready(ready);
$(document).on('page:load', ready);
