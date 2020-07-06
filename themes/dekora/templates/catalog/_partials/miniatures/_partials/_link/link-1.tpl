<ul class="title_font">
	{foreach $node.content.links as $link}
		{if isset($link.data.url) && isset($link.data.title)}
			<li>
				{if isset($link.data.id) && $link.data.id == 'authentication'}
					{if !Context::getContext()->customer->isLogged()}
						<a href="{$link.data.url}" title="{$link.data.title}">
							{$link.data.title nofilter}
						</a>
					{else}
						<a href="{$urls.pages.my_account}" title="{l s='My Account'}"> 
							{l s='My Account'}
						</a>
					{/if}
				{else}
					<a href="{$link.data.url}" title="{$link.data.title}">
						{$link.data.title nofilter}
					</a>
				{/if}
			</li>
		{/if}
	{/foreach}
</ul>