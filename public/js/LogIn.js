'use strict';

$(document).ready(function() {
  var name,
      email,
      password,
      password_confirmation;

  function cleanFields() {
    $('#email').val('')
    $('#password').val('')
  }

  function getValues() {
    email = $('#email').val()
    password = $('#password').val()
  }

  function postUserToSession() {
    $.post('/login', { email: email, password: password })
  }

  $('#logInUser').click(function() {
    getValues()
    postUserToSession()
    cleanFields()
  })

})
