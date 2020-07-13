<div id="slide-bar-account" class="slide-bar-account slide-bar slide-bar-right">
	<div class="sb-content">
		{if !Context::getContext()->customer->isLogged()}
			<form action="index.php?controller=authentication?back={$urls.current_url|urlencode}" method="post">
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
					<label class="mdl-textfield__label required">
						{l s='Email'}
					</label>
					<input class="mdl-textfield__input" name="email" type="email" value="" required>
				</div>
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label input-group">
					<label class="mdl-textfield__label required">
						{l s='Password'}
					</label>
					<input class="mdl-textfield__input js-child-focus js-visible-password" name="password" type="password" value="" pattern=".{literal}{{/literal}5,{literal}}{/literal}" required>
					<button type="button" data-action="show-password" data-text-show="{l s='Show' d='Shop.Theme.Actions'}" data-text-hide="{l s='Hide' d='Shop.Theme.Actions'}">
						{l s='Show' d='Shop.Theme.Actions'}
					</button>
				</div>  
				<div class="clearfix">
					<input name="submitLogin" value="1" type="hidden">
					<button class="btn btn-full btn-outline-primary" data-link-action="sign-in" type="submit">
						{l s='Sign in' d='Shop.Theme.Actions'}
					</button>
				</div>
				<div class="forgot-password">
					<a href="{$urls.pages.password}" rel="nofollow">
						{l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
					</a>
				</div>
			  </form>
			  <div class="no-account">
				<span>{l s='No account?' d='Shop.Theme.Customeraccount'}</span>  
				<a class="active-color" href="{$urls.pages.register}">
				  {l s='Create one here' d='Shop.Theme.Customeraccount'}
				</a>
			  </div>
			  <div class="text-center">
				   {hook h='displaySocialLogin'}
			  </div>
		  {else}
			<div class="sb-account-info">
				<p>
					<a href="{$urls.pages.my_account}" title="{l s='My Account'}"> 
						 <i class="zmdi zmdi-account-circle"></i>
					</a>
					<a href="{$urls.pages.my_account}" title="{l s='My Account'}"> 
						 {l s='Hi'} {Context::getContext()->customer->firstname} {Context::getContext()->customer->lastname}
					</a>
				</p>	
				<p>
					<a href="{$urls.actions.logout}" title="{l s='Sign out' d='Shop.Theme.Actions'}">
						{l s='Sign out' d='Shop.Theme.Actions'}
					</a>
				</p>
			</div>
		{/if}

		{hook h='displayMyAccountSideBar'}
		{if Context::getContext()->customer->isLogged()}
			<a class="sb-item" href="{$urls.pages.identity}" title="{l s='Information' d='Shop.Theme.Customeraccount'}">
				<i class="zmdi zmdi-account"></i>
				<span>
					{l s='Information' d='Shop.Theme.Customeraccount'}
				</span>
			</a>
			{if $customer.addresses|count}
				<a class="sb-item" href="{$urls.pages.addresses}" title="{l s='Addresses' d='Shop.Theme.Customeraccount'}">
					<i class="zmdi zmdi-pin"></i>
					<span>
						{l s='Addresses' d='Shop.Theme.Customeraccount'}
					</span>
				</a>
			{else}
				<a class="sb-item" href="{$urls.pages.address}" title="{l s='Add first address' d='Shop.Theme.Customeraccount'}">
					<i class="zmdi zmdi-pin"></i>
					<span>	
						{l s='Add first address' d='Shop.Theme.Customeraccount'}
					</span>
				</a>
			{/if}
			{if !$configuration.is_catalog}
				<a class="sb-item" href="{$urls.pages.history}" title="{l s='Order history and details' d='Shop.Theme.Customeraccount'}">
					<i class="zmdi zmdi-calendar-note"></i>
					<span>
						{l s='Order history and details' d='Shop.Theme.Customeraccount'}
					</span>
				</a>
			{/if}
			{if !$configuration.is_catalog}
				<a class="sb-item" href="{$urls.pages.order_slip}" title="{l s='Credit slips' d='Shop.Theme.Customeraccount'}">
					<i class="zmdi zmdi-receipt"></i>
					<span>
						{l s='Credit slips' d='Shop.Theme.Customeraccount'}
					</span>
				</a>
			{/if}
			{if $configuration.voucher_enabled && !$configuration.is_catalog}
				<a class="sb-item" href="{$urls.pages.discount}" title="{l s='Vouchers' d='Shop.Theme.Customeraccount'}">
					<i class="zmdi zmdi-label"></i>
					<span>
						{l s='Vouchers' d='Shop.Theme.Customeraccount'}
					</span>
				</a>
			{/if}
			{if $configuration.return_enabled && !$configuration.is_catalog}
				<a class="sb-item" href="{$urls.pages.order_follow}" title="{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}">
					<i class="zmdi zmdi-assignment-return"></i>
					<span>
						{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
					</span>
				</a>
			{/if}
		{/if}
		<a 	class="sb-item" href="{$urls.pages.contact}" title="{l s='Contact us' d='Shop.Theme.Global'}">
			<i class="zmdi zmdi-email"></i>
			<span>
				{l s='Contact us' d='Shop.Theme.Global'}
			</span>
		</a>
		{if Module::isInstalled('ps_languageselector') && Module::isEnabled('ps_languageselector')}
			{widget_block name="ps_languageselector"}
				{if ($languages|count) > 1}
					<div class="dropdown">
						<div class="sb-item" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">
							<img src="{$urls.img_lang_url}{$current_language.id_lang}.jpg" alt="{$current_language.name_simple}" width="16" height="11" />
							<span>
								{$current_language.name_simple}
							</span>	
						</div>
						<ul class="dropdown-menu">
							{foreach from=$languages item=language}
								<li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
									<a href="{url entity='language' id=$language.id_lang}">
										<img src="{$urls.img_lang_url}{$language.id_lang}.jpg" alt="{$language.iso_code}" width="16" height="11" />
									{$language.name_simple}
									</a>
								</li>
							{/foreach}
						</ul>
					</div>
				{/if}
			{/widget_block}
		{/if}
		{if Module::isInstalled('ps_currencyselector') && Module::isEnabled('ps_currencyselector')}
			{widget_block name="ps_currencyselector"}
				{if (!Configuration::isCatalogMode() && Currency::isMultiCurrencyActivated())}
					<div class="dropdown">
						<div class="sb-item" data-toggle="dropdown" aria-haspopup="true" role="tabpanel" aria-expanded="false">
							<i class="zmdi zmdi-money-box"></i>
							<span>
								{$current_currency.iso_code} {$current_currency.sign}
							</span>	
						</div>
						<ul class="dropdown-menu">
						  {foreach from=$currencies item=currency}
							<li {if $currency.current} class="current" {/if}>
								<a title="{$currency.name}" rel="nofollow" href="{$currency.url}">
									{$currency.iso_code} {$currency.sign}
								</a>
							</li>
						  {/foreach}
						</ul>
					</div>
				{/if}
			{/widget_block}
		{/if}
	</div>
</div>