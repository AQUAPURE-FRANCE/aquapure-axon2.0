<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Select Links' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="link_type">
			{foreach from=$linksType item=linkType}
				<option value="{$linkType.id}" {if isset($node.content.ids) && $node.contentType == 18 && $linkType.id == $node.content.ids}selected{/if}>
					(ID: {$linkType.id}) - {$linkType.name}
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
				<option value="{$i}" {if isset($node.content.view_type) && $node.contentType == 18 && $node.content.view_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>