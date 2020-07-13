<div class="currency-selector dropdown">
    <div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">
		<span>{$currency.sign}</span>
		{$current_currency.iso_code}
		<i class="fa fa-angle-down"></i>
	</div>
    <div class="dropdown-menu">
		{foreach from=$currencies item=currency}
			<a title="{$currency.name}" rel="nofollow" href="{$currency.url}">
				{$currency.iso_code} {$currency.sign}
			</a>
		{/foreach}
    </div>
</div>