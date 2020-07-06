$(document).ready(function(e) {	
			
	sticky_menu();
	
	$(window).scroll(function() {		
		sticky_menu();	
	});
	
	$(window).on('resize', function() {
		sticky_menu();
	});
	
});

function sticky_menu() {
	var	_topSticky = $('#header-top-before').outerHeight() + $('#header-top').outerHeight() + $('#header-middle').outerHeight();
	if ($(this).scrollTop() >= _topSticky) {
		$('#header-desktop').addClass('sticky-top');
		$('#header-desktop').css({'top':'-'+_topSticky+'px'});
	} else {
		$('#header-desktop').removeClass('sticky-top');
		$('#header-desktop').css({'top':''});
	}
}