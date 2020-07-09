(function($) {var selectors = [];var check_binded = false;var check_lock = false;var defaults = {interval: 250,force_process: false};var $window = $(window);var $prior_appeared = [];function appeared(selector) {return $(selector).filter(function() {return $(this).is(':appeared');});}function process() {check_lock = false;for (var index = 0, selectorsLength = selectors.length; index < selectorsLength; index++) {var $appeared = appeared(selectors[index]);$appeared.trigger('appear', [$appeared]);if ($prior_appeared[index]) {var $disappeared = $prior_appeared[index].not($appeared);$disappeared.trigger('disappear', [$disappeared]);}$prior_appeared[index] = $appeared;}}function add_selector(selector) {selectors.push(selector);$prior_appeared.push();}$.expr.pseudos.appeared = $.expr.createPseudo(function(arg) {return function(element) {var $element = $(element);if (!$element.is(':visible') || $element.css("visibility") == "hidden") {return false;}var window_left = $window.scrollLeft();var window_top = $window.scrollTop();var offset = $element.offset();var left = offset.left;var top = offset.top;if (top + $element.height() >= window_top &&top - ($element.data('appear-top-offset') || 0) <= window_top + $window.height() &&left + $element.width() >= window_left &&left - ($element.data('appear-left-offset') || 0) <= window_left + $window.width()) {return true;} else {return false;}};});$.fn.extend({appear: function(selector, options) {$.appear(this, options);return this;}});$.extend({appear: function(selector, options) {var opts = $.extend({}, defaults, options || {});if (!check_binded) {var on_check = function() {if (check_lock) {return;}check_lock = true;setTimeout(process, opts.interval);};$(window).scroll(on_check).resize(on_check);check_binded = true;}if (opts.force_process) {setTimeout(process, opts.interval);}add_selector(selector);},force_appear: function() {if (check_binded) {process();return true;}return false;}});})(function() {if (typeof module !== 'undefined') {return require('jquery');} else {return jQuery;}}());

function initInterval($this, dataWidget) {
	var interal = setInterval(function() {
		if ($this.is(':appeared')) {
			ajaxLoadWidget($this, dataWidget);
			clearInterval(interal)
		}
	}, 1000);
}

function ajaxLoadWidget($this, dataWidget){
	$.ajax({
		type: 'POST',
		url: opPbder.ajax,
		data: dataWidget,
		success: function(response)
		{
			$this.replaceWith(response.html);
			prestashop.emit('mustUpdateLazyLoad', null);
			prestashop.emit('mustUpdateCarousel', null);
			prestashop.emit('updatedProductAjax', null);
			prestashop.emit('mustUpdateInfinite', null);

		},
		error: function (xhr, ajaxOptions, thrownError) {
			console.error(thrownError);
		}
	});	
}

$(window).load(function () {
    $('[data-load-widget]').each(function() {	
		var $this = $(this);
		var dataWidget = $this.data('load-widget');
		
		initInterval($this, dataWidget);
		
		$this.removeAttr('data-load-widget');
	});			
});
