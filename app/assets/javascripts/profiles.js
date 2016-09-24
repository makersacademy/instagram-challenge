$(document).ready(function() {
  (function(){
    var loading = document.getElementById("loading_page");
    var mainContent = document.getElementById("main_content");

    var show = function(){
      loading.style.display = "block";
      mainContent.style.display = "none";
      setTimeout(reset, 2500);
    };

    var reset = function(){
      loading.style.display = "none";
      mainContent.style.display = "block";
    };

    show();
  })();
});
