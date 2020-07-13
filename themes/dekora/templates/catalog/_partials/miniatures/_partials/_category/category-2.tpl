<div class="item-inner">
	{if isset($category.image.url)}
		{if isset($category.image.height) && $category.image.height > 0 && isset($category.image.width) && $category.image.width > 0}   
			{$style_padding	= ($category.image.height/$category.image.width)*100}
		{else}
			{$style_padding = 100}
		{/if} 
		<div class="image-category">
			<a href="{$category.url}" title="{$category.name}" {if isset($category.image.width) && $category.image.width > 0}style="max-width: {$category.image.width}px;"{/if}>
				<div class="img-placeholder" style="padding-top: {$style_padding}%">
					<img
						class="img-loader lazy-load" 
						data-src="{$category.image.url}"
						src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
						alt="{$category.name}"
						title="{$category.name}" 
						{if isset($category.image.width) && $category.image.width > 0}width="{$category.image.width}"{/if}
						{if isset($category.image.height) && $category.image.height > 0}height="{$category.image.height}"{/if}
					>
				</div>
			</a>
		</div>	
	{/if} 
	<div class="content-category">
		<a class="title_font category-name" href="{$category.url}" title="{$category.name}">
			{$category.name}
		</a>
		<div class="description">
			{$category.description nofilter}
		</div>
		<a class="btn btn-primary title_font" href="{$category.url}" title="{$category.name}">
			{l s='Shop Now !'}
		</a>
	</div>
</div>