{foreach $node.content.socials as $social}
	{if isset($social.data.url) && isset($social.data.title)}
		<a href="{$social.data.url}" title="{$social.data.title}"
			onmouseover="this.style.backgroundColor ='{$social.data.bg}';this.style.borderColor ='{$social.data.bg}';this.style.color ='{$social.data.bg}';"
		   >
			<i class="{$social.data.icon}"></i>
		</a>
	{/if}
{/foreach}