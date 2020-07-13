{if Module::isInstalled('nrtwishlist') && Module::isEnabled('nrtwishlist') && !Context::getContext()->customer->isLogged()}
	<div id="slide-bar-login-wishlist" class="slide-bar-account slide-bar slide-bar-right" >
		<div class="sb-content">
			<div class="title-top">
				<i class="fto fto-heart"></i>
				<span>{l s='Please login first'}</span>
			</div>
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
		</div>
	</div>
{/if}