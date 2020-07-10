<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Background color' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="input-group">
				<input type="text" class="spectrumcolor el_bgc {if isset($node.elementId)}el_bgc_{$node.elementId}{/if}" name="el_bgc" value="{if isset($el_style.bgc)}{$el_style.bgc}{/if}"/>
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Background image' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<p>
			<input onChange="closePopup();" class="el_bgi" value="{if isset($el_style.bgi)}{$el_style.bgi}{/if}" type="text" name="el_bgi" id="{if isset($node.elementId)}{$node.elementId}_{/if}el_bgi">
		</p>	
		<a href="filemanager/dialog.php?type=1&field_id={if isset($node.elementId)}{$node.elementId}_{/if}el_bgi" class="btn btn-default iframe-upload" data-input-name="{if isset($node.elementId)}{$node.elementId}_{/if}el_bgi" type="button">
			{l s='Select image' mod='nrtpagebuilder'} 
			<i class="icon-angle-right"></i>
		</a>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">{l s='Background image type' mod='nrtpagebuilder'}</label>
	<div class="col-lg-10">
		<select name="el-bgr">
			<option value="3" {if isset($el_style.bgr) && $el_style.bgr==3}selected{/if}>
				{l s='Repeat XY' mod='nrtpagebuilder'}
			</option>
			<option value="2" {if isset($el_style.bgr) && $el_style.bgr==2}selected{/if}>
				{l s='Repeat X' mod='nrtpagebuilder'}
			</option>
			<option value="1" {if isset($el_style.bgr) && $el_style.bgr==1}selected{/if}>
				{l s='Repeat Y' mod='nrtpagebuilder'}
			</option>
			<option value="0" {if isset($el_style.bgr) && $el_style.bgr==0}selected{/if}>
				{l s='No repeat' mod='nrtpagebuilder'}
			</option>
			<option value="4" {if isset($el_style.bgr) && $el_style.bgr==4}selected{/if}>
				{l s='Background parallax' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>	
</div>

{**----------------------------------------------------------------------------------------------------------------------------------**}

<div class="alert_box ">
	<div class="col-lg-offset-2">
		{l s='Setup for - Large Desktop (Min width 1200px)' mod='nrtpagebuilder'}
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_xl_top" value="{if isset($el_style.xl.margin.top)}{$el_style.xl.margin.top}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Right' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_xl_right" value="{if isset($el_style.xl.margin.right)}{$el_style.xl.margin.right}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Bottom' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_xl_bottom" value="{if isset($el_style.xl.margin.bottom)}{$el_style.xl.margin.bottom}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Left' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_xl_left" value="{if isset($el_style.xl.margin.left)}{$el_style.xl.margin.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Padding' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_xl_top" value="{if isset($el_style.xl.padding.top)}{$el_style.xl.padding.top}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Right' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_xl_right" value="{if isset($el_style.xl.padding.right)}{$el_style.xl.padding.right}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Bottom' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_xl_bottom" value="{if isset($el_style.xl.padding.bottom)}{$el_style.xl.padding.bottom}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Left' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_xl_left" value="{if isset($el_style.xl.padding.left)}{$el_style.xl.padding.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

{**----------------------------------------------------------------------------------------------------------------------------------**}

<div class="alert_box ">
	<div class="col-lg-offset-2">
		{l s='Setup for - Desktop (Min width 992px)' mod='nrtpagebuilder'}
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_lg_top" value="{if isset($el_style.lg.margin.top)}{$el_style.lg.margin.top}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Right' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_lg_right" value="{if isset($el_style.lg.margin.right)}{$el_style.lg.margin.right}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Bottom' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_lg_bottom" value="{if isset($el_style.lg.margin.bottom)}{$el_style.lg.margin.bottom}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Left' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_lg_left" value="{if isset($el_style.lg.margin.left)}{$el_style.lg.margin.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Padding' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_lg_top" value="{if isset($el_style.lg.padding.top)}{$el_style.lg.padding.top}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Right' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_lg_right" value="{if isset($el_style.lg.padding.right)}{$el_style.lg.padding.right}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Bottom' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_lg_bottom" value="{if isset($el_style.lg.padding.bottom)}{$el_style.lg.padding.bottom}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Left' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_lg_left" value="{if isset($el_style.lg.padding.left)}{$el_style.lg.padding.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

{**----------------------------------------------------------------------------------------------------------------------------------**}

<div class="alert_box ">
	<div class="col-lg-offset-2">
		{l s='Setup for - Tablet (Min width 768px)' mod='nrtpagebuilder'}
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_md_top" value="{if isset($el_style.md.margin.top)}{$el_style.md.margin.top}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Right' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_md_right" value="{if isset($el_style.md.margin.right)}{$el_style.md.margin.right}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Bottom' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_md_bottom" value="{if isset($el_style.md.margin.bottom)}{$el_style.md.margin.bottom}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Left' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_md_left" value="{if isset($el_style.md.margin.left)}{$el_style.md.margin.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Padding' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_md_top" value="{if isset($el_style.md.padding.top)}{$el_style.md.padding.top}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Right' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_md_right" value="{if isset($el_style.md.padding.right)}{$el_style.md.padding.right}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Bottom' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_md_bottom" value="{if isset($el_style.md.padding.bottom)}{$el_style.md.padding.bottom}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Left' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_md_left" value="{if isset($el_style.md.padding.left)}{$el_style.md.padding.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

{**----------------------------------------------------------------------------------------------------------------------------------**}

<div class="alert_box ">
	<div class="col-lg-offset-2">
		{l s='Setup for - Phone Landscape (Min width 576px)' mod='nrtpagebuilder'}
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_sm_top" value="{if isset($el_style.sm.margin.top)}{$el_style.sm.margin.top}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Right' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_sm_right" value="{if isset($el_style.sm.margin.right)}{$el_style.sm.margin.right}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Bottom' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_sm_bottom" value="{if isset($el_style.sm.margin.bottom)}{$el_style.sm.margin.bottom}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Left' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_sm_left" value="{if isset($el_style.sm.margin.left)}{$el_style.sm.margin.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Padding' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_sm_top" value="{if isset($el_style.sm.padding.top)}{$el_style.sm.padding.top}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Right' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_sm_right" value="{if isset($el_style.sm.padding.right)}{$el_style.sm.padding.right}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Bottom' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_sm_bottom" value="{if isset($el_style.sm.padding.bottom)}{$el_style.sm.padding.bottom}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Left' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_sm_left" value="{if isset($el_style.sm.padding.left)}{$el_style.sm.padding.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

{**----------------------------------------------------------------------------------------------------------------------------------**}

<div class="alert_box ">
	<div class="col-lg-offset-2">
		{l s='Setup for - Phone (Max width 575px)' mod='nrtpagebuilder'}
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_xs_top" value="{if isset($el_style.xs.margin.top)}{$el_style.xs.margin.top}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Right' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_xs_right" value="{if isset($el_style.xs.margin.right)}{$el_style.xs.margin.right}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Bottom' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_xs_bottom" value="{if isset($el_style.xs.margin.bottom)}{$el_style.xs.margin.bottom}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Left' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="margin_xs_left" value="{if isset($el_style.xs.margin.left)}{$el_style.xs.margin.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Padding' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_xs_top" value="{if isset($el_style.xs.padding.top)}{$el_style.xs.padding.top}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Right' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_xs_right" value="{if isset($el_style.xs.padding.right)}{$el_style.xs.padding.right}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Bottom' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_xs_bottom" value="{if isset($el_style.xs.padding.bottom)}{$el_style.xs.padding.bottom}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Left' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="padding_xs_left" value="{if isset($el_style.xs.padding.left)}{$el_style.xs.padding.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>
