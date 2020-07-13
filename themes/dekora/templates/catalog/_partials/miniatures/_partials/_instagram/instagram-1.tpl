<div class="item-inner">
	<a href="{$pic.link}" title="{$pic.caption}" target="_blank" rel="nofollow">		
		{if isset($pic.image.url)}
			{if isset($pic.image.height) && $pic.image.height > 0 && isset($pic.image.width) && $pic.image.width > 0}   
				{$style_padding	= ($pic.image.height/$pic.image.width)*100}
			{else}
				{$style_padding = 100}
			{/if} 
			<div class="img-placeholder" style="padding-top: {$style_padding}%">
				<img
					class="img-loader lazy-load" 
					data-src="{$pic.image.url}"
					src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
					alt="{$pic.caption}"
					title="{$pic.caption}" 
					{if isset($pic.image.width) && $pic.image.width > 0}width="{$pic.image.width}"{/if}
					{if isset($pic.image.height) && $pic.image.height > 0}height="{$pic.image.height}"{/if}
				>
			</div>
		{/if} 
		<span class="text-center">
			<i class="fa fa-heart"></i><span>{$pic.likes}</span>&nbsp;&nbsp;
			<i class="fa fa-comment"></i><span>{$pic.comments}</span>
		</span>
	</a>
</div>