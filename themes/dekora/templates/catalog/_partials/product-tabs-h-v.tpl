<div id="wrapper-tab-product" class="tabs{if isset($nrt_themect_product_tabs_type) && $nrt_themect_product_tabs_type == 1} product-horizontal-tabs{elseif isset($nrt_themect_product_tabs_type) && $nrt_themect_product_tabs_type == 2} product-vertical-tabs{/if} clearfix">
	<div class="box-nav-tab">	
		<div class="dropdown-toggle-nav-tab hidden-lg-up">
			{if $product.description}
				{l s='Description' d='Shop.Theme.Catalog'}
			{else}
				{l s='Product Details' d='Shop.Theme.Catalog'}
			{/if}
		</div> 
		<ul class="nav nav-tabs dropdown-menu-nav-tab" role="tablist">
			{if $product.description}
				<li class="nav-item">
					<a
						class="nav-link{if $product.description} active{/if}"
						data-toggle="tab"
						href="#description"
						role="tab"
						aria-controls="description"
						{if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Catalog'}</a>
				</li>
			{/if}
			<li class="nav-item">
				<a
					class="nav-link{if !$product.description} active{/if}"
					data-toggle="tab"
					href="#product-details-tab-content"
					role="tab"
					aria-controls="product-details"
					{if !$product.description} aria-selected="true"{/if}>{l s='Product Details' d='Shop.Theme.Catalog'}</a>
			</li>
			{if $product.attachments}
				<li class="nav-item">
					<a
						class="nav-link"
						data-toggle="tab"
						href="#attachments"
						role="tab"
						aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
				</li>
			{/if}
			{foreach from=$product.extraContent item=extra key=extraKey}
				<li class="nav-item">
					<a
						class="nav-link"
						data-toggle="tab"
						href="#extra-{$extraKey}"
						role="tab"
						{foreach $extra.attr as $key => $val}{if $val} {$key}="{$val}"{/if}{/foreach}
						aria-controls="extra-{$extraKey}">{$extra.title}</a>
				</li>
			{/foreach}
		</ul>
	</div>  
	<div class="tab-content" id="tab-content">
		<div class="tab-pane {if $product.description} active{/if}" id="description" role="tabpanel">
			{block name='product_description'}
				<div class="product-description">
					{$product.description nofilter}
				</div>
				{hook h="displayProductPageBuilder"}
			{/block}
		</div>
		{block name='product_details'}
			<div class="tab-pane {if !$product.description} active{/if}" id="product-details-tab-content" role="tabpanel">
				{include file='catalog/_partials/product-details.tpl'}
			</div>
		{/block}
		{block name='product_attachments'}
			{if $product.attachments}
				<div class="tab-pane " id="attachments" role="tabpanel">
					<section class="product-attachments">
						<h3 class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</h3>
						{foreach from=$product.attachments item=attachment}
							<div class="attachment">
								<h4>{$attachment.name}</h4>
								<p>{$attachment.description}</p>
								<a class="btn btn-secondary" href="{url entity='attachment' params=['id_attachment' =>  $attachment.id_attachment]}">
									{l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
								</a>
							</div>
						{/foreach}
					</section>
				</div>
			{/if}
		{/block}
		{foreach from=$product.extraContent item=extra key=extraKey}
			<div class="tab-pane {$extra.attr.class}" 
				 id="extra-{$extraKey}"  
				 {foreach $extra.attr as $key => $val}{if $val} {$key}="{$val}"{/if}{/foreach}
				 role="tabpanel">
			   {$extra.content nofilter}
			</div>
		{/foreach}
	</div>
</div>