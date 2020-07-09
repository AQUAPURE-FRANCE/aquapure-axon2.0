<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Custom hook name' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<input value="{if isset($node.content.hook)}{$node.content.hook}{/if}" type="text" name="custom_hook">
		<p class="help-block">
			{l s='You can use this custom hook later in modules, for example in displayFooter.' mod='nrtpagebuilder'}
		</p>
	</div>
</div>