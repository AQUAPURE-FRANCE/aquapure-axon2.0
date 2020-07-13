<div class="menu-column-content">
	<div class="width-selector-wrapper">
		<span class="width-indicatior action_click"><i class="icon icon-arrows-h"></i></span>
		<div class="content_click">
			<div class="col-select">
				<i class="icon icon-mobile"></i>
				<select name="column_width_xs">
					{for $i=1 to 12}
						<option value="{$i}" {if isset($node.width_xs)}{if $node.width_xs == $i}selected{/if}{else}{if $i == 12}selected{/if}{/if}>
							{$i}/12
						</option>
					{/for}
					<option value="13" {if isset($node.width_xs)}{if $node.width_xs == 13}selected{/if}{/if}>
						{l s='Hidden' mod='nrtpagebuilder'}
					</option>
				</select>
			</div>
			<div class="col-select">
				<i class="icon icon-mobile icon-rotate-90" style="padding-top: 12px;padding-left: 7px;"></i>
				<select name="column_width_sm">
					{for $i=1 to 12}
						<option value="{$i}" {if isset($node.width_sm)}{if $node.width_sm == $i}selected{/if}{else}{if $i == 12}selected{/if}{/if}>
							{$i}/12
						</option>
					{/for}
					<option value="13" {if isset($node.width_sm)}{if $node.width_sm == 13}selected{/if}{/if}>
						{l s='Hidden' mod='nrtpagebuilder'}
					</option>
				</select>
			</div>
			<div class="col-select">
				<i class="icon icon-tablet"></i>
				<select name="column_width_md">
					{for $i=1 to 12}
						<option value="{$i}" {if isset($node.width_md)}{if $node.width_md == $i}selected{/if}{else}{if $i == 12}selected{/if}{/if}>
							{$i}/12
						</option>
					{/for}
					<option value="13" {if isset($node.width_md)}{if $node.width_md == 13}selected{/if}{/if}>
						{l s='Hidden' mod='nrtpagebuilder'}
					</option>
				</select>
			</div>
			<div class="col-select">
				<i class="icon icon-desktop"></i>
				<select name="column_width_lg">
					{for $i=1 to 12}
						<option value="{$i}" {if isset($node.width_lg)}{if $node.width_lg == $i}selected{/if}{else}{if $i == 12}selected{/if}{/if}>
							{$i}/12
						</option>
					{/for}
					<option value="13" {if isset($node.width_lg)}{if $node.width_lg == 13}selected{/if}{/if}>
						{l s='Hidden' mod='nrtpagebuilder'}
					</option>
				</select>
			</div>
			<div class="col-select">
				<i class="icon icon-desktop" style="font-size: 20px;"></i>
				<select name="column_width_xl">
					{for $i=1 to 12}
						<option value="{$i}" {if isset($node.width_xl)}{if $node.width_xl == $i}selected{/if}{else}{if $i == 12}selected{/if}{/if}>
							{$i}/12
						</option>
					{/for}
					<option value="13" {if isset($node.width_xl)}{if $node.width_xl == 13}selected{/if}{/if}>
						{l s='Hidden' mod='nrtpagebuilder'}
					</option>
				</select>
			</div>
		</div>
	</div>

	<div class="column-content-info">
		<div class="title-info" style="margin-bottom: 10px;">
			<strong class="title" style="vertical-align: middle;">{l s='Title: ' mod='nrtpagebuilder'}</strong>
			<div style="display: inline-block;vertical-align: middle;" class="text">
				{if isset($node.content_s.title) && $node.content_s.title}
					{$node.content_s.title}
				{else}
					{l s='(Empty)' mod='nrtpagebuilder'}
				{/if}
			</div>
		</div>
		<div class="content-info" style="margin-bottom: 10px;">
			<strong class="title">
				{if isset($node.contentType)}
					{if $node.contentType == 0}
						{l s='Content' mod='nrtpagebuilder'}
					{elseif $node.contentType == 1}
						{l s='Products Slider' mod='nrtpagebuilder'}
					{elseif $node.contentType == 2}
						{l s='Products Load' mod='nrtpagebuilder'}
					{elseif $node.contentType == 3}
						{l s='Selected Products' mod='nrtpagebuilder'}
					{elseif $node.contentType == 4}
						{l s='Selected Categories' mod='nrtpagebuilder'}
					{elseif $node.contentType == 5}
						{l s='Manufacturers logos' mod='nrtpagebuilder'}
					{elseif $node.contentType == 6}
						{l s='Blogs Slider' mod='nrtpagebuilder'}
					{elseif $node.contentType == 7}
						{l s='Sliders' mod='nrtpagebuilder'}
					{elseif $node.contentType == 8}
						{l s='Testimonials' mod='nrtpagebuilder'}
					{elseif $node.contentType == 9}
						{l s='Instagrams' mod='nrtpagebuilder'}
					{elseif $node.contentType == 18}
						{l s='Links List' mod='nrtpagebuilder'}
					{elseif $node.contentType == 17}
						{l s='Owl Custom' mod='nrtpagebuilder'}
					{elseif $node.contentType == 19}
						{l s='Social Follow' mod='nrtpagebuilder'}
					{elseif $node.contentType == 20}
						{l s='Module include' mod='nrtpagebuilder'}
					{elseif $node.contentType == 21}
						{l s='Banner image' mod='nrtpagebuilder'}
					{elseif $node.contentType == 22}
						{l s='Html Custom' mod='nrtpagebuilder'}
					{elseif $node.contentType == 23}
						{l s='Custom hook' mod='nrtpagebuilder'}
					{/if}
				{else}
					{l s='Content' mod='nrtpagebuilder'}
				{/if}
				 : 
			</strong>
			<div style="display: inline-block;vertical-align: middle;" class="text">
				{if isset($node.contentType)}
					{if $node.contentType == 0}
						{l s='(Empty)' mod='nrtpagebuilder'}
					{elseif $node.contentType == 1}
						{foreach from=$productsType item=productType}
							{if isset($node.content.ids) && $productType.id == $node.content.ids}
								{$productType.name}
								{break}
							{/if}
						{/foreach}
					{elseif $node.contentType == 2}
						{foreach from=$productsType item=productType}
							{if isset($node.content.ids) && $productType.id == $node.content.ids}
								{$productType.name}
								{break}
							{/if}
						{/foreach}
					{elseif $node.contentType == 3}
						{if isset($node.content.ids)}
							{foreach from=$node.content.ids item=product}
								{$product.name}
								<span class="phay_">, </span>
							{/foreach}
						{/if}
					{elseif $node.contentType == 4}
						{foreach from=$categoriesType item=categoryType}
							{if isset($node.content.ids) && in_array($categoryType.id, $node.content.ids)}
								{$categoryType.name}
								<span class="phay_">, </span>
							{/if}
						{/foreach}
					{elseif $node.contentType == 5}
						{if isset($node.content.ids) && in_array(0, $node.content.ids)}
							({l s='Show all' mod='nrtpagebuilder'})
						{/if}
						{foreach from=$brandsType item=brandType}
							{if isset($node.content.ids) && in_array($brandType.id, $node.content.ids)}
								{$brandType.name}
								<span class="phay_">, </span>
							{/if}
						{/foreach}
					{elseif $node.contentType == 6}
						{foreach from=$blogsType item=blogType}
							{if isset($node.content.ids) && $blogType.id == $node.content.ids}
								{$blogType.name}
								{break}
							{/if}
						{/foreach}
					{elseif $node.contentType == 7}
						{foreach from=$slidersType item=sliderType}
							{if isset($node.content.ids) && in_array($sliderType.id, $node.content.ids)}
								(ID: {$sliderType.id}) - {$sliderType.name}
								<span class="phay_">, </span>
							{/if}
						{/foreach}
					{elseif $node.contentType == 8}
						{foreach from=$testimonialsType item=testimonialType}
							{if isset($node.content.ids) && in_array($testimonialType.id, $node.content.ids)}
								(ID: {$testimonialType.id}) - {$testimonialType.name}
								<span class="phay_">, </span>
							{/if}
						{/foreach}
					{elseif $node.contentType == 9}
						({l s='Instagrams' mod='nrtpagebuilder'})
					{elseif $node.contentType == 17}
						{if isset($node.content.custom_owl)}
							{$node.content.custom_owl nofilter}
						{/if}
					{elseif $node.contentType == 18}
						{foreach from=$linksType item=linkType}
							{if isset($node.content.ids) && $linkType.id == $node.content.ids}
								(ID: {$linkType.id}) - {$linkType.name}
								{break}
							{/if}
						{/foreach}
					{elseif $node.contentType == 19}
						{foreach from=$socialsType item=socialType}
							{if isset($node.content.ids) && $socialType.id == $node.content.ids}
								(ID: {$socialType.id}) - {$socialType.name}
								{break}
							{/if}
						{/foreach}
					{elseif $node.contentType == 20}
						{foreach from=$modulesHooks item=module}
							{if isset($node.content.module.name) && $node.content.module.name == $module.name}
								{$module.name}
								{break}
							{/if}
						{/foreach}
						{if isset($node.content.module.name)}
							{assign var="hooks" value=","|explode:$modulesHooks[$node.content.module.name].hooks}
							{foreach from=$hooks item=hook}
								{if isset($node.content.module.name) && $node.content.module.hook == $hook}
									( {$hook} )
									{break}
								{/if}
							{/foreach}
						{/if}
					{elseif $node.contentType == 21}
						{if isset($node.content.banner.src)}
							<img src="{$node.content.banner.src}" style="max-width:100px;height:auto;"/>
						{/if}
					{elseif $node.contentType == 22}
						{if isset($node.content.custom_html)}
							{$node.content.custom_html nofilter}
						{/if}
					{elseif $node.contentType == 23}
						{if isset($node.content.hook)}{$node.content.hook}{/if}
					{/if}
				{else}
					{l s='(Empty)' mod='nrtpagebuilder'}
				{/if}
			</div>
		</div>
	</div>
	
	{include file="./column_modal.tpl"}
	
</div>	