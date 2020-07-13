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
	if ($(this).scrollTop() > 213) {
		$('#header-desktop').addClass('sticky-top');
	} else {
		$('#header-desktop').removeClass('sticky-top');
	}
}