$(document).on('page:change', function () {
  console.log('is ready!')
  $('input:radio').click(function(){
    var value = $(this).val();
    $('#photo_to_edit').removeClass().addClass(value);
    })
})
