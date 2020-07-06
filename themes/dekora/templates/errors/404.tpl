{extends file='layouts/layout-full-width.tpl'}

{block name="content"}
	<div class="text-center">
		<h1>404</h1>
		<h5>{l s="Sorry! Page you are looking can’t be found."}</h5>
		<p>{l s="Go back to the"}<a href="{$urls.pages.index}">{l s="homepage"}</a></p>
	</div>
{/block}