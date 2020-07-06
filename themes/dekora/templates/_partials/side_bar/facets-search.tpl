{if !empty($listing.rendered_facets)}
<div id="slide-bar-facetssearch" class="slide-bar-facetssearch slide-bar slide-bar-left">
	<div class="sb-content">
		<div id="facets_search_center">
			{if isset($nrt_themect_category_faceted_position) && $nrt_themect_category_faceted_position}
				{widget name="ps_facetedsearch"}
			{else}
				<div id="_mobile_facets_search"></div>
			{/if}
		</div>		
	</div>
</div>
{/if}