{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
	 
{$imageType	= 'cart_default'}

{if isset($nrt_themect_orther_product_image_type) && $nrt_themect_orther_product_image_type}
	{$imageType = $nrt_themect_orther_product_image_type}
{/if}	
	 
<div class="product-line-grid row">
  <!--  product left content: image-->
  <div class="product-line-grid-img col-xs-4 col-md-2">
	  <div class="text-xs-center">
		<div class="img-placeholder {$imageType}">
			{$image = $product.cover}
			<img
				class="img-loader lazy-load" 
				data-src="{$image.bySize.{$imageType}.url}"
				src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
				alt="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
				title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}" 
				width="{$image.bySize.{$imageType}.width}"
				height="{$image.bySize.{$imageType}.height}"
			>
		</div>
	  </div>
  </div>

  <!--  product left body: description -->
  <div class="product-line-grid-info col-xs-8 col-md-4">
	<div class="product-line-info-wrapper">  
		<div class="product-line-info">
		  <a class="label" href="{$product.url}" data-id_customization="{$product.id_customization|intval}">{$product.name}</a>
		</div>

		<div class="product-line-info {if $product.has_discount}has-discount{/if}">
		  <div class="current-price">
			<span class="price">{$product.price}</span>
			{if $product.unit_price_full}
			  <div class="unit-price-cart">{$product.unit_price_full}</div>
			{/if}
		  </div>
		</div>

		{foreach from=$product.attributes key="attribute" item="value"}
		  <div class="product-line-info">
			<span class="label">{$attribute}:</span>
			<span class="value">{$value}</span>
		  </div>
		{/foreach}

		{if is_array($product.customizations) && $product.customizations|count}
		  {block name='cart_detailed_product_line_customization'}
			{foreach from=$product.customizations item="customization"}
			  <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
			  <div class="modal customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog" role="document">
				  <div class="modal-content">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>  
					<div class="modal-body">
					  <h4 class="modal-title">
						{l s='Product customization' d='Shop.Theme.Catalog'}
					  </h4>	
					  {foreach from=$customization.fields item="field"}
						<div class="product-customization-line row">
						  <div class="col-sm-5 col-xs-4 label">
							{$field.label}
						  </div>
						  <div class="col-sm-7 col-xs-8 value">
							{if $field.type == 'text'}
							  {if (int)$field.id_module}
								{$field.text nofilter}
							  {else}
								{$field.text}
							  {/if}
							{elseif $field.type == 'image'}
							  <img src="{$field.image.small.url}">
							{/if}
						  </div>
						</div>
					  {/foreach}
					</div>
				  </div>
				</div>
			  </div>
			{/foreach}
		  {/block}
		{/if}
	</div>  
  </div>

  <!--  product left body: description -->

  <div class="col-xs-6 col-md-3 product-line-grid-qty qty text-center">
	{if isset($product.is_gift) && $product.is_gift}
	  <span class="gift-quantity">{$product.quantity}</span>
	{else}
	  <div>
		  <div class="input-group bootstrap-touchspin">
			<span class="input-group-btn">
			  <button class="btn btn-touchspin js-touchspin js-increase-product-quantity bootstrap-touchspin-down" type="button">-</button>
			</span>
			<input
					class="js-cart-line-product-quantity form-control"
					data-down-url="{$product.down_quantity_url}"
					data-up-url="{$product.up_quantity_url}"
					data-update-url="{$product.update_quantity_url}"
					data-product-id="{$product.id_product}"
				    data-id-product="{$product.id_product}"
				    data-id-product-attribute="{$product.id_product_attribute}"
					type="number"
					value="{$product.quantity}"
					name="product-quantity-spin"
					min="{$product.minimal_quantity}"
			/>
			<span class="input-group-btn">
				<button class="btn btn-touchspin js-touchspin js-decrease-product-quantity bootstrap-touchspin-up" type="button">+</button>
			</span>
		  </div>
	  </div>
	{/if}
  </div>
	
  <div class="col-xs-4 col-md-2 product-line-grid-price price text-center">
	<span class="product-price">
	  <strong>
		{if isset($product.is_gift) && $product.is_gift}
		  <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
		{else}
		  {$product.total}
		{/if}
	  </strong>
	</span>
  </div>

  <div class="col-xs-2 col-md-1 product-line-grid-remove text-center">
	<div class="cart-line-product-actions">
	  {if !isset($product.is_gift) || !$product.is_gift}
		  <a
			  class                       = "remove-from-cart"
			  rel                         = "nofollow"
			  href                        = "{$product.remove_from_cart_url}"
			  data-link-action            = "delete-from-cart"
			  data-id-product             = "{$product.id_product|escape:'javascript'}"
			  data-id-product-attribute   = "{$product.id_product_attribute|escape:'javascript'}"
			  data-id-customization   	  = "{$product.id_customization|escape:'javascript'}"
		  >
			<i class="zmdi zmdi-close"></i>
		  </a>
	  {/if}
	  {block name='hook_cart_extra_product_actions'}
		{hook h='displayCartExtraProductActions' product=$product}
	  {/block}

	</div>
  </div>
</div>
