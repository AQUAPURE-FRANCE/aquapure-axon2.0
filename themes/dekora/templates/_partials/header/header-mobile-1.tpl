<div id="header-mobile" class="hidden-lg-up">{**Mobile-Nav*}
	<div id="nav-mobile">
		<div id="nav-mobile-content">
			{hook h='displayListIconMobile'}
			<a class="btn-side-bar btn-side-bar-maps" href="{$urls.pages.contact}" title="{l s='Maps' d='Shop.Theme.Global'}" data-title-mobile="{l s='Maps' mod='Shop.Theme.Global'}">
				<i class="fa fa-map-marker"></i>
				{l s='Maps' d='Shop.Theme.Global'}
			</a> 
		</div>
	</div>
</div>{**End-Mobile-Nav*}
<div id="header-mobile-logo" class="hidden-lg-up text-center">
	<a href="{$urls.pages.index}"> 
		{if isset($nrt_themect_logo_xs) && $nrt_themect_logo_xs}
			<img class="logo_home img-responsive" src="{$nrt_themect_logo_xs}" alt="{$shop.name}"/>
		{else}
			<img class="logo_home img-responsive" src="{$link->getMediaLink($shop.logo)}" alt="{$shop.name}"/>
		{/if}
	</a>
</div>