function createMyOwl($this, optionsOwl){
	
		var textPrev = opThemect.prev;
		var textNext = opThemect.next;
	
		var animateOut = 'fadeOut';
		var	animateIn = 'fadeIn';
	
		var xsRewind = Number(optionsOwl.xs.rewind);
		var smRewind = Number(optionsOwl.sm.rewind);
		var mdRewind = Number(optionsOwl.md.rewind);
		var lgRewind = Number(optionsOwl.lg.rewind);
		var xlRewind = Number(optionsOwl.xl.rewind);
	
		var xsLoop = false;
		var smLoop = false;
		var mdLoop = false;
		var lgLoop = false;
		var xlLoop = false;
	
		if(xsRewind == 2){
			xsLoop = true; 
			xsRewind = false;
		}
		
		if(smRewind == 2){
			smLoop = true; 
			smRewind = false;
		}
	
		if(mdRewind == 2){
			mdLoop = true; 
			mdRewind = false;
		}
	
		if(lgRewind == 2){
			lgLoop = true; 
			lgRewind = false;
		}
	
		if(xlRewind == 2){
			xlLoop = true; 
			xlRewind = false;
		}
	
		if(!$this.hasClass('has-animate')){
			animateOut = false;
			animateIn = false;  
		}
	
		$this.owlCarousel({
			navText: ['&#10094;'+'<span>'+textPrev+'</span>','<span>'+textNext+'</span>'+'&#10095;'],
			dotsSpeed: 500,
			autoHeight: false,
			animateOut: animateOut,
			animateIn: animateIn,
			responsive:{
				0:{ 
					items: Number(optionsOwl.xs.line),
					loop: xsLoop,
					rewind: xsRewind,
					nav: Number(optionsOwl.xs.nav_type),
					dots: Number(optionsOwl.xs.dots_type),
					autoplay: Number(optionsOwl.xs.autoplay),
					autoplayTimeout: Number(optionsOwl.xs.autoplay_timeout),
					autoplaySpeed: Number(optionsOwl.xs.autoplay_speed),
					autoplayHoverPause: Number(optionsOwl.xs.autoplay_pause)
				},
				576:{ 
					items: Number(optionsOwl.sm.line),
					loop: smLoop,
					rewind: smRewind,
					nav: Number(optionsOwl.sm.nav_type),
					dots: Number(optionsOwl.sm.dots_type),
					autoplay: Number(optionsOwl.sm.autoplay),
					autoplayTimeout: Number(optionsOwl.sm.autoplay_timeout),
					autoplaySpeed: Number(optionsOwl.sm.autoplay_speed),
					autoplayHoverPause: Number(optionsOwl.sm.autoplay_pause)
				},
				768:{
					items: Number(optionsOwl.md.line),
					loop: mdLoop,
					rewind: mdRewind,
					nav: Number(optionsOwl.md.nav_type),
					dots: Number(optionsOwl.md.dots_type),
					autoplay: Number(optionsOwl.md.autoplay),
					autoplayTimeout: Number(optionsOwl.md.autoplay_timeout),
					autoplaySpeed: Number(optionsOwl.md.autoplay_speed),
					autoplayHoverPause: Number(optionsOwl.md.autoplay_pause)
				},
				992:{
					items: Number(optionsOwl.lg.line),
					loop: lgLoop,
					rewind: lgRewind,
					nav: Number(optionsOwl.lg.nav_type),
					dots: Number(optionsOwl.lg.dots_type),
					autoplay: Number(optionsOwl.lg.autoplay),
					autoplayTimeout: Number(optionsOwl.lg.autoplay_timeout),
					autoplaySpeed: Number(optionsOwl.lg.autoplay_speed),
					autoplayHoverPause: Number(optionsOwl.lg.autoplay_pause)
				},
				1200:{
					items: Number(optionsOwl.xl.line),
					loop: xlLoop,
					rewind: xlRewind,
					nav: Number(optionsOwl.xl.nav_type),
					dots: Number(optionsOwl.xl.dots_type),
					autoplay: Number(optionsOwl.xl.autoplay),
					autoplayTimeout: Number(optionsOwl.xl.autoplay_timeout),
					autoplaySpeed: Number(optionsOwl.xl.autoplay_speed),
					autoplayHoverPause: Number(optionsOwl.xl.autoplay_pause)
				}
			},
			onInitialized: function(e){
				var $breakpoint = e.relatedTarget._breakpoint;
				var $nav = e.relatedTarget.$element.find('.owl-nav').first();
				var $dots = e.relatedTarget.$element.find('.owl-dots').first();
				setOwlControls($nav, $dots, $breakpoint, optionsOwl, $this);
			},
			onResized: function(e){
				var $breakpoint = e.relatedTarget._breakpoint;
				var $nav = $this.closest('.wrapper-owl').find('.owl-controls').find('.owl-nav').first();
				var $dots = $this.closest('.wrapper-owl').find('.owl-controls').find('.owl-dots').first();
				setOwlControls($nav, $dots, $breakpoint, optionsOwl, $this);
			} 
		});
	
		$this.children('.owl-nav, .owl-dots').wrapAll("<div class='owl-controls container'></div>");
		$this.closest('.wrapper-owl').find('.wrapper-owl-controls').replaceWith($this.find('.owl-controls'));
		
}

