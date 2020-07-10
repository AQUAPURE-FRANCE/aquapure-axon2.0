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

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Select manufacturers' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="brands_selected" multiple="multiple" style="height: 300px;">
			<optgroup label="____All_____">
				<option value="0" {if isset($node.content.ids) && $node.contentType == 5 && in_array(0, $node.content.ids)}selected{/if}>
					{l s='Show all' mod='nrtpagebuilder'}
				</option>
			</optgroup>
			<optgroup label="____Manual select_____">
				{foreach from=$brandsType item=brandType}
					<option value="{$brandType.id}" {if isset($node.content.ids) && $node.contentType == 5 && in_array($brandType.id, $node.content.ids)}selected{/if} >
						{$brandType.name}
					</option>
				{/foreach}
			</optgroup>
		</select>
		<p class="help-block">
			{l s='Do not selecta Show all manufacturers if you have large amount of' mod='nrtpagebuilder'}
		</p>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='View Layout' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name='view_type'>
			{for $i=1 to 30}
				<option value="{$i}" {if isset($node.content.view_type) && $node.contentType == 5 && $node.content.view_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

{include file="./content_modal_options_owl.tpl"}