$(document).ready(function(e) {
    $( "#selected-list" ).sortable({
      revert: true
    });
    $( "#repository-list li[data-type]" ).draggable({
      connectToSortable: "#selected-list",
      helper: "clone",
      revert: "invalid"
    });
	
	var repositoryListId = document.getElementById('repository-list');
	var selectedListId = document.getElementById('selected-list');
	
	$('body').on("click",'#selected-list .js-remove',function(e) {
		$(this).closest('li[data-type]').remove();
    });
	
	$('#add-custom-link').on("click",function(e) {

		title = {};
		url = {};
		$panel = $('#custom-links-panel');
	
		if (typeof languages != "undefined") {
			languages.forEach(function(jsLang) {
				title[jsLang.id_lang] = $panel.find('.link-title-' + jsLang.id_lang).first().val();
				url[jsLang.id_lang] = $panel.find('.link-url-' + jsLang.id_lang).first().val();
			});
		} else {
			title[id_language] = $panel.find('.link-title-' + id_language).first().val();
			url[id_language] = $panel.find('.link-url-' + id_language).first().val();
		}
	
		var el = document.createElement('li');
	
		$panel.find('input:text').each(function() {
			$(this).attr('value', $(this).val());
		});
	
		el.innerHTML = '<span class="drag-handle">☰</span> ' + $panel.clone().html()  + '<i class="icon-trash js-remove"></i>';
		el.setAttribute('data-type', 'custom');
	
		selectedListId.appendChild(el);
		$panel.find('input:text').each(function() {
			$(this).attr('value', '');
		});
    });
	
	
    $('button[name="submitNrtLinkBlock"]').on("click",function(e) {
       var $children = $(selectedListId).children();

	   if (typeof languages != "undefined") {
			languages.forEach(function(jsLang) {
				var links = [];
				$children.each(function() {
					var $el = $(this);
					if ($el.data('type') == 'custom'){						
						title = $el.find('.link-title-' + jsLang.id_lang).first().val();
						url = $el.find('.link-url-' + jsLang.id_lang).first().val();
						link = {type: $el.data('type'), title: title, url: url};
					}
					else{
						link = {type: $el.data('type'), id: $el.data('id')};
					}
					links.push(link);
				});
				if($.isEmptyObject(links)){
					$('#selected-links-' + jsLang.id_lang).val('');
				}
				else{
					$('#selected-links-' + jsLang.id_lang).val(encodeURIComponent(JSON.stringify(links)));
				}
			});
	   } else {
		    var links = [];
			$children.each(function() {
				var $el = $(this);
				if ($el.data('type') == 'custom'){						
					title = $el.find('.link-title-' + id_language).first().val();
					url = $el.find('.link-url-' + id_language).first().val();
					link = {type: $el.data('type'), title: title, url: url};
				}
				else{
					link = {type: $el.data('type'), id: $el.data('id')};
				}
				links.push(link);
			});
			if($.isEmptyObject(links)){
				$('#selected-links-' + id_language).val('');
			}
			else{
				$('#selected-links-' + id_language).val(encodeURIComponent(JSON.stringify(links)));
			}
	   }
		
    });

});