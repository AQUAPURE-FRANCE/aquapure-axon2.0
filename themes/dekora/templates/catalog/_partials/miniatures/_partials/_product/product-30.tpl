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
 * {Context::getContext()->link->getCategoryLink($product.id_category_default, $product.category)}
 * {Context::getContext()->link->getManufacturerLink($product.id_manufacturer, Tools::link_rewrite($product.manufacturer_name))}
 *}
	 
<div class="item-product-list">
	<div class="js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
		<div class="left-product">
			<div class="left-product-content">
				<div class="item-images js-owl-images owl-carousel owl-theme" data-item='1' data-margin='0'>
					<a href="{$product.url}" title="{$product.name}">
						<div class="img-placeholder {$imageType}">
							{if $product.cover}
								{$image = $product.cover}
							{else}
								{$image = $urls.no_picture_image}
							{/if}
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
					</a> 
					{foreach from=$product.images item=image}
						{if $image.bySize.{$imageType}.url != $product.cover.bySize.{$imageType}.url}
							<a href="{$product.url}" title="{$product.name}">
								<div class="img-placeholder {$imageType}">
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
							</a>
						{/if}
					{/foreach}           
				</div>
				<a href="{$product.url}" title="{$product.name}">
					{include file='catalog/_partials/miniatures/flags.tpl'}
					{if $product.show_price && $product.has_discount}
						{hook h='displayCountDown'} 
					{/if}
				</a>
			</div>
		</div>
		<div class="right-product">   
			<div class="right-product-1"> 
				<div class="info-product">
					<span>{l s='SKU'}: </span>
					<span>
						{if isset($product.reference_to_display) && $product.reference_to_display neq ''}
							{$product.reference_to_display}
						{else}
							{l s='N/A'}
						{/if}
					</span>
				</div>
				<div class="info-product">
					<span>{l s='Brand'}: </span>
					{if isset($product.manufacturer_name) && $product.manufacturer_name neq ''}
						<a href="{Context::getContext()->link->getManufacturerLink($product.id_manufacturer, Tools::link_rewrite($product.manufacturer_name))}" title="{$product.manufacturer_name}">
							{$product.manufacturer_name}
						</a>
					{else}
						<span>
							{l s='N/A'}
						</span>
					{/if}
				</div>
				<div class="description-product">
					{hook h='displayProductListReviews' product=$product}
					<div class="product_name">
						<a href="{$product.url}" title="{$product.name}">
							{$product.name}
						</a>
					</div>  
					{if $product.show_price}
					  <div class="product-price-and-shipping hidden-md-up">
						{hook h='displayProductPriceBlock' product=$product type="before_price"}
						<span class="price">{$product.price}</span>
						{if $product.has_discount}
						  {hook h='displayProductPriceBlock' product=$product type="old_price"}
						  <span class="regular-price">{$product.regular_price}</span>
						{/if}
						{hook h='displayProductPriceBlock' product=$product type='unit_price'}
						{hook h='displayProductPriceBlock' product=$product type='weight'}
					  </div>
					{/if}		
				</div>

				<div class="decriptions-short">
					{$product.description_short nofilter}
				</div>

				{if $product.main_variants}
					<div class="variant-links-list">
					  {hook h='displayVariant' tpl_product = 0 imageType = $imageType} 
					</div>
				{/if}	
			</div> 
			<div class="right-product-2"> 
				{if $product.show_price}
				  <div class="product-price-and-shipping hidden-sm-down">
					{hook h='displayProductPriceBlock' product=$product type="before_price"}
					<span class="price">{$product.price}</span>
					{if $product.has_discount}
					  {hook h='displayProductPriceBlock' product=$product type="old_price"}
					  <span class="regular-price">{$product.regular_price}</span>
					{/if}
					{hook h='displayProductPriceBlock' product=$product type='unit_price'}
					{hook h='displayProductPriceBlock' product=$product type='weight'}
				  </div>
				{/if}
				<form action="{$urls.pages.cart}" method="post">
					{if !$configuration.is_catalog && 
						$product.add_to_cart_url && ($product.quantity > 0 || $product.allow_oosp)}
						{if !$product.id_product_attribute}
						<input type="hidden" name="token" value="{$static_token}">
						<input type="hidden" name="id_product" value="{$product.id}">
						<div class="input-group hidden input-group-add-cart bootstrap-touchspin">
							<span class="input-group-btn">
								<button class="qty-down bootstrap-touchspin-down" type="button">
									-
								</button>
							</span>
							<input type="number"
								   name="qty"
								   value="{$product.minimal_quantity}"
								   class="js-number-qty form-control"
								   data-min="{$product.minimal_quantity}"
							>
							<span class="input-group-btn">
								<button class="qty-up bootstrap-touchspin-up" type="button">
									+
								</button>
							</span>
						</div>
						<a 	href="javascript:void(0)" 
							class="btn btn-primary add-to-cart" data-button-action="add-to-cart" 
							title="{l s='Add to cart' d='Shop.Theme.Actions'}">
							{l s='Add to cart' d='Shop.Theme.Actions'}
						</a>
						{else}
							<a 	href="javascript:void(0)" 
								class="btn btn-primary add-to-cart quick-view" data-link-action="quickview" 
								title="{l s='Select options' d='Shop.Theme.Actions'}">
								{l s='Select options' d='Shop.Theme.Actions'}

							</a>  
						{/if}
					{else}
						<a  href="{$product.url}" 
							class="btn btn-primary add-to-cart" title="{l s='Discover'}">
							{l s='Discover'}
						</a>
					{/if}
				</form>
				<div class="button-action-botom">
					<a href="javascript:void(0)" class="button-action quick-view" data-link-action="quickview" title="{l s='Quick view' d='Shop.Theme.Actions'}">
						<i class="fa fa-eye"></i>
					</a>
					{hook h='displayButtonWishList' product=$product}
					{hook h='displayButtonCompare' product=$product}
				</div>
				{if !$configuration.is_catalog}
					{if $product.show_availability && $product.availability_message}
						{if $product.availability == 'available'}
							<div class="product-availability-list type-available">
								<i class="fa fa-check"></i>
								{$product.availability_message}
							</div>
						{elseif $product.availability == 'last_remaining_items'}
							<div class="product-availability-list type-last-remaining-items">
								<i class="fa fa-warning"></i>
								{$product.availability_message}
							</div>
						{else}
							<div class="product-availability-list type-out-stock">
								<i class="fa fa-ban"></i>
								{$product.availability_message}
							</div>
						{/if}
					{/if}
				{/if}
			</div>
		</div>           
	</div>
</div>	