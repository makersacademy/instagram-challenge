'use strict';

$(document).ready(function() {

  var file,
      user_id;

  user_id = parseInt(window.location.pathname.split("/").pop())

  // $('#uploadButton').click(function() {
  //   file = document.getElementById('file').files[0]
  //   $.post(`/users/${user_id}/images`, { file: file, user_id: user_id })
  // })

  $.get(`/users/${user_id}/images`, function(data) {
    data.images.forEach(function(x) {
      $('#images').append(`<img src=${x.picture}></img>`)
    })
  })
})
