<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Ajax' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="ajax">
			<option value="0" {if isset($node.content.ajax) && $node.content.ajax == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.ajax) && $node.content.ajax == 1}selected{/if} >{l s='Yes'}</option>
		</select>
	</div>
</div>

<div class="col-lg-10 col-lg-offset-2">
	<div class="alert alert-info">
		{l s='This function is only for advanced users, and issues related to this will be not supported. It maybe needed to clear Prestashop Cache if you do some changes in included module if they will be not visible.' mod='nrtpagebuilder'}
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Module to show' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name='module'>
			<option value="" >{l s='- Select module -' mod='nrtpagebuilder'}</option>
			{foreach from=$modulesHooks item=module}
				<option value="{$module.name}" data-hooks="{$module.hooks}"{if isset($node.content.module.name) && $node.contentType == 20 && $node.content.module.name == $module.name}selected{/if} >
					{$module.name}
				</option>
			{/foreach}
		</select>
	</div>	
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Show module using hook' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name='module_hook'>
			{if isset($node.content.module.name) && $node.contentType == 20}
				{assign var="hooks" value=","|explode:$modulesHooks[$node.content.module.name].hooks}
				{foreach from=$hooks item=hook}
					<option value="{$hook}" {if isset($node.content.module.name) && $node.contentType == 20 && $node.content.module.hook == $hook}selected{/if}>
						{$hook}
					</option>
				{/foreach}
			{/if}
		</select>
	</div>
</div>