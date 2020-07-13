<div class="item-inner">
	{if $brand.image.url}
		{if isset($brand.image.height) && $brand.image.height > 0 && isset($brand.image.width) && $brand.image.width > 0}   
			{$style_padding	= ($brand.image.height/$brand.image.width)*100}
		{else}
			{$style_padding = 100}
		{/if} 
		<a href="{$brand.url}" title="{$brand.name}" {if isset($brand.image.width) && $brand.image.width > 0}style="max-width: {$brand.image.width}px;"{/if}>
			<div class="img-placeholder" style="padding-top: {$style_padding}%">
				<img
					class="img-loader lazy-load" 
					data-src="{$brand.image.url}"
					src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
					alt="{$brand.name}"
					title="{$brand.name}" 
					{if isset($brand.image.width) && $brand.image.width > 0}width="{$brand.image.width}"{/if}
					{if isset($brand.image.height) && $brand.image.height > 0}height="{$brand.image.height}"{/if}
				>
			</div>
		</a>
	{/if} 
</div>