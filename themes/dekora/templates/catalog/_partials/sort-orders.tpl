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
<span class="sort-by hidden-md-down">{l s='Sort by:' d='Shop.Theme.Global'}</span>
<div class="products-sort-order dropdown">
  <div class="select-title" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">	  
    {if isset($listing.sort_selected) && $listing.sort_selected}{$listing.sort_selected}{else}{l s='Select' d='Shop.Theme.Actions'}{/if}
    <i class="fa fa-caret-down"></i>
  </div>
  <div class="dropdown-menu">
    {foreach from=$listing.sort_orders item=sort_order}
            {if $sort_order.current}
                {assign var="currentSortUrl" value=$sort_order.url|regex_replace:"/&resultsPerPage=\d+/":""}
            {/if}
      <a
        rel="nofollow"
        href="{$sort_order.url}"
        class="select-list {['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
      >
        {$sort_order.label}
      </a>
    {/foreach}
  </div>
</div>
{if isset($currentSortUrl)}
<div class="products-sort-order products-nb-per-page dropdown">
	<div class="select-title" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">	 	
        {if isset($nrt_themect_category_product_infinite) && $nrt_themect_category_product_infinite}
            {$listing.pagination.items_shown_to}
        {else}
        	{$listing.products|count}
        {/if}
        <i class="fa fa-caret-down"></i>
    </div>
    <div class="dropdown-menu">
        <a
                rel="nofollow"
                href="{$currentSortUrl}&resultsPerPage=12"
                class="select-list {['js-search-link' => true]|classnames}"
        >
            12
        </a>
        <a
                rel="nofollow"
                href="{$currentSortUrl}&resultsPerPage=24"
                class="select-list {['js-search-link' => true]|classnames}"
        >
            24
        </a>
        <a
                rel="nofollow"
                href="{$currentSortUrl}&resultsPerPage=36"
                class="select-list {['js-search-link' => true]|classnames}"
        >
            36
        </a>
    </div>
</div>
{/if}