function setOwlControls($nav, $dots, $breakpoint, optionsOwl, $this){
	var attrs = {};
	switch($breakpoint) {
		case 0:
			attrs = setAttrsControls(optionsOwl.xs);
			break;
		case 576:
			attrs = setAttrsControls(optionsOwl.sm);
			break;
		case 768:
			attrs = setAttrsControls(optionsOwl.md);
			break;
		case 992:
			attrs = setAttrsControls(optionsOwl.lg);
			break;
		default:
			attrs = setAttrsControls(optionsOwl.xl);
	} 
	$nav.attr(attrs.nav_attrs);
	$dots.attr(attrs.dots_attrs);
	$nav.mouseenter(function() {
		$this.mouseenter();
	}).mouseleave(function() {
		$this.mouseleave();
	});
	
	$dots.mouseenter(function() {
		$this.mouseenter();
	}).mouseleave(function() {
		$this.mouseleave();
	});
}

function setAttrsControls(options){
	var nav_attrs = {type: '',position: '', style: ''};
	var dots_attrs = {type: '',position: '', style: ''};
	var nav_css = '';
	var dots_css = '';
	if(typeof (options.nav_margin) != 'undefined' && Number(options.nav_margin.top)){
		nav_css += 'margin-top: '+options.nav_margin.top+'px;';
	}
	if(typeof (options.nav_margin) != 'undefined' && Number(options.nav_margin.right)){
		nav_css += 'margin-right: '+options.nav_margin.right+'px;';
	}
	if(typeof (options.nav_margin) != 'undefined' && Number(options.nav_margin.bottom)){
		nav_css += 'margin-bottom: '+options.nav_margin.bottom+'px;';
	}
	if(typeof (options.nav_margin) != 'undefined' && Number(options.nav_margin.left)){
		nav_css += 'margin-left: '+options.nav_margin.left+'px;';
	}
	nav_attrs.type = options.nav_type;
	nav_attrs.position = options.nav_position;
	nav_attrs.style = nav_css;
	
	if(typeof (options.dots_margin) != 'undefined' && Number(options.dots_margin.top)){
		dots_css += 'margin-top: '+options.dots_margin.top+'px;';
	}
	if(typeof (options.dots_margin) != 'undefined' && Number(options.dots_margin.right)){
		dots_css += 'margin-right: '+options.dots_margin.right+'px;';
	}
	if(typeof (options.dots_margin) != 'undefined' && Number(options.dots_margin.bottom)){
		dots_css += 'margin-bottom: '+options.dots_margin.bottom+'px;';
	}
	if(typeof (options.dots_margin) != 'undefined' && Number(options.dots_margin.left)){
		dots_css += 'margin-left: '+options.dots_margin.left+'px;';
	}
	dots_attrs.type = options.dots_type;
	dots_attrs.position = options.dots_position;
	dots_attrs.style = dots_css;
	
	
	return {nav_attrs:nav_attrs, dots_attrs:dots_attrs}
}

function initMyOwl(){
	$('[data-options-owl]').each(function() {
		var $this = $(this);
		var optionsOwl = $this.data('options-owl');
		$this.removeAttr('data-options-owl');
		createMyOwl($this, optionsOwl);
	});	
}

$(document).ready(function () {
	
	initMyOwl();
	
	prestashop.on('mustUpdateCarousel', function (e) {
		initMyOwl();
	});
			
});
