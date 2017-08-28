(function(exports) {
  "use strict";

  function LikeController() {
    this.eventListener();
  }

  LikeController.prototype = {
    eventListener: function() {
      var self = this;
      window.addEventListener("submit", function(event){
        var likehtml = event.target.lastElementChild.outerHTML;
        var likeid = event.target.lastElementChild.id;
        var idstring = likeid.substring(4);
        var likesid = "likes" + idstring;
        var likeshtmlnumber = Number((document.getElementById(likesid).innerHTML).slice(0, -5));
        if (likehtml.includes('full-heart')) {
          event.target.lastElementChild.outerHTML = '<input type="image" src="/assets/empty-heart.svg" id="' + likeid + '">';
          document.getElementById(likesid).innerHTML = String(likeshtmlnumber - 1) + " likes";
        } else if (likehtml.includes('empty-heart')) {
          event.target.lastElementChild.outerHTML = '<input type="image" src="/assets/full-heart.svg" id="' + likeid + '">';
          document.getElementById(likesid).innerHTML = String(likeshtmlnumber + 1) + " likes";
        }
      });
    }
  };

  exports.LikeController = LikeController;
})(this);

likecontroller = new LikeController();
