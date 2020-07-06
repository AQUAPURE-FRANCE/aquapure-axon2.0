<div id="product-details" data-product="{$product.embedded_attributes|json_encode}">
  {block name='product_reference'}
    {if isset($product_manufacturer->id)}
      <div class="product-manufacturer" itemprop="brand" itemscope itemtype="https://schema.org/Brand">
        {if isset($manufacturer_image_url)}
          <a itemprop="url" href="{$product_brand_url}">
            <img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo" alt="{$product_manufacturer->name}">
          </a>
        {else}
          <label class="label">{l s='Brand' d='Shop.Theme.Catalog'}</label>
          <a itemprop="url" href="{$product_brand_url}"><span>{$product_manufacturer->name}</span></a>
        {/if}
		<meta itemprop="name" content="{$product_manufacturer->name}">  
      </div>
	{else}
		<meta itemprop="brand" content="{l s='N/A'}">
    {/if}
	<div class="product-reference">
		<label class="label">{l s='Reference' d='Shop.Theme.Catalog'}</label>
		<span itemprop="sku">
			{if isset($product.reference_to_display) && $product.reference_to_display neq ''}
				{$product.reference_to_display}
			{else}
				{l s='N/A'}
			{/if}
		</span>
	</div>
  {/block}
	
  {block name='product_quantities'}
    {if $product.show_quantities}
      <div class="product-quantities">
        <label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
        <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label}</span>
      </div>
    {/if}
  {/block}

  {block name='product_availability_date'}
    {if $product.availability_date}
      <div class="product-availability-date">
        <label class="label">{l s='Availability date:' d='Shop.Theme.Catalog'}</label>
        <span>{$product.availability_date}</span>
      </div>
    {/if}
  {/block}
	
  {block name='product_condition'}
    {if $product.condition}
      <div class="product-condition">
        <label class="label">{l s='Condition' d='Shop.Theme.Catalog'}</label>
        <link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
        <span>{$product.condition.label}</span>
      </div>
    {/if}
  {/block}
	
  {block name='product_out_of_stock'}
    <div class="product-out-of-stock">
      {hook h='actionProductOutOfStock' product=$product}
    </div>
  {/block}
	
  {block name='product_features'}
    {if $product.grouped_features}
      <section class="product-features">
        <h3 class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</h3>
        <dl class="data-sheet">
          {foreach from=$product.grouped_features item=feature}
            <dt class="name">{$feature.name}</dt>
            <dd class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
          {/foreach}
        </dl>
      </section>
    {/if}
  {/block}
	
  {* if product have specific references, a table will be added to product details section *}
  {block name='product_specific_references'}
    {if !empty($product.specific_references)}
      <section class="product-features">
        <h3 class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</h3>
          <dl class="data-sheet">
            {foreach from=$product.specific_references item=reference key=key}
              <dt class="name">{$key}</dt>
              <dd class="value">{$reference}</dd>
            {/foreach}
          </dl>
      </section>
    {/if}
  {/block}
</div>
