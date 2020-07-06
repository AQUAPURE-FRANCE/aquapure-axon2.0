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
<div id="quickview-modal-{$product.id}-{$product.id_product_attribute}" class="modal quickview" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
   <div class="modal-content">
     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
     	<span aria-hidden="true">&times;</span>
     </button>
     <div class="modal-body">
      <div class="row row-quickview">
        <div class="left-quickview col-md-6">
           <div class="js-wrapper-scroll no_grid">
              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
          </div>
        </div>
        <div class="right-quickview col-md-6">
          	<h1 class="name_detail">{$product.name}</h1>
			{hook h='displayProductCommentExtra'}
			{block name='product_prices'}
				{include file='catalog/_partials/product-prices.tpl'}
			{/block}
			{block name='product_description_short'}
				<div class="product-description-short-detail" itemprop="description">
					{$product.description_short nofilter}
				</div>
			{/block}
			{block name='product_images_modal'}
				{include file='catalog/_partials/product-images-modal.tpl'}
			{/block} 
		  <div class="product-information">
			  {block name='product_buy'}
				<div class="product-actions">
				  <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
					<input type="hidden" name="token" value="{$static_token}">
					<input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
					<input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
					{block name='product_variants'}
					  {include file='catalog/_partials/product-variants.tpl'}
					{/block}
					{block name='product_add_to_cart'}
					  {include file='catalog/_partials/product-add-to-cart.tpl'}
					{/block}
					{block name='product_refresh'}{/block}
				</form>
			  </div>
			{/block}
			{hook h='displayProductAdditionalInfo' product=$product}
			{hook h='displayMultiAccessoriesProduct' mod='hsmultiaccessoriespro'}
		</div>	
        </div>
      </div>
     </div>
   </div>
 </div>
</div>