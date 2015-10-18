$(function() {
  $('.edit_form').hide();
  $('.edit_description').on('click', function() {
    $(this).parent().children('.edit_form').toggle();
  })

  $('.post_button').on('click', function() {
    $.ajax({url: this.href, success: function() {
      console.log('hi')
    }})
  })
})
