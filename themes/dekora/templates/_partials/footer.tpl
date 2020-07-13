<div id="footer"{if isset($nrt_themect_footer_collapse) && $nrt_themect_footer_collapse} class="footer_collapse"{/if}>    
	<div id="footer-top">
		{block name='hook_footer_before'}
			{hook h='displayFooterBefore'}
		{/block}
	</div>
	<div id="footer-middle">
		{block name='hook_footer'}
			{hook h='displayFooter'}
		{/block}
	</div>
	<div id="footer-bottom">
		<div class="container container-parent">
			<div class="row">
				{block name='hook_footer_after'}
					{hook h='displayFooterAfter'}
				{/block}
			</div>
		</div>
	</div>
</div>