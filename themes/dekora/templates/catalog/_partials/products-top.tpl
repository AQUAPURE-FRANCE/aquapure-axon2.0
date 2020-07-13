{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div id="js-products-list-top" class="products-selection">
    {if !empty($listing.rendered_facets)}
		<div class="facated-toggler{if isset($nrt_themect_category_faceted_position) && !$nrt_themect_category_faceted_position} hidden-lg-up{/if}">
			<div class="filter-button">
				<button id="search_center_filter_toggler" data-toggle="slide-bar" data-position='left' data-target="#slide-bar-facetssearch">
					<i class="fa fa-filter"></i> {l s='Filter' d='Shop.Theme.Actions'}
				</button>
			</div>
		</div>
    {/if}
    
    {foreach from=$listing.pagination.pages item=sort_order name=sort_order_name}
        {if $sort_order.current}
			{if $smarty.foreach.sort_order_name.first}
				{if !$sort_order.url|strpos:"?"}
					{$sort_order.url="`$sort_order.url`?page=1"}
				{/if}
			{/if}
            {assign var="currentSortUrl" value=$sort_order.url|regex_replace:"/&productListView=(grid|list)/":""}
            {if isset($nrt_themect_category_product_infinite) && $nrt_themect_category_product_infinite}
            	{assign var="currentSortUrl" value=$currentSortUrl|regex_replace:"/page=\d+/":"page=1"}
            {/if}
            {break}
        {/if}
    {/foreach}
    
    {if isset($currentSortUrl)}
        <div class="click-product-list-grid">
            <div class="lable">
                {l s="View as:"}
            </div>
            <a href="{$currentSortUrl}&productListView=grid" class="click-product-grid {if !$nrt_themect_category_default_view}active_view{/if} {['js-search-link' => true]|classnames}" title="{l s='Grid'}">
            	<i class="fa fa-th"></i>
            </a>
            <a href="{$currentSortUrl}&productListView=list" class="click-product-list {if $nrt_themect_category_default_view}active_view{/if} {['js-search-link' => true]|classnames}" title="{l s='List'}">
            	<i class="fa fa-th-list"></i>
            </a>
        </div>
    {/if}
	
	<div class="box-sort-by">
	  {block name='sort_by'}
		{include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
	  {/block}
	</div>
    {if isset($nrt_themect_category_product_infinite) && $nrt_themect_category_product_infinite}
		<div class="total-products hidden-sm-down">
		   <p>{l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=['%from%' => 1 ,'%to%' => $listing.pagination.items_shown_to, '%total%' => $listing.pagination.total_items]}</p>
		</div>
	{else}
		<div class="total-products hidden-sm-down">
		   <p>{l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=['%from%' => $listing.pagination.items_shown_from ,'%to%' => $listing.pagination.items_shown_to, '%total%' => $listing.pagination.total_items]}</p>
		</div>
	{/if}
</div>
