<div class="item-inner">
 <div class="js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
 	<div class="left-product">
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
    </div>  
    <div class="right-product">  
        <div class="product-description">
            {block name='product_name'}
                <div class="product_name">
					<a href="{$product.url}" title="{$product.name}">{$product.name}</a>
                </div>   
            {/block}
            {hook h='displayProductListReviews' product=$product} 			
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
    </div>
  </div>
</div>