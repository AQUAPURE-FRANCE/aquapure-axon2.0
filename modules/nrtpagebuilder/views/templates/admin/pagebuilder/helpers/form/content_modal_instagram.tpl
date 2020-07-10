<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Instagram User ID: ' mod='nrtpagebuilder'}
	</label>	
	<div class="col-lg-10">
		<input value="{if isset($node.content.ins_user_id)}{$node.content.ins_user_id}{/if}" type="text" name="ins_user_id">
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Instagram Access token: ' mod='nrtpagebuilder'}
	</label>	
	<div class="col-lg-10">
		<input value="{if isset($node.content.ins_access_token)}{$node.content.ins_access_token}{/if}" type="text" name="ins_access_token">
		<p class="help-block">
			{l s='Generate Instagram User ID and Access Token: ' mod='nrtpagebuilder'}<a href='https://rudrastyh.com/tools/access-token' target='_blank'>{l s='Click here !' mod='nrtpagebuilder'}</a>
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
				<option value="{$i}" {if isset($node.content.view_type) && $node.contentType == 9 && $node.content.view_type == $i}selected{/if}>
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
			<option value="thumbnail" {if isset($node.content.image_type) && $node.contentType == 9 && $node.content.image_type == 'thumbnail'}selected{/if}>
				{l s='Thumbnail (150 X 150) - Square crop' mod='nrtpagebuilder'}
			</option>
			<option value="low_resolution" {if isset($node.content.image_type) && $node.contentType == 9 && $node.content.image_type == 'low_resolution'}selected{/if}>
				{l s='Low resolution (320 x 320)' mod='nrtpagebuilder'}
			</option>
			<option value="standard_resolution" {if isset($node.content.image_type) && $node.contentType == 9 && $node.content.image_type == 'standard_resolution'}selected{/if}>
				{l s='Standard resolution (612 x 612)' mod='nrtpagebuilder'}
			</option>
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
			{l s='You can retry 20 pics maximum' mod='nrtpagebuilder'}
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