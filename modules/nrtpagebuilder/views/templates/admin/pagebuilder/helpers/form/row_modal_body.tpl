<div class="row_content">
	<div class="tabs-c">
		<div class="nav-tabs-c">
			<a href="#" class='tab-c active' data-tab-c="rowsetting">
				{l s='Row Setting' mod='nrtpagebuilder'}
			</a>
			<a href="#" class='tab-c' data-tab-c="rowstyle">
				{l s='Row Style' mod='nrtpagebuilder'}
			</a>
		</div>
		<div class="tab-content-c">
			<div class="tab-pane-c active" tab-pane-c="rowsetting">
				<div class="form-group row_type">
					<label class="control-label col-lg-2">
						{l s='Row type' mod='nrtpagebuilder'}
					</label>
					<div class="col-lg-10">
						<select name="row_type"> 
							<option value="0" {if isset($node.row_s.row_type) && $node.row_s.row_type == 0}selected{/if}>
								{l s='Full Width' mod='nrtpagebuilder'}
							</option>   
							<option value="2" {if isset($node.row_s.row_type) && $node.row_s.row_type == 2}selected{/if}>
								{l s='Container' mod='nrtpagebuilder'}
							</option>	            
							<option value="1" {if isset($node.row_s.row_type) && $node.row_s.row_type == 1}selected{/if}>
								{l s='Content in Container' mod='nrtpagebuilder'}
							</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-2">{l s='Custom Class' mod='nrtpagebuilder'}</label>
					<div class="col-lg-10">
						<input name="row_class" {if isset($node.row_s.class) && $node.row_s.class} value="{$node.row_s.class}"{/if} type="text" />
					</div>
				</div>	
			</div>
			<div class="tab-pane-c" tab-pane-c="rowstyle">
				{if isset($node.row_s.style)}
					{include file="./content_modal_style.tpl" el_style=$node.row_s.style}
				{else}
					{include file="./content_modal_style.tpl"}
				{/if}
			</div>
		</div>
	</div>
</div>
	