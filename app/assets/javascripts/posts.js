
$(function() {
  $('#post_image').on('change', function(event) {
    var files = event.target.files;
    var image = files[0];
    // here's the file size
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      img.src = file.target.result;
      $('#target').html(img);
    };
    reader.readAsDataURL(image);
  });
  $('#post_filter').on('change', function(event){
    $('#target img').attr('class', event.target.value);
  });
});
