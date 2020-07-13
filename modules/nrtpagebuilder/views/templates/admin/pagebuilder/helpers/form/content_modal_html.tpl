<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Custom Html' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		 <div name="custom_html">
			 {if isset($node.content.custom_html)}
				{$node.content.custom_html nofilter}
			 {/if}
		 </div>
	</div>
</div>