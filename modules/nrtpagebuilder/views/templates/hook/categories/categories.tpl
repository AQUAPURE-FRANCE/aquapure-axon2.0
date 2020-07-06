<div class="categories category-type-{$elementWidget.content.view_type} clearfix">
	{if $elementWidget.content.categories|@count > 0} 
		{$categoryLayout = $elementWidget.content.view_type}
		<div class="wrapper-owl">
			<div class="wrapper-owl-item">
				<div class="row-item item-xs-{$elementWidget.content.itemsOwl.xs} item-sm-{$elementWidget.content.itemsOwl.sm} item-md-{$elementWidget.content.itemsOwl.md} item-lg-{$elementWidget.content.itemsOwl.lg} item-xl-{$elementWidget.content.itemsOwl.xl} slider-carousel owl-carousel owl-theme" data-options-owl = "{$elementWidget.content.optionsOwl}">  
					{assign var="i" value="0"}
					{assign var="key" value="0"}
					{if isset($elementWidget.content.per_column) && $elementWidget.content.per_column}
						{assign var="y" value=$elementWidget.content.per_column}
					{else}
						{assign var="y" value=1}
					{/if}
					{foreach from=$elementWidget.content.categories item="category"}
						{if $i mod $y eq 0}
						<div class="item item-{$key}">
						{$key = $key+1}
						{/if}

							{if isset($categoryLayout) && $categoryLayout}
								{include file="catalog/_partials/miniatures/_partials/_category/category-{$categoryLayout}.tpl"}
							{/if}
							
						{assign var="i" value="`$i+1`"}
						{if $i mod $y eq 0 || $i eq count($elementWidget.content.categories)}
						</div>
						{/if}
					{/foreach}
				</div>
			</div>	
			<div class="wrapper-owl-controls"></div>
		</div>
	{else}
		<p class="alert_no_item alert alert-warning">
			{l s='No categories at this time.' mod='nrtpagebuilder'}
		</p>
	{/if}
</div>	