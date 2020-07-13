{if isset($elementWidget.content.infinite)}
	{$productLayout = $elementWidget.content.view_type}
	{if $elementWidget.content.img_type} 
		{$imageType	= $elementWidget.content.img_type}
	{else}
		{$imageType	= 'home_default'}
	{/if}
	{foreach from=$elementWidget.content.products item="product"}
		<div class="item 
			 effect-transparent 		
			 col-xs-{((12/$elementWidget.content.optionsOwl.xs.line)*10/10)|round:1|replace:'.':'-'} 
			 col-sm-{((12/$elementWidget.content.optionsOwl.sm.line)*10/10)|round:1|replace:'.':'-'} 
			 col-md-{((12/$elementWidget.content.optionsOwl.md.line)*10/10)|round:1|replace:'.':'-'} 
			 col-lg-{((12/$elementWidget.content.optionsOwl.lg.line)*10/10)|round:1|replace:'.':'-'} 
			 col-xl-{((12/$elementWidget.content.optionsOwl.xl.line)*10/10)|round:1|replace:'.':'-'}">
			{include file='catalog/_partials/miniatures/product-loop.tpl' product=$product}
		</div>
	{/foreach}
{else}
<div class="infinite-products product-type-{$elementWidget.content.view_type} clearfix" data-infinite = '{$elementWidget.content.options}'>
{if $elementWidget.content.products|@count > 0} 
	{if $elementWidget.content.sort_order} 
		<div class="dropdown">
			<span class="label">{l s='Sort by:' mod='nrtpagebuilder'}</span>
			<div class="dropdown-infinite" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">
				{if $elementWidget.content.order_by == 'position' && 
					$elementWidget.content.order_way == 'ASC'}
					{l s='Relevance' mod='nrtpagebuilder'}
				{elseif $elementWidget.content.order_by == 'name' && 
						$elementWidget.content.order_way == 'ASC'}
					{l s='Name, A to Z' mod='nrtpagebuilder'}
				{elseif $elementWidget.content.order_by == 'name' && 
						$elementWidget.content.order_way == 'DESC'}
					{l s='Name, Z to A' mod='nrtpagebuilder'}
				{elseif $elementWidget.content.order_by == 'price' && 
						$elementWidget.content.order_way == 'ASC'}
					{l s='Price, low to high' mod='nrtpagebuilder'}
				{elseif $elementWidget.content.order_by == 'price' && 
						$elementWidget.content.order_way == 'DESC'}
					{l s='Price, high to low' mod='nrtpagebuilder'}
				{elseif $elementWidget.content.order_by == 'date_add' && 
						$elementWidget.content.order_way == 'ASC'}
					{l s='Date added, oldest to newest' mod='nrtpagebuilder'}
				{elseif $elementWidget.content.order_by == 'date_add' && 
						$elementWidget.content.order_way == 'DESC'}
					{l s='Date added, newest to oldest' mod='nrtpagebuilder'}
				{/if}
				
			</div>
			<div class="dropdown-menu">
				<a rel="nofollow" href="javascript:void(0)" 
				   data-sort-order='{literal}{"order_by":"position","order_way":"ASC"}{/literal}'>
					{l s='Relevance' mod='nrtpagebuilder'}
				</a>
				<a rel="nofollow" href="javascript:void(0)" 
				   data-sort-order='{literal}{"order_by":"name","order_way":"ASC"}{/literal}'>
					{l s='Name, A to Z' mod='nrtpagebuilder'}
				</a>
				<a rel="nofollow" href="javascript:void(0)" 
				   data-sort-order='{literal}{"order_by":"name","order_way":"DESC"}{/literal}'>
					{l s='Name, Z to A' mod='nrtpagebuilder'}
				</a>
				<a rel="nofollow" href="javascript:void(0)" 
				   data-sort-order='{literal}{"order_by":"price","order_way":"ASC"}{/literal}'>
					{l s='Price, low to high' mod='nrtpagebuilder'}
				</a>
				<a rel="nofollow" href="javascript:void(0)" 
				   data-sort-order='{literal}{"order_by":"price","order_way":"DESC"}{/literal}'> 
					{l s='Price, high to low' mod='nrtpagebuilder'}
				</a>
				<a rel="nofollow" href="javascript:void(0)" 
				   data-sort-order='{literal}{"order_by":"date_add","order_way":"ASC"}{/literal}'>
					{l s='Date added, oldest to newest' mod='nrtpagebuilder'}
				</a>
				<a rel="nofollow" href="javascript:void(0)" 
				   data-sort-order='{literal}{"order_by":"date_add","order_way":"DESC"}{/literal}'>
					{l s='Date added, newest to oldest' mod='nrtpagebuilder'}
				</a>
			</div> 
		</div>
	{/if}

	{$productLayout = $elementWidget.content.view_type}
	{if $elementWidget.content.img_type} 
		{$imageType	= $elementWidget.content.img_type}
	{else}
		{$imageType	= 'home_default'}
	{/if}
	<div class="container-infinite">
		<div class="sort-loader-icon" style="display:none;"><i class="fa fa-spinner fa-spin"></i></div>
		<div class="row-item row wrapper-infinite">
		{foreach from=$elementWidget.content.products item="product"}
			<div class="item 	
				 col-xs-{((12/$elementWidget.content.optionsOwl.xs.line)*10/10)|round:1|replace:'.':'-'} 
				 col-sm-{((12/$elementWidget.content.optionsOwl.sm.line)*10/10)|round:1|replace:'.':'-'} 
				 col-md-{((12/$elementWidget.content.optionsOwl.md.line)*10/10)|round:1|replace:'.':'-'} 
				 col-lg-{((12/$elementWidget.content.optionsOwl.lg.line)*10/10)|round:1|replace:'.':'-'} 
				 col-xl-{((12/$elementWidget.content.optionsOwl.xl.line)*10/10)|round:1|replace:'.':'-'}">
				{include file='catalog/_partials/miniatures/product-loop.tpl' product=$product}
			</div>
		{/foreach}
		</div> 
	</div>
	{if !$elementWidget.content.lastPage}
	<div class="ajax-load-wrapper">
		<div class="ajax-load-button title_font">
			<div class="btn widget-ajax-trigger">{l s='Load more' mod='nrtpagebuilder'}</div>
			<div class="btn ajax-loader" style="display:none;"><i class="fa fa-spinner fa-spin"></i>{l s='Loading' mod='nrtpagebuilder'}</div>
		</div>
	</div>
	{/if}
{else}
	<p class="alert_no_item alert alert-warning">
		{l s='No products at this time.' mod='nrtpagebuilder'}
	</p>
{/if}
</div> 
{/if}