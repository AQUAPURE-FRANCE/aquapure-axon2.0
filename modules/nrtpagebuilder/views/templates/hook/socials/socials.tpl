<div class="socials social-type-{$node.content.view_type} clearfix">
	{$socialLayout = $node.content.view_type}

	{if isset($socialLayout) && $socialLayout}
		{include file="catalog/_partials/miniatures/_partials/_social/social-{$socialLayout}.tpl"}
	{/if}
	
</div>   