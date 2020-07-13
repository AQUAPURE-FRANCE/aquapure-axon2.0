{if $node.type==2 || $node.type==4}
	{if (isset($node.content_s.title) && $node.content_s.title) || (isset($node.content_s.title_c) && $node.content_s.title_c)}
		<div class="content_title">
			{if isset($node.content_s.title) && $node.content_s.title}
				<div class="title_block title_font h3">
					{if isset($node.content_s.href) && $node.content_s.href}
						<a class="title_text" href="{$node.content_s.href}" title="{$node.content_s.href}">
							{$node.content_s.title nofilter} 
						</a>
					{else}
						<div class="title_text">
							{$node.content_s.title nofilter} 
						</div>
					{/if}	
				</div>
				<span class="title_line"></span>
			{/if}
			{if isset($node.content_s.title_c) && $node.content_s.title_c}
				<div class="title_content">{$node.content_s.title_c nofilter}</div>
			{/if}
			<div class="footer-toggler"></div>
		</div>
	{/if}
{/if}

{if $node.type==2}
    {if $node.contentType == 1 || $node.contentType == 3}
		{if isset($node.content.ajax) && $node.content.ajax}
			<div class="placeholder-load" data-load-widget={$node.content.config}></div>
		{else}
			{include file="module:nrtpagebuilder/views/templates/hook/products/products.tpl" elementWidget=$node}
		{/if}	
	{elseif $node.contentType == 2}
		{if isset($node.content.ajax) && $node.content.ajax}
			<div class="placeholder-load" data-load-widget={$node.content.config}></div>
		{else}
			{include file="module:nrtpagebuilder/views/templates/hook/products/infinite-products.tpl" elementWidget=$node}
		{/if}
	{elseif $node.contentType == 4}
		{if isset($node.content.ajax) && $node.content.ajax}
			<div class="placeholder-load" data-load-widget={$node.content.config}></div>
		{else}
			{include file="module:nrtpagebuilder/views/templates/hook/categories/categories.tpl" elementWidget=$node}
		{/if}
	{elseif $node.contentType == 5}
		{if isset($node.content.ajax) && $node.content.ajax}
			<div class="placeholder-load" data-load-widget={$node.content.config}></div>
		{else}
			{include file="module:nrtpagebuilder/views/templates/hook/brands/brands.tpl" elementWidget=$node}
		{/if}
	{elseif $node.contentType == 6}
		{if isset($node.content.ajax) && $node.content.ajax}
			<div class="placeholder-load" data-load-widget={$node.content.config}></div>
		{else}
			{include file="module:nrtpagebuilder/views/templates/hook/blogs/blogs.tpl" elementWidget=$node}
		{/if}
	{elseif $node.contentType == 7}
		{include file="module:nrtpagebuilder/views/templates/hook/sliders/sliders.tpl" elementWidget=$node}
	{elseif $node.contentType == 8}
		{include file="module:nrtpagebuilder/views/templates/hook/testimonials/testimonials.tpl" elementWidget=$node}
	{elseif $node.contentType == 9}
		{include file="module:nrtpagebuilder/views/templates/hook/instagrams/instagrams.tpl" elementWidget=$node}
	{elseif $node.contentType == 17}
		{include file="module:nrtpagebuilder/views/templates/hook/owl/owl.tpl" elementWidget=$node}
	{elseif $node.contentType == 18}
		{include file="module:nrtpagebuilder/views/templates/hook/links/links.tpl" node=$node}
	{elseif $node.contentType == 19}
		{include file="module:nrtpagebuilder/views/templates/hook/socials/socials.tpl" node=$node}
	{elseif $node.contentType == 20}
		{if isset($node.content.ajax) && $node.content.ajax}
			<div class="placeholder-load" data-load-widget={$node.content.config}></div>
		{else}
			{if isset($node.content.module)}
				{$node.content.module nofilter}
			{/if}
		{/if}
	{elseif $node.contentType == 21}
		{if isset($node.content.banner)}
			{if isset($node.content.banner.height) && $node.content.banner.height > 0 && isset($node.content.banner.width) && $node.content.banner.width > 0}   
				{$style_padding	= ($node.content.banner.height/$node.content.banner.width)*100}
			{else}
				{$style_padding = 100}
			{/if} 
			<div class="banner" style="{if isset($node.content.banner.width) && $node.content.banner.width > 0}max-width: {$node.content.banner.width}px;{/if}">
				<a href="{if isset($node.content.banner.href) && $node.content.banner.href}{$node.content.banner.href}{else}javascript:void(0){/if}" {if isset($node.content.banner.window) && $node.content.banner.window == 1 && isset($node.content.banner.href) && $node.content.banner.href}target="_blank"{/if} title="">
					<div class="img-placeholder" style="padding-top: {$style_padding}%">
						<img
							class="img-loader lazy-load" 
							data-src="{$node.content.banner.src}"
							src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
							alt=""
							title="" 
							{if isset($node.content.banner.width) && $node.content.banner.width > 0}width="{$node.content.banner.width}"{/if}
							{if isset($node.content.banner.height) && $node.content.banner.height > 0}height="{$node.content.banner.height}"{/if}
						>  
					</div>
				</a>
			</div>
		{/if}
	{elseif $node.contentType == 22}	
		{if isset($node.content.custom_html)}
			<div class="custom-html">
				{$node.content.custom_html nofilter}
			</div>
		{/if}
	{elseif $node.contentType == 23}	
		{if isset($node.content.hook)}
			{hook h=$node.content.hook}
		{/if}
    {/if}
{/if}
