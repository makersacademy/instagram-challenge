// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var loadFile = function(event) {
  var output = document.getElementById('image-preview');
  output.src = URL.createObjectURL(event.target.files[0]);
};
