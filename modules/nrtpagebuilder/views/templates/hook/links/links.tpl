<div class="links link-type-{$node.content.view_type} clearfix">
	{$linkLayout = $node.content.view_type}

	{if isset($linkLayout) && $linkLayout}
		{include file="catalog/_partials/miniatures/_partials/_link/link-{$linkLayout}.tpl"}
	{/if}
</div>   