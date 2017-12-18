'use strict';

$(document).ready(function() {
  var name,
      email,
      password,
      password_confirmation;

  function cleanFields() {
    $('#name').val('')
    $('#email').val('')
    $('#password').val('')
    $('#password_confirmation').val('')
  }

  function getValues() {
    name = $('#name').val()
    email = $('#email').val()
    password = $('#password').val()
    password_confirmation = $('#password_confirmation').val()
  }

  function postUserData() {
    $.post('/users', { user: { name: name,
                               email: email,
                               password: password,
                               password_confirmation: password_confirmation }})
  }

  $('#createUser').click(function() {
    getValues()
    postUserData()
    cleanFields()
  })
})
