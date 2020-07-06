<div id="wrapper-tab-product" class="product-accordion-tabs clearfix">

	{if $product.description}    
		<div class="accordion-tab-title" data-target="#description" data-toggle="collapse" aria-expanded="true" role="tabpanel">
			<span class="accordion-tab-toggler navbar-toggler collapse-icons">
				<i class="zmdi zmdi-chevron-up add"></i>
				<i class="zmdi zmdi-chevron-down remove"></i>
			</span>
			<h4>{l s='Description' d='Shop.Theme.Catalog'}</h4>
		</div>
		<div id="description" class="accordion-tab-content collapse in">
			{block name='product_description'}
				<div class="product-description">
					{$product.description nofilter}
				</div>
				{hook h="displayProductPageBuilder"}
			{/block}
		</div>
	{/if}
  
	<div class="accordion-tab-title" data-target="#product-details-tab-content" data-toggle="collapse"{if !$product.description || $nrt_themect_product_tabs_type == 4} aria-expanded="true" role="tabpanel"{/if}>
		<span class="accordion-tab-toggler navbar-toggler collapse-icons">
			<i class="zmdi zmdi-chevron-up add"></i>
			<i class="zmdi zmdi-chevron-down remove"></i>
		</span>
		<h4>{l s='Product Details' d='Shop.Theme.Catalog'}</h4>
	</div>
	<div id="product-details-tab-content" class="accordion-tab-content collapse{if !$product.description || $nrt_themect_product_tabs_type == 4} in{/if}">
	   {block name='product_details'}
		   {include file='catalog/_partials/product-details.tpl'}
	   {/block}
	</div>
      
	{if $product.attachments}
		<div class="accordion-tab-title" data-target="#attachments" data-toggle="collapse" {if $nrt_themect_product_tabs_type == 4} aria-expanded="true" role="tabpanel"{/if}>
		  <span class="accordion-tab-toggler navbar-toggler collapse-icons">
			<i class="zmdi zmdi-chevron-up add"></i>
			<i class="zmdi zmdi-chevron-down remove"></i>
		  </span>
		  <h4>{l s='Attachments' d='Shop.Theme.Catalog'}</h4>
		</div>
		<div id="attachments" class="accordion-tab-content collapse{if $nrt_themect_product_tabs_type == 4} in{/if}">
			<div class="product-attachments">
			<h3 class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</h3>
			{foreach from=$product.attachments item=attachment}
			 <div class="attachment">
			   <h4>{$attachment.name}</h4>
			   <p>{$attachment.description}</p>
			   <a class="btn btn-secondary" href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
				 {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
			   </a>
			 </div>
			{/foreach}
			</div>
		</div>
	{/if}
  
  {foreach from=$product.extraContent item=extra key=extraKey}    
      <div class="accordion-tab-title" data-target="#extra-{$extraKey}" data-toggle="collapse"{if $nrt_themect_product_tabs_type == 4} aria-expanded="true" role="tabpanel"{/if} {foreach $extra.attr as $key => $val}{if $val} {$key}="{$val}"{/if}{/foreach}>
          <span class="accordion-tab-toggler navbar-toggler collapse-icons">
            <i class="zmdi zmdi-chevron-up add"></i>
            <i class="zmdi zmdi-chevron-down remove"></i>
          </span>
          <h4>{$extra.title}</h4>
      </div>
      <div id="extra-{$extraKey}" class="accordion-tab-content {$extra.attr.class} collapse{if $nrt_themect_product_tabs_type == 4} in{/if}" {foreach $extra.attr as $key => $val}{if $val} {$key}="{$val}"{/if}{/foreach}>
         {$extra.content nofilter}
      </div>   
  {/foreach}
  
</div>