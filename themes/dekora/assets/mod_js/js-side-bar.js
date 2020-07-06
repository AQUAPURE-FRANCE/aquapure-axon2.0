(function($) {
    $.fn.SideBar = function(position) {	
 		if (typeof (position) == 'undefined') {
			var	position = 'right';
		}
		if (this.length) {
			this.addClass('open');
			var padding_right = window.innerWidth - $(window).innerWidth();
			$('body').addClass('slide-bar-open-'+position);
			$('body').css({'padding-right':padding_right+'px'});
		}
    }
})(jQuery);

$(document).ready(function() {
	
	$('body').on('click', '[data-toggle=slide-bar]', function (e) {
		$this = $(this);
		$($this.data('target')).SideBar($this.data('position'));
		e.preventDefault();
	});

	$('body').on('click', '[data-dismiss=slide-bar]', function (e) {
		dismissSildeBar();
	});
	
});

$(document).on('keyup',function(e) {
	if (e.keyCode == 27) {
		dismissSildeBar();
	}
});

function dismissSildeBar(){
	if($("body").hasClass("slide-bar-open-right")){
		$('[data-dismiss=slide-bar]').addClass('no-envents');
		$('body').removeClass('slide-bar-open-right');
		$('body').addClass('slide-bar-close-right');
		setTimeout(function(){
			$('body').removeClass('slide-bar-close-right');
			$('.slide-bar').removeClass('open');
			$('[data-dismiss=slide-bar]').removeClass('no-envents');
			$('body').css({'padding-right':''});
		}, 200);
	}
	if($("body").hasClass("slide-bar-open-left")){
		$('[data-dismiss=slide-bar]').addClass('no-envents');
		$('body').removeClass('slide-bar-open-left');
		$('body').addClass('slide-bar-close-left');
		setTimeout(function(){
			$('body').removeClass('slide-bar-close-left');
			$('.slide-bar').removeClass('open');
			$('[data-dismiss=slide-bar]').removeClass('no-envents');
			$('body').css({'padding-right':''});
		}, 200);
	}
}