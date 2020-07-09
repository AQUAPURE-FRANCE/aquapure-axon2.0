<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Image source' mod='nrtpagebuilder'}
	</label>	
	<div class="col-lg-10">
		<p> 
			<input onChange="closePopup();" class="banner_src" value="{if isset($node.content.banner.src)}{$node.content.banner.src}{/if}" type="text" name="banner_src"  id="{if isset($node.elementId)}{$node.elementId}_{/if}banner_src">
		</p>
		<a href="filemanager/dialog.php?type=1" class="btn btn-default iframe-upload" data-input-name="{if isset($node.elementId)}{$node.elementId}_{/if}banner_src" type="button">
			{l s='Select image' mod='nrtpagebuilder'} <i class="icon-angle-right"></i>
		</a>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Link' mod='nrtpagebuilder'}
	</label>	
	<div class="col-lg-10">
		<input value="{if isset($node.content.banner.href)}{$node.content.banner.href}{/if}" type="text" name="banner_href">
		<p class="help-block">
			{l s='Optional link. Use entire url with http:// prefix' mod='nrtpagebuilder'}
		</p>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='New window' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="banner_window">
			<option value="0" {if isset($node.content.banner.window) && $node.content.banner.window== 0}selected{/if}>
				{l s='No' mod='nrtpagebuilder'}
			</option>
			<option value="1" {if isset($node.content.banner.window) && $node.content.banner.window == 1}selected{/if}>
				{l s='Yes' mod='nrtpagebuilder'}
			</option>
		</select>
		<p class="help-block">
			{l s='Open link in new window' mod='nrtpagebuilder'}
		</p>
	</div>
</div>
