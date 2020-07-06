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

{$imageType	= 'home_default'}
	 
{if isset($nrt_themect_category_product_image_type)}
	{$imageType = $nrt_themect_category_product_image_type}
{/if}

{$productLayout = 0}

{if isset($nrt_themect_category_product_layout)}
	{$productLayout = $nrt_themect_category_product_layout}
{/if}

<div id="js-products-list">
	{if !$nrt_themect_category_default_view}
	  <div id="box-product-grid" class="products product-type-{$productLayout}">
		  <div class="row" data-button-action="add-product-infinite">
			{foreach from=$listing.products item="product"}
				<div class="item
				 col-xs-{((12/$nrt_themect_category_product_xs)*10/10)|round:1|replace:'.':'-'} 
				 col-sm-{((12/$nrt_themect_category_product_sm)*10/10)|round:1|replace:'.':'-'} 
				 col-md-{((12/$nrt_themect_category_product_md)*10/10)|round:1|replace:'.':'-'} 
				 col-lg-{((12/$nrt_themect_category_product_lg)*10/10)|round:1|replace:'.':'-'} 
				 col-xl-{((12/$nrt_themect_category_product_xl)*10/10)|round:1|replace:'.':'-'}">
					{include file='catalog/_partials/miniatures/product-loop.tpl' product=$product}
				</div>
			{/foreach}
		  </div>  
	  </div>
	{else}
		{$imageType	= 'home_default'}
		{if isset($nrt_themect_orther_product_large_image_type) && $nrt_themect_orther_product_large_image_type}
			{$imageType = $nrt_themect_orther_product_large_image_type}
		{/if}	
		<div id="box-product-list" class="products" data-button-action="add-product-infinite">
			{foreach from=$listing.products item="product"}
				{include file='catalog/_partials/miniatures/product-list.tpl' product=$product}
			{/foreach}
		</div>
	{/if}
</div>

