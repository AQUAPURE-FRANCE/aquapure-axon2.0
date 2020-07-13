{block name='product_flags'}
	<ul class="label-flags">
	  {foreach from=$product.flags item=flag}
		{if $flag.type == 'discount'}
			{if !$product.on_sale}
				<li class="label-flag type-{$flag.type}">
					<span>
						{$flag.label}
					</span>
				</li>
			{/if}
		{elseif $flag.type == 'new'}
			{if isset($product.show_condition) && isset($product.condition.type) && $product.show_condition}
				<li class="label-flag type-{$flag.type}">
					<span>
						{if $product.condition.type == 'refurbished'}
							{l s='Refurbished'}
						{elseif $product.condition.type == 'used'}
							{l s='Used'}
						{else}
							{l s='New'}
						{/if} 
					</span>
				</li>	
			{/if}
		{elseif $flag.type == 'on-sale'}
			<li class="label-flag type-{$flag.type}">
				<span>
					{l s='Sale'}
				</span>
			</li>
		{else}
			<li class="label-flag type-{$flag.type}">
				<span>
					{$flag.label}
				</span>
			</li>
		{/if}
	  {/foreach}
	</ul>
{/block}