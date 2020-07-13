<div class="owl-custom clearfix">
	<div class="wrapper-owl">
		<div class="wrapper-owl-item">
			<div class="row-item item-xs-{$elementWidget.content.itemsOwl.xs} item-sm-{$elementWidget.content.itemsOwl.sm} item-md-{$elementWidget.content.itemsOwl.md} item-lg-{$elementWidget.content.itemsOwl.lg} item-xl-{$elementWidget.content.itemsOwl.xl} slider-carousel owl-carousel owl-theme" data-options-owl = "{$elementWidget.content.optionsOwl}">   
				{if isset($elementWidget.content.custom_owl)}
					{$elementWidget.content.custom_owl nofilter}
				{/if}
			</div>
		</div>	
		<div class="wrapper-owl-controls"></div>
	</div>
</div>   