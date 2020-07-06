<div class="sliders slider-type-{$elementWidget.content.view_type} clearfix">
    {if $elementWidget.content.sliders|@count > 0} 
		{$sliderLayout = $elementWidget.content.view_type}
		<div class="wrapper-owl">
			<div class="wrapper-owl-item">
				<div class="has-animate row-item item-xs-{$elementWidget.content.itemsOwl.xs} item-sm-{$elementWidget.content.itemsOwl.sm} item-md-{$elementWidget.content.itemsOwl.md} item-lg-{$elementWidget.content.itemsOwl.lg} item-xl-{$elementWidget.content.itemsOwl.xl} slider-carousel owl-carousel owl-theme" data-options-owl = "{$elementWidget.content.optionsOwl}">   
					{assign var="i" value="0"}
					{assign var="key" value="0"}
					{if isset($elementWidget.content.per_column) && $elementWidget.content.per_column}
						{assign var="y" value=$elementWidget.content.per_column}
					{else}
						{assign var="y" value=1}
					{/if}
					{foreach from=$elementWidget.content.sliders item="slider"}
						{if $i mod $y eq 0}
						<div class="item item-{$key}">
						{$key = $key+1}
						{/if}

							{if isset($sliderLayout) && $sliderLayout}
								{include file="catalog/_partials/miniatures/_partials/_slider/slider-{$sliderLayout}.tpl"}
							{/if}

						{assign var="i" value="`$i+1`"}
						{if $i mod $y eq 0 || $i eq count($elementWidget.content.sliders)}
						</div>
						{/if}
					{/foreach}
				</div>
			</div>	
			<div class="wrapper-owl-controls"></div>
		</div>
    {else}
        <p class="alert_no_item alert alert-warning">
			{l s='No sliders at this time.' mod='nrtpagebuilder'}
		</p>
    {/if}
</div>   