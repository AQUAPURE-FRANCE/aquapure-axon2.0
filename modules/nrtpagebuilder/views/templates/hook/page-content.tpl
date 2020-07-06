{if !empty($content)}
	{foreach $content as $element}
		{include file="module:nrtpagebuilder/views/templates/hook/front-content.tpl" node=$element}
	{/foreach}
{/if}			


