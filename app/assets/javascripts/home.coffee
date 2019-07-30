# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery -> 
	if $('.pagination').length
		$(window).scroll -> 
			wst = $(window).scrollTop()
			dh  = $(document).height()
			wh  = $(window).height()
			url = $('.pagination .next_page').attr('href')
			if url && (wst > dh - wh - 50)
				$('.pagination').html('<div class="text-center"><div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div></div>');
				$.getScript(url)


