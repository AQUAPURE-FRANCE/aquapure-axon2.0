{*
 * Classic theme doesn't use this subtemplate, feel free to do whatever you need here.
 * This template is generated at each ajax calls.
 * See ProductListingFrontController::getAjaxProductSearchVariables()
 *}
<div id="js-product-list-bottom">
    {if isset($nrt_themect_category_product_infinite) && $nrt_themect_category_product_infinite}
        {foreach from=$listing.pagination.pages key=page_key item=sort_order}
            {if $sort_order.current}
            	{if isset($listing.pagination.pages[$page_key+1]) && $listing.pagination.pages[$page_key+1].type != 'next'}
                	{assign var="infiniteUrl" value=$listing.pagination.pages[$page_key+1].url}
                {/if}
                {break}
            {/if}
        {/foreach}
        {if isset($infiniteUrl)}
          <div class="infinite-loader">
            <div id="js-loading" class="btn loading hidden">
                <i class="fa fa-spinner fa-spin"></i>
                {l s='Loading'}
            </div>
            <a id='js-load-more' class="btn load-more {['js-search-link' => true]|classnames}" href="{$infiniteUrl}&infinite" >
                {l s='Load more'}
            </a>
          </div>
        {/if}
        <div class="showing-infinite">
      		{l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=['%from%' => 1 ,'%to%' => $listing.pagination.items_shown_to, '%total%' => $listing.pagination.total_items]}
      </div>
    {else}
        {block name='pagination'}
            {include file='_partials/pagination.tpl' pagination=$listing.pagination}
        {/block}
    {/if}
</div>
