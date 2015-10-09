
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .
//= require_self

var ready;
ready = function() {
  $(document).foundation();
};
$(document).ready(ready);
$(document).on('page:load', ready);
