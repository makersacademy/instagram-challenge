(function() {
  var postId;

  $(document).ready(function() {
    $('.post img').on('click',function()
      {
        if($(this).attr('class') != 'img-circle')
        {
            resetData();

            var sr = $(this).attr('src');
            postId = $(this).parents().eq(1)[0].id;
            var uri = '/posts/' + postId + '/comments';

            document.comment_form.action = uri;

            $.get('/posts/' + postId + '/likes/', function(response) {
              $('#like-count').text(response.likes_count + ' likes');
            });

            $.get('/posts/' + postId + '/comments/', function(response) {
              $('#comments-count').text(response.comments_count + ' comments');

              for (var i = 0; i < response.comments.length; i++){
                var obj = response.comments[i];
                for (var key in obj){
                  if (key === 'message'){
                    $('.modal-right ul').append( $('<li />', {text : obj[key]}));
                  }
                }
              }
            });

            var caption = document.getElementById('post_caption_' + postId);

            $('.modal-header h4').replaceWith('<h4>' + caption.innerHTML + '</h4>');
            $('.modal-right').attr('id', 'modal_comments_' + postId);
            $('#mimg').attr('src',sr);
            $('#myModal').modal('show');

        }
      });

      $('#heart').on('click', function(event) {
        var className = 'glyphicon glyphicon-heart-empty';

        if(document.getElementById("heart").className === 'glyphicon glyphicon-heart-empty')
          className = 'glyphicon glyphicon-heart';

        document.getElementById("heart").className = className;

        var likeCount = $(this).siblings('.like-count');

        $.post('/posts/' + postId + '/likes/', function(response) {
          $('#like-count').text(response.new_likes_count + ' likes');
        });

      });

      $("#comment_message").keypress(function(event) {
        if (event.which == 13 && ! event.shiftKey) {
          event.preventDefault();
            $.ajax({
              url: $(this).parents('form')[0].action,
              headers: {
                Accept : "text/javascript; charset=utf-8",
                "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8'
              },
              type: 'POST',
              data: {
                'comment[message]': $('#comment_message').val(),
                'authenticity_token': $(this).siblings('#authenticity_token').val()
              },
              error: function(){

              },
              success: function(){
                $('.modal-right ul').append( $('<li />', {text : $('#comment_message').val()}));
              }
            });
          }
      });

  });



  function resetData() {
    $('.modal-comments').empty();
    document.getElementById("heart").className = 'glyphicon glyphicon-heart-empty';
  }

})();
