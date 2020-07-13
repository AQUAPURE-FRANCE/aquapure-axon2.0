{if $node.type==1}
	<div data-element-type="1" data-depth="{$node.depth}" data-element-id="{$node.elementId}" class="menu_row menu_row_element menu-element {if $node.depth==0} first_rows{/if} menu-element-id-{$node.elementId}">
		{include file="./row.tpl" node=$node}
{elseif $node.type==3}
	<div data-element-type="3" data-depth="{$node.depth}" data-element-id="{$node.elementId}" class="menu_row menu_tabe menu_row_element menu-element menu-element-id-{$node.elementId}">
	{include file="./tab.tpl" node=$node}

{elseif $node.type==2}
	<div data-element-type="2" data-depth="{$node.depth}" data-width-xs="{$node.width_xs}" data-width-sm="{$node.width_sm}" data-width-md="{$node.width_md}" data-width-lg="{$node.width_lg}" data-width-xl="{$node.width_xl}" data-contenttype="{$node.contentType}" data-element-id="{$node.elementId}" class="{if $node.width_xs==13}xs-hidden{else}editors-col-xs-{$node.width_xs}{/if} {if $node.width_sm==13}sm-hidden{else}editors-col-sm-{$node.width_sm}{/if} {if $node.width_md==13}md-hidden{else}editors-col-md-{$node.width_md}{/if} {if $node.width_lg==13}lg-hidden{else}editors-col-lg-{$node.width_lg}{/if} {if $node.width_xl==13}xl-hidden{else}editors-col-xl-{$node.width_xl}{/if} menu_column menu-element menu-element-id-{$node.elementId}">
{elseif $node.type==4}
	<div data-element-type="4" data-depth="{$node.depth}" data-width-xs="{$node.width_xs}" data-width-sm="{$node.width_sm}" data-width-md="{$node.width_md}" data-width-lg="{$node.width_lg}" data-width-xl="{$node.width_xl}" data-contenttype="{$node.contentType}" data-element-id="{$node.elementId}" class="{if $node.width_xs==13}xs-hidden{else}editors-col-xs-{$node.width_xs}{/if} {if $node.width_sm==13}sm-hidden{else}editors-col-sm-{$node.width_sm}{/if} {if $node.width_md==13}md-hidden{else}editors-col-md-{$node.width_md}{/if} {if $node.width_lg==13}lg-hidden{else}editors-col-lg-{$node.width_lg}{/if} {if $node.width_xl==13}xl-hidden{else}editors-col-xl-{$node.width_xl}{/if} menu_column menu_tabs menu-element menu-element-id-{$node.elementId}">
{/if}
		<div class="action_click">
			<i class="icon icon-wrench"></i>
		</div>
		<div class="action-buttons-container content_click">
			<button type="button" class="add-row-action">{l s='Add Row' mod='nrtpagebuilder'}</button>
			<button type="button" class="add-column-action">{l s='Add Column' mod='nrtpagebuilder'}</button>
			<button type="button" class="add-tabs-action">{l s='Add Tabs' mod='nrtpagebuilder'}</button>
			<button type="button" class="add-tab-action">{l s='Add Tab' mod='nrtpagebuilder'}</button>
			<button type="button" class="column-content-edit">{l s='Content' mod='nrtpagebuilder'}</button>
			<button type="button" class="duplicate-element-action">{l s='Duplicate' mod='nrtpagebuilder'}</button>
			<button type="button" class="edit-row-action">{l s='Edit' mod='nrtpagebuilder'}</button>
			<button type="button" class="remove-element-action">{l s='Delete' mod='nrtpagebuilder'} </button>
		</div>
		<div class="dragger-handle btn btn-danger">
			<i class="icon-arrows"></i>
			{if $node.type==1}
				{l s='Row' mod='nrtpagebuilder'}
			{elseif $node.type==2}
				{l s='Column' mod='nrtpagebuilder'} 
			{elseif $node.type==3}
				{l s='Tab' mod='nrtpagebuilder'} 
			{elseif $node.type==4}
				{l s='Tabs' mod='nrtpagebuilder'}
			{/if}
		</div>

		{if $node.type == 2 || $node.type == 4}
			{include file="./column.tpl" node=$node}
		{/if}

		{if $node.type==4}
			<ul class="nav nav-tabs nav-tabs-sortable">
				{if isset($node.children) && $node.children|@count > 0}
					{foreach from=$node.children item=child name=categoryTreeBranch}
						{if $child.type==3}
							<li data-element-id="{$child.elementId}" data-element-type="3" class="content-tab-li content-tab-li-id-{$child.elementId}  {if $smarty.foreach.categoryTreeBranch.first} active{/if}">
								<a href="#content-tab-id-{$child.elementId}" data-toggle="tab">
									{if isset($child.tabtitle) && $child.tabtitle !=''}
										{$child.tabtitle nofilter}
									{else}
										Tab {$child.elementId}
									{/if}
									<span class="dragger-handle-tab"><i class="icon-arrows"></i></span>
								</a>
							</li> 
						{/if} 	
					{/foreach}
				{/if}
			</ul>
			<div class="tab-content">
				{if isset($node.children) && $node.children|@count > 0}
					{foreach from=$node.children item=child name=categoryTreeBranch}
						{if $child.type==3}
							<div id="content-tab-id-{$child.elementId}" class="tab-pane {if $smarty.foreach.categoryTreeBranch.first} active {/if}content-element-id-{$child.elementId}">
								{include file="./submenu.tpl" node=$child}
							</div>
						{/if} 	
					{/foreach}
				{/if}
			</div> 
		{else}
			{if isset($node.children) && $node.children|@count > 0}
				{foreach from=$node.children item=child name=categoryTreeBranch}
					{include file="./submenu.tpl" node=$child}
				{/foreach}
			{/if}
		{/if}
	</div>
