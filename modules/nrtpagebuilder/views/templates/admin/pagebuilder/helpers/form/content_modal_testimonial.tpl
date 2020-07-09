<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Select Sliders' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="testimonials_selected" multiple="multiple"  style="height:300px;">
			{foreach from=$testimonialsType item=testimonialType}
				<option value="{$testimonialType.id}" {if isset($node.content.ids) && $node.contentType == 8 && in_array($testimonialType.id, $node.content.ids)}selected{/if}>
					(ID: {$testimonialType.id}) - {$testimonialType.name}
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
				<option value="{$i}" {if isset($node.content.view_type) && $node.contentType == 8 && $node.content.view_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Per column' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="per_column">
			{for $i=1 to 10}
				<option value="{$i}"  {if isset($node.content.per_column) && $node.content.per_column == $i}selected{/if}>
					{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

{include file="./content_modal_options_owl.tpl"}