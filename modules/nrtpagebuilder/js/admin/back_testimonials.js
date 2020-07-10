$(document).ready(function(e) {	
    $('button[name="submitNrtTestimonial"]').on("click",function(e) {
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
	
	var name_post = $el.find('[name=name_post_'+id_lang+']').first().val();
	var email = $el.find('[name=email_'+id_lang+']').first().val();
	var company = $el.find('[name=company_'+id_lang+']').first().val();
	var address = $el.find('[name=address_'+id_lang+']').first().val();
	var src = $el.find('[name=src_'+id_lang+']').first().val();
	var text = $el.find('[name=text_'+id_lang+']').first().val();
	
	if(name_post || email || company || address || src || text){
		content = {name_post: name_post, email: email, company: company, address: address, src: src, text: text};
	}
	if($.isEmptyObject(content)){
		$('#content-' + id_lang).val('');
	}
	else{
		$('#content-' + id_lang).val(encodeURIComponent(JSON.stringify(content)));
	}
}