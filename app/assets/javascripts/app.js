$(document).on('click','.like',function(e){
	e.preventDefault();
	var element = $(this); 
	var iconId	= element.attr('data-icon');
	var url = '/pins/';
	if (iconId == 'fas'){
		url += 	element.attr('data-id') + '/likes/' + element.attr('data-lid');
		method = 'DELETE';		
	} else{
		url += 	element.attr('data-id') + '/likes';
		method = 'POST';
	}
	$.ajax({
		url: url,
		type: method,
		success: function(response) {
			var likeId = $('#likes-' + element.attr('data-id'));
			$(likeId).html(response.data.likes);
			if (iconId == 'fas'){
				element.removeClass('fas');
				element.addClass('far');
				element.attr('data-icon','far');
			} else {
				element.removeClass('far');
				element.addClass('fas');
				element.attr('data-icon','fas');
				element.attr('data-lid',response.data.id);
			}
		}
	});
});



