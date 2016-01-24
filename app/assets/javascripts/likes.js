var ready;
ready = function() {
  function setEventOnLike(like) {
    $(like).on('click', function(event){
      event.preventDefault();
      event.stopPropagation();
      var articleId = $(this).closest("article").attr("id");

      $.ajax(this.href, {
        method: $(this).attr('data-method'),
        success: function(response) {
          updateLikeCounter(response.likes, articleId);
          updateLikeLink(response.link, articleId);
          setEventOnLike('article#' + articleId + ' .like');
        }
      });
    });
  }

  function updateLikeCounter(likes, articleId) {
    $('article#' + articleId + ' .likes').text(likes);
  }

  function updateLikeLink(link, articleId) {
    $('article#' + articleId + ' .like').remove();
    $(link).insertAfter('article#' + articleId + ' hr.separator');
  }

  setEventOnLike('.like');

};

$(document).ready(ready);
$(document).on('page:load', ready);
