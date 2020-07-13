{if $node.type == 1}
	{if isset($node.row_s.row_type) && $node.row_s.row_type == 2}
	<div class="container container-parent">
	{/if}
		<div id="content-{$options.class}-{$node.elementId}" class="page-builder clearfix{if isset($node.row_s.class ) && $node.row_s.class} {$node.row_s.class}{/if}"{if isset($node.row_s.style.bgi) && $node.row_s.style.bgi} style="background-image: url({$node.row_s.style.bgi});"{/if}>
			{if isset($node.row_s.row_type ) && $node.row_s.row_type == 1}
			<div class="container container-parent">
			{/if} 
				<div class="row">
{elseif $node.type == 2 && !isset($node.content.hidden_title)}
	<div class="{if $node.width_xs == 13}hidden-xs{else}col-xs-{$node.width_xs}{/if}{if $node.width_sm == 13} hidden-sm{else} col-sm-{$node.width_sm}{/if}{if $node.width_md == 13} hidden-md{else} col-md-{$node.width_md}{/if}{if $node.width_lg == 13} hidden-lg{else} col-lg-{$node.width_lg}{/if}{if $node.width_xl == 13} hidden-xl{else} col-xl-{$node.width_xl}{/if}">
		<div id="content-{$options.class}-{$node.elementId}" class="column-inner{if isset($node.content_s.title_align) && $node.content_s.title_align == 1} title-left{elseif isset($node.content_s.title_align) && $node.content_s.title_align == 2} title-right{else} title-center{/if}{if isset($node.content_s.class) && $node.content_s.class} {$node.content_s.class}{/if}"{if isset($node.content_s.style.bgi) && $node.content_s.style.bgi} style="background-image: url({$node.content_s.style.bgi});"{/if}>
{elseif $node.type == 4}
	<div class="{if $node.width_xs == 13}hidden-xs{else}col-xs-{$node.width_xs}{/if}{if $node.width_sm == 13} hidden-sm{else} col-sm-{$node.width_sm}{/if}{if $node.width_md == 13} hidden-md{else} col-md-{$node.width_md}{/if}{if $node.width_lg == 13} hidden-lg{else} col-lg-{$node.width_lg}{/if}{if $node.width_xl == 13} hidden-xl{else} col-xl-{$node.width_xl}{/if}">
		<div id="content-{$options.class}-{$node.elementId}" class="pbd-tabs tabs{if isset($node.content_s.title_align) && $node.content_s.title_align == 1} title-left{elseif isset($node.content_s.title_align) && $node.content_s.title_align == 2} title-right{else} title-center{/if}{if isset($node.content_s.tabs_type) && $node.content_s.tabs_type} tabs-type-{$node.content_s.tabs_type}{else} tabs-type-1{/if}{if isset($node.content_s.class) && $node.content_s.class} {$node.content_s.class}{/if}"{if isset($node.content_s.style.bgi) && $node.content_s.style.bgi} style="background-image: url({$node.content_s.style.bgi});"{/if}>
{/if}
			{if !isset($node.content.hidden_title)}
				{include file="module:nrtpagebuilder/views/templates/hook/front-content-inner.tpl" node=$node}
			{/if}
					{if ($node.type == 2 && !isset($node.content.hidden_title)) || $node.type == 1 || $node.type == 4}
						{if isset($node.children) && $node.children|@count > 0}
							{foreach from=$node.children item=child name=categoryTreeBranch}
								{if $child.type==3}
									{if $smarty.foreach.categoryTreeBranch.first}  
										<div class="box-nav-tab">
											<div class="dropdown-toggle-nav-tab hidden-lg-up">
												{if isset($child.tabtitle)}
													{$child.tabtitle nofilter}
												{else}
													{l s='Set tab title' mod='nrtpagebuilder'}
												 {/if}
											</div>
											<ul class="nav nav-tabs dropdown-menu-nav-tab title_font" role="tablist">
									{/if} 
												<li class="nav-item">
													<a class="nav-link{if $smarty.foreach.categoryTreeBranch.first} active{/if} " href="#content-{$options.class}-{$child.elementId}" data-toggle="tab" role="tab" aria-controls="content-{$options.class}-{$child.elementId}">
														{if isset($child.tabtitle)}
															{$child.tabtitle nofilter}
														{else}
															{l s='Set tab title' mod='nrtpagebuilder'}
														{/if}
													</a>
												</li>
												
									{if $smarty.foreach.categoryTreeBranch.last}
											 </ul> 
										</div>
									{/if} 
								{/if}
							{/foreach}

							{foreach from=$node.children item=child name=categoryTreeBranch}
								{if $child.type == 3}
									{if $smarty.foreach.categoryTreeBranch.first}  
										<div class="tab-content">
									{/if} 
										{include file="module:nrtpagebuilder/views/templates/hook/front-content.tpl" node=$child}
									{if $smarty.foreach.categoryTreeBranch.last}  
										</div> 
									{/if} 
								{else}
									{include file="module:nrtpagebuilder/views/templates/hook/front-content.tpl" node=$child}
								{/if}
							{/foreach}
						{/if}
					{elseif $node.type == 3}

						{if isset($node.children) && $node.children|@count > 0}
							<div id="content-{$options.class}-{$node.elementId}" class="row tab-pane{if $smarty.foreach.categoryTreeBranch.first} active{/if}" role="tabpanel">
								{foreach from=$node.children item=child name=categoryTreeBranch}
									{include file="module:nrtpagebuilder/views/templates/hook/front-content.tpl" node=$child}
								{/foreach}
							</div>
						{/if}

					{/if}
{if $node.type == 4}
		</div>
	</div>		
{elseif $node.type == 2 && !isset($node.content.hidden_title)}
		</div>
	</div>		
{elseif $node.type == 1}
				</div>	
			{if isset($node.row_s.row_type ) && $node.row_s.row_type == 1}
			</div>
			{/if} 	
		</div>		
	{if isset($node.row_s.row_type) && $node.row_s.row_type == 2}
	</div>
	{/if}
{/if}
