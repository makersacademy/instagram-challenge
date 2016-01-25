$(document).ready(function() {

  $('.ticks-link').on('click', function(event){
      event.preventDefault();
      event.stopImmediatePropagation();

      var tickCount = $(this).siblings('.ticks_count');

      $.post(this.href, function(response){
        tickCount.text(response.new_tick_count);
    });
  });
});
