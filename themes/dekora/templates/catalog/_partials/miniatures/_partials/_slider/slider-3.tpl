<div class="item-inner{if $slider.text} has-text{/if}" style="{if isset($slider.width) && $slider.width > 0}max-width: {$slider.width}px;{/if}">
	{if isset($slider.height) && $slider.height > 0 && isset($slider.width) && $slider.width > 0}   
		{$style_padding	= ($slider.height/$slider.width)*100}
	{else}
		{$style_padding = 100}
	{/if} 
	<a href="{if $slider.link}{$slider.link}{else}javascript:void(0){/if}" title="">
		<div class="img-placeholder" style="padding-top: {$style_padding}%">
			{if $slider.src}
				<img
					class="img-loader lazy-load" 
					data-src="{$slider.src}"
					src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
					alt=""
					title="" 
					{if isset($slider.width) && $slider.width > 0}width="{$slider.width}"{/if}
					{if isset($slider.height) && $slider.height > 0}height="{$slider.height}"{/if}
				>
			{/if}
		</div>
	</a>
	{if $slider.text}
		<div class="text-slider">
			<div class="container container-parent">
				{$slider.text nofilter}
			</div>
		</div>
	{/if}	
</div>