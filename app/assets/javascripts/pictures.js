$(function() {
  $('.edit_form').hide();
  $('.edit_description').on('click', function(e) {
    e.preventDefault();
    $(this).parent().children('.edit_form').toggle();
  })
})
