<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Select Sliders' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="sliders_selected" multiple="multiple"  style="height:300px;">
			{foreach from=$slidersType item=sliderType}
				<option value="{$sliderType.id}" {if isset($node.content.ids) && $node.contentType == 7 && in_array($sliderType.id, $node.content.ids)}selected{/if}>
					(ID: {$sliderType.id}) - {$sliderType.name}
				</option>
			{/foreach}
		</select>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='View Layout' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name='view_type'>
			{for $i=1 to 30}
				<option value="{$i}" {if isset($node.content.view_type) && $node.contentType == 7 && $node.content.view_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

{include file="./content_modal_options_owl.tpl"}