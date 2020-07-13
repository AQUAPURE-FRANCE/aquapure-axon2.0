<div class="testimonials testimonial-type-{$elementWidget.content.view_type} clearfix">
    {if $elementWidget.content.testimonials|@count > 0} 
		{$testimonialLayout = $elementWidget.content.view_type}
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
					{foreach from=$elementWidget.content.testimonials item="testimonial"}
						{if $i mod $y eq 0}
						<div class="item item-{$key}">
						{$key = $key+1}
						{/if}

							{if isset($testimonialLayout) && $testimonialLayout}
								{include file="catalog/_partials/miniatures/_partials/_testimonial/testimonial-{$testimonialLayout}.tpl"}
							{/if}

						{assign var="i" value="`$i+1`"}
						{if $i mod $y eq 0 || $i eq count($elementWidget.content.testimonials)}
						</div>
						{/if}
					{/foreach}
				</div>
			</div>	
			<div class="wrapper-owl-controls"></div>
		</div>
    {else}
        <p class="alert_no_item alert alert-warning">
			{l s='No testimonials at this time.' mod='nrtpagebuilder'}
		</p>
    {/if}
</div>   