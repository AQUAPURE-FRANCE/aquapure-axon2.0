<div class="item-inner">
 <div class="js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
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
			{include file='catalog/_partials/miniatures/flags.tpl'}
		</a> 
		<div class="button-action-product">
			<form action="{$urls.pages.cart}" method="post">
				<a href="javascript:void(0)" class="button-action quick-view" data-link-action="quickview" title="{l s='Quick view' d='Shop.Theme.Actions'}">
					<i class="fa fa-search"></i>
				</a>
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
							title="{l s='Add to cart' d='Shop.Theme.Actions'}">
							<i class="fa fa-shopping-basket"></i>
						</a>
					  {else}
						<a 	href="javascript:void(0)" 
							class="button-action add-to-cart quick-view" data-link-action="quickview" 
							title="{l s='Select options' d='Shop.Theme.Actions'}">
							<i class="fa fa-shopping-basket"></i>
						</a>       
					  {/if}
				  {else}
					<a  href="{$product.url}" 
						class="button-action add-to-cart" title="{l s='Discover'}">
						<i class="fa fa-shopping-basket"></i>
					</a>
				  {/if}

				{hook h='displayButtonWishList' product=$product}
				{hook h='displayButtonCompare' product=$product}
			</form>
		</div> 	
    </div>  
    <div class="right-product">  
        <div class="product-description">	
            {block name='product_name'}
                <h4 class="product_name">
					<a href="{$product.url}" title="{$product.name}">{$product.name}</a>
                </h4>   
            {/block}
			<div class="decriptions-short">
				{$product.description_short nofilter}
			</div>
			<div class="info-product">
				{if $product.show_price}
				  <div class="product-price-and-shipping">
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
			{hook h='displayProductListReviews' product=$product}
        </div>
    </div>
  </div>
</div>