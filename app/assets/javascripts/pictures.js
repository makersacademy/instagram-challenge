$(function() {
  $('.edit_form').hide();
  $('.edit_description').on('click', function(e) {
    e.preventDefault();
    $(this).parent().children('.edit_form').toggle();
  })

  // $('.post_button').on('click', function(e) {
  //   e.preventDefault();
  //   $.ajax({url: $(this).parent().attr('action'), type: 'PUT', data: {picture: {description: 'test'}}, success: function() {
  //     alert('success');}, error: function() {alert('error')
  //
  //   }
  //   })
  // })
})
