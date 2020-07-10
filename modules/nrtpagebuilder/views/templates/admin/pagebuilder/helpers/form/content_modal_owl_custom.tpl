<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Custom Owl' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		 <div name="custom_owl">
			 {if isset($node.content.custom_owl)}
				{$node.content.custom_owl nofilter}
			 {/if}
		 </div>
	</div>
</div>

{include file="./content_modal_options_owl.tpl"}