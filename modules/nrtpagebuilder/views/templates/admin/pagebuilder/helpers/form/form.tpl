{extends file="helpers/form/form.tpl"}

{block name="label"}
	{if $input.type != 'grids_builder'}
		{$smarty.block.parent}
	{/if}
{/block}
	
{block name="input_row"}
	{if isset($input.hide) && $input.hide}<div style="display: none !important;">{/if}
	{if isset($input.preffix_wrapper)}<div id="{$input.preffix_wrapper}" {if isset($input.wrapper_hidden) && $input.wrapper_hidden} class="hidden clearfix"{/if}>{/if}
	{if isset($input.upper_separator) && $input.upper_separator}<hr>{/if}
	{if isset($input.row_title)}
	<div class="col-lg-10 col-lg-offset-3 row-title">{$input.row_title}</div>
	{/if}
	{$smarty.block.parent}
	{if isset($input.separator) && $input.separator}<hr>{/if}
	{if isset($input.preffix_wrapper)}</div>{/if}
	{if isset($input.hide) && $input.hide}</div>{/if}
{/block}
	
{block name="input"}
  	{if $input.type == 'grids_builder'}
	<textarea name="submenu-elements" class="hidden" id="submenu-elements">{$submenu_content nofilter}</textarea>

	<input name="pageId" class="hidden" value="{$pageId}">
	<input name="pageType" class="hidden" value="{$pageType}">
	<input name="idLang" class="hidden" value="{$idLang}">

	<div id="column-content-sample" class="hidden">
		{include file="./column.tpl"}
	</div>
	<div id="row-content-sample" class="hidden">
		{include file="./row.tpl"}
	</div>
	<div id="tab-content-sample" class="hidden">
		{include file="./tab.tpl"}
	</div>

	{if count($languages) > 1}

		<div class="row">
			<div class="col-xs-6" style="padding: 0 5px;">
				<div class="dropdown" style="float: right">
					<div class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="text-transform: uppercase;">
						{l s='Edit Content From Language ---- ' mod='nrtpagebuilder'}
						{foreach $languages as $lang}
							{if $idLang == $lang['id_lang']}
								{$lang['name']}
							{/if}
						{/foreach} 
						&nbsp;&nbsp;<i class="icon icon-angle-down"></i>
					</div>
					<ul class="dropdown-menu" style="right: 0;padding: 0;border: none;">
						{foreach $languages as $lang}
							{if $idLang != $lang['id_lang']}
								<li>
									<a href="{$pageBuilderLink}{$lang['id_lang']}" style="width: 100%;border-bottom: none;padding-top: 10px;padding-bottom: 10px;" class="btn btn-default">
										{$lang['name']}
									</a>
								</li>
							{/if}
						{/foreach}  
					</ul>
				</div>
			</div>	
			<div class="col-xs-6" style="padding: 0 5px;">
				<div class="dropdown" style="float: left">
					<div class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="text-transform: uppercase;">
						{l s='Import content from  other language' mod='nrtpagebuilder'}
						&nbsp;&nbsp;<i class="icon icon-angle-down"></i>
					</div>
					<ul class="dropdown-menu" style="right: 0;padding: 0;border: none;">
						{foreach $languages as $lang}
							{if $idLang != $lang['id_lang']}
								<li>
									<button style="width: 100%;border-bottom: none;padding-top: 10px;padding-bottom: 10px;" type="submit" class="btn btn-default" data-language="{$lang['id_lang']}" value="1" name='{$submit_action}'>
										{$lang['name']}
									</button>
								</li>
							{/if}
						{/foreach}  
					</ul>
				</div>
			</div>	
		</div>

		<br/>

	{/if}

	<div class="preview-buttons">
		<label>
			{l s='View: ' mod='nrtpagebuilder'}
		</label> 
		<button type="button" class="btn btn-default switch-view-btn" data-preview-type="preview-xs">
			<i class="icon-mobile"></i> {l s='Phone (Max width 575px)' mod='nrtpagebuilder'}
		</button>
		<button type="button" class="btn btn-default switch-view-btn" data-preview-type="preview-sm">
			<i class="icon-mobile icon-rotate-90"></i> {l s='Phone Landscape (Min width 576px)' mod='nrtpagebuilder'}
		</button>
		<button type="button" class="btn btn-default switch-view-btn" data-preview-type="preview-md">
			<i class="icon-tablet"></i> {l s='Tablet (Min width 768px)' mod='nrtpagebuilder'}
		</button>
		<button type="button" class="btn btn-default switch-view-btn" data-preview-type="preview-lg">
			<i class="icon-desktop"></i> {l s='Desktop (Min width 992px)' mod='nrtpagebuilder'}
		</button>
		<button type="button" class="btn btn-default switch-view-btn active-preview" data-preview-type="preview-xl">
			<i class="icon-desktop"></i> {l s='Large Desktop (Min width 1200px)' mod='nrtpagebuilder'}
		</button>
	</div>	
	<div id="grid-editors-wrapper" class="preview-xl">
		<div class="row grid_editors">
			<div class="col-xs-12 first-rows-wrapper" data-element-id="0">
				{foreach $submenu_content_format as $element}
					{include file="./submenu.tpl" node=$element}               
				{/foreach}
			</div>
			<div id="buttons-sample">
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
					<i class="icon-arrows "></i> 
					<span class="row-dragger-txt">{l s='Row' mod='nrtpagebuilder'}</span>
					<span class="col-dragger-txt">{l s='Column' mod='nrtpagebuilder'}</span>
					<span class="tabs-dragger-txt">{l s='Tabs' mod='nrtpagebuilder'}</span>
					<span class="tab-dragger-txt">{l s='Tab' mod='nrtpagebuilder'}</span>
				</div>
			</div>
		</div>
	</div>
	{else}
		{$smarty.block.parent}
    {/if}
{/block}