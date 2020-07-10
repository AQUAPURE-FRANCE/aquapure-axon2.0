$(document).ready(function(e) {	
    $('button[name="submitNrtSlider"]').on("click",function(e) {
	   $el = $(this).closest('form');
	   tinyMCE.triggerSave(); 	
	   if (typeof languages != "undefined") {
			languages.forEach(function(jsLang) {
				__setContent($el, jsLang.id_lang);
			});
	   } else {
			__setContent($el, id_language);
	   }
    });
});

function __setContent($el, id_lang){
	
	var src = $el.find('[name=src_'+id_lang+']').first().val();
	var link = $el.find('[name=link_'+id_lang+']').first().val();
	var text = $el.find('[name=text_'+id_lang+']').first().val();
	var width = $el.find('[name=width_'+id_lang+']').first().val();
	var height = $el.find('[name=height_'+id_lang+']').first().val();
	
	if(src || link || text || width || height){
		content = {src: src, link: link, text: text, width: width, height: height};
	}
	if($.isEmptyObject(content)){
		$('#content-' + id_lang).val('');
	}
	else{
		$('#content-' + id_lang).val(encodeURIComponent(JSON.stringify(content)));
	}
}