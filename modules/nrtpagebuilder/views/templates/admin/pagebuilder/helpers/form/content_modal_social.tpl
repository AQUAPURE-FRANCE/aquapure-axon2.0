<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Select Socials' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="social_type">
			{foreach from=$socialsType item=socialType}
				<option value="{$socialType.id}" {if isset($node.content.ids) && $node.contentType == 19 && $socialType.id == $node.content.ids}selected{/if}>
					(ID: {$socialType.id}) - {$socialType.name}
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
				<option value="{$i}" {if isset($node.content.view_type) && $node.contentType == 19 && $node.content.view_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>