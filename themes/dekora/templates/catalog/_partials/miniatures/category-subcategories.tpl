{if isset($subcategories) && $subcategories}

	{$sc_imageType	= 'category_default'}

	{if isset($nrt_themect_category_sub_image_type)}
		{$sc_imageType = $nrt_themect_category_sub_image_type}
	{/if}

	<div class="container container-parent">
    	<div class="product-list-subcategories hidden-sm-down">
            <div class="row">
                {foreach from=$subcategories item=subcategory}
                    <div class="col-4 col-sm-4 col-md-3 col-lg-2">
						<div class="subcategory-image">
							<a href="{$subcategory.url}">
								<div class="img-placeholder {$sc_imageType}">
									{if $subcategory.image.bySize.{$sc_imageType}.url}
										<img
											class="img-loader lazy-load" 
											data-src="{$subcategory.image.bySize.{$sc_imageType}.url}"
											src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
											alt="{$subcategory.name}"
											title="{$subcategory.name}"
											width="{$subcategory.image.bySize.{$sc_imageType}.width}"
											height="{$subcategory.image.bySize.{$sc_imageType}.height}" 
										>
									{/if}
								</div>
							</a> 
						</div>
                        <a class="subcategory-name" href="{$subcategory.url}">{$subcategory.name}</a>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
{/if}
