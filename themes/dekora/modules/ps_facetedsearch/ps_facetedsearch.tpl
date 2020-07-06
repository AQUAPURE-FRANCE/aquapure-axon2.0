{if isset($listing.rendered_facets)}
	<div id="_desktop_facets_search" class="hidden-md-down">
		<div id="facets_search_wrapper">
			<div id="search_filters_wrapper">
				<div class="title-filter hidden-lg-up">
					{l s='Filter Your Selection'}
					<div class="close-filters js-filters-ok" data-dismiss="slide-bar">
						<i class="fa fa-times"></i>
					</div>
				</div>
				<div id="search_filter_controls" class="hidden-lg-up">
					<div data-search-url="" class="clear-filters js-search-filters-clear-all" data-dismiss="slide-bar">
						{l s='Clear all' d='Shop.Theme.Actions'}
					</div>
					<div class="ok-filters js-filters-ok" data-dismiss="slide-bar">
						{l s='OK' d='Shop.Theme.Actions'}
					</div>
				</div>
				<div class="block-facets">
					{$listing.rendered_facets nofilter}
				</div>
			</div>
		</div>
	</div>
{/if}
