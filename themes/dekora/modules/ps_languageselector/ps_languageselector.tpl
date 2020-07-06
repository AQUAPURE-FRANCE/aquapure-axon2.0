<div class="language-selector dropdown">
	<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">
		<img src="{$urls.img_lang_url}{$current_language.id_lang}.jpg" alt="" width="16" height="11"/>
		{$current_language.name_simple}
		<i class="fa fa-angle-down"></i>
	</div>
	<div class="dropdown-menu">
		{foreach from=$languages item=language}
			<a href="{url entity='language' id=$language.id_lang}">
				<img src="{$urls.img_lang_url}{$language.id_lang}.jpg" alt="" width="16" height="11" />
				{$language.name_simple}
			</a>
		{/foreach}
	</div>
</div>