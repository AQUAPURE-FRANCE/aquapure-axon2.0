$(document).ready(function(e) {
		
	reSpectrum();	
		
    $( "#selected-social" ).sortable({
      placeholder: "ui-state-highlight"
    });
    $( "#selected-social" ).disableSelection();
		
	$('body').on("click",'#selected-social .js-remove',function(e) {
		$(this).closest('.wrapper-social').remove();
    });
	
	$('#add-custom-link').on("click",function(e) {
		$('#selected-social').append($('#selected-social-temp').html());
		reSpectrum();
	});
	
    $('button[name="submitNrtSocialFollow"]').on("click",function(e) {
	   if (typeof languages != "undefined") {
			languages.forEach(function(jsLang) {
				var links = [];
				 $('#selected-social .wrapper-social').each(function() {
					var $el = $(this);				
					title = $el.find('.social-title-' + jsLang.id_lang).first().val();
					url = $el.find('.social-url-' + jsLang.id_lang).first().val();
					bg = $el.find('.social-bg').first().val();
					icon = $el.find('.social-icon').first().val();
					link = {title: title, url: url, bg: bg, icon: icon};
					links.push(link);
				});
				if($.isEmptyObject(links)){
					$('#selected-list-' + jsLang.id_lang).val('');
				}
				else{
					$('#selected-list-' + jsLang.id_lang).val(encodeURIComponent(JSON.stringify(links)));
				}
			});
	   } else {
		    var links = [];
			$('#selected-social .wrapper-social').each(function() {
				var $el = $(this);				
				title = $el.find('.social-title-' + id_language).first().val();
				url = $el.find('.social-url-' + id_language).first().val();
				bg = $el.find('.social-bg').first().val();
				icon = $el.find('.social-icon').first().val();
				link = {title: title, url: url, bg: bg, icon: icon};
				links.push(link);
			});
			if($.isEmptyObject(links)){
				$('#selected-list-' + id_language).val('');
			}
			else{
				$('#selected-list-' + id_language).val(encodeURIComponent(JSON.stringify(links)));
			}
	   }
	
    });

});

function reSpectrum(){
	$("#selected-social .social-bg").each(function() {
		$(this).spectrum({
			showInput: true,
			clickoutFiresChange: true,
			preferredFormat: "rgb",
			allowEmpty: true,
			showAlpha: true,
			showInitial: true,
			appendTo: $(this).closest('.wrapper-social').first()
		});
	});
}