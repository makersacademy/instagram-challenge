(function(exports) {
  "use strict";

  function LikeController() {
    this.eventListener();
  }

  LikeController.prototype = {
    eventListener: function() {
      var self = this;
      window.addEventListener("submit", function(event){
        // event.preventDefault();
        var idnumber = (event.target.lastElementChild.id).replace(/\D/g,'');
        var likeid = "like" + idnumber;
        var unlikeid = "unlike" + idnumber;
        var likesid = "likes" + idnumber;
        var likeshtmlnumber = Number((document.getElementById(likesid).innerHTML).replace(/\D/g,''));
        if (event.target.lastElementChild.id === likeid) {
          document.getElementById(unlikeid).className = "";
          document.getElementById(likeid).className = "hide";
          document.getElementById(likesid).innerHTML = String(likeshtmlnumber - 1) + " likes";
        } else if (event.target.lastElementChild.id === unlikeid) {
          document.getElementById(unlikeid).className = "hide";
          document.getElementById(likeid).className = "";
          document.getElementById(likesid).innerHTML = String(likeshtmlnumber + 1) + " likes";
        }
      });
    }
  };

  exports.LikeController = LikeController;
})(this);

likecontroller = new LikeController();
