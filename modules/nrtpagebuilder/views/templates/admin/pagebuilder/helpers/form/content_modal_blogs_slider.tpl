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
		{l s='Source of blogs' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name='blog_type'>
			{foreach from=$blogsType item=blogType}
				<option value="{$blogType.id}" {if isset($node.content.ids) && $node.contentType == 6 && $blogType.id == $node.content.ids}selected{/if}>
					{$blogType.name}
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
				<option value="{$i}" {if isset($node.content.view_type) && $node.contentType == 6 && $node.content.view_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Image size' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="image_type">
			{foreach from=$blogImages item=format}
				<option value="{$format.name}" {if isset($node.content.image_type) && $node.contentType == 6 && $node.content.image_type == $format.name}selected{/if}>
					{$format.name}
				</option>
			{/foreach}
		</select>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Limit' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<input value="{if isset($node.content.limit)}{$node.content.limit}{else}10{/if}" name="limit" type="text">
		<p class="help-block">
			{l s='Maxiumum number of products to show' mod='nrtpagebuilder'}
		</p>
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
