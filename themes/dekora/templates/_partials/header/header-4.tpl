<div id="header-desktop" class="hidden-md-down">
	<div id="header-top-before">
		{hook h='displayBanner'}
		{hook h='displayHeader4Banner'}
	</div>
    <div id="header-top">
        <div>
			<div class="wrapper-header-top">
				<div class="nav-top-left">
					{hook h='displayNav'}
					{hook h='displayHeader4Nav'}
				</div>
				<div class="nav-top-center">
					<div class="header-logo">
						<a href="{$urls.pages.index}"> 
							{if isset($nrt_themect_logo_md) && $nrt_themect_logo_md}
								<img class="logo_home img-responsive" src="{$nrt_themect_logo_md}" alt="{$shop.name}" title="{$shop.name}"/>
							{else}
								<img class="logo_home img-responsive" src="{$link->getMediaLink($shop.logo)}" alt="{$shop.name}" title="{$shop.name}"/>
							{/if}
						</a>
					</div>	
					{hook h='displayNav1'}
					{hook h='displayHeader4Nav1'}
				</div>
				<div class="nav-top-right">
					{hook h='displayNav2'}
					{hook h='displayHeader4Nav2'}
				</div>
			</div>
        </div>
    </div>
    <div id="header-middle">
        <div>
			<div class="wrapper-header-middle">
				<div class="header-top">
					{hook h='displayTop'}
					{hook h='displayHeader4Top'}
				</div>
			</div>
        </div>
    </div>
    <div id="header-bottom">
        <div class="container container-parent">
			<div class="wrapper-header-bottom">
				{hook h='displayMenuHorizontal'}
				<div class="sticky-right">
					{hook h='displayListIconStickyDesktop'}
				</div>
			</div>	
        </div>
    </div>
	{hook h='displayNavFullWidth'}
</div>