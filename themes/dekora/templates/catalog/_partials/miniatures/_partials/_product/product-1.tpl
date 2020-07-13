<div class="item-inner">
	<div class="js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
		<div class="row">
			<div class="col-md-6 col-lg-5">
				<div class="left-product">
					<a {if isset($product.images[1].bySize.{$imageType}.url) && $product.images[1].bySize.{$imageType}.url != $product.cover.bySize.{$imageType}.url}class="has-second-img"{/if} href="{$product.url}" title="{$product.name}">
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
							{if isset($product.images[1].bySize.{$imageType}.url) && $product.images[1].bySize.{$imageType}.url != $product.cover.bySize.{$imageType}.url}
								{$image = $product.images[1]}
								<img
									class="img-loader lazy-load" 
									data-src="{$image.bySize.{$imageType}.url}"
									src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
									alt="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
									title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}" 
									width="{$image.bySize.{$imageType}.width}"
									height="{$image.bySize.{$imageType}.height}"
								>
							{/if}
						</div>
					</a> 
				</div> 
			</div>
			<div class="col-md-6 col-lg-7"> 
				<div class="right-product">  
					<div class="product-description">
						{if isset($product.category_name) && $product.category_name neq ''}
							<div class="category-default">
								<a href="{Context::getContext()->link->getCategoryLink($product.id_category_default, Tools::link_rewrite($product.category_name))}" title="{$product.category_name}">
									{$product.category_name}
								</a>
							</div>	
						{/if}
						{block name='product_name'}
							<div class="product_name title_font">
								<a href="{$product.url}" title="{$product.name}">{$product.name}</a>
							</div>   
						{/block}	
						<div class="info-product">
							{if $product.show_price}
							  <div class="product-price-and-shipping title_font">
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
							{hook h='displayProductListReviews' product=$product}
						</div>	
						<div class="decriptions-short">
							{$product.description_short nofilter}
						</div>
						<div class="button-action-product">
							<form action="{$urls.pages.cart}" method="post">
								 {if !$configuration.is_catalog && $product.add_to_cart_url && ($product.quantity > 0 || $product.allow_oosp)}
									  {if !$product.id_product_attribute}
										<input type="hidden" name="token" value="{$static_token}">
										<input type="hidden" name="id_product" value="{$product.id}">
										<input type="number"
											   name="qty"
											   value="{$product.minimal_quantity}"
											   class="hidden"
											   min="{$product.minimal_quantity}"
										>
										<a 	href="javascript:void(0)" 
											class="button-action add-to-cart" data-button-action="add-to-cart" 
											title="{l s='Buy Now'}">
											{l s='Buy Now'}
										</a>
									  {else}
										<a 	href="javascript:void(0)" 
											class="button-action add-to-cart quick-view" data-link-action="quickview" 
											title="{l s='Select options'}">
											{l s='Select options'}
										</a>       
									  {/if}
								  {/if}
								<a  href="{$product.url}" class="button-action read-more" title="{l s='Read more'}">
									{l s='Read more'}
								</a>
							</form>
						</div> 	
					</div>
				</div>
			</div>
		</div>		
	</div>
</div>