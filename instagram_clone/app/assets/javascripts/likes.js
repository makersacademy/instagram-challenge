var ready = function() {

    $('.add-like-link').on('click', function(event){
		
			event.preventDefault();

			$('.like-error').text('');

			var count = $(this).siblings('.like-count');
			var error = $(this).siblings('.like-error');

			$.post(this.href, function(response){
				count.text(response.newCount + ' ' + response.newLikeWord);
				if (response.hasOwnProperty('likeError')) {
					error.text(response.likeError);
				};
			});

		});

};

$(document).ready(ready);
$(document).on('page:load', ready);