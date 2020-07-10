<div class="alert_box ">
	<div class="col-lg-offset-2">
		{l s='Setup for - Large Desktop (Min width 1200px)' mod='nrtpagebuilder'}
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Per line' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="line_xl">
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.xl.line) && $node.content.optionsOwl.xl.line == $i}selected{/if}>
					{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Item Margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="margin_xl" value="{if isset($node.content.optionsOwl.xl.margin)}{$node.content.optionsOwl.xl.margin}{else}30{/if}">
			<span class="input-group-addon">px</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Rewind or Loop' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="rewind_xl">
			<option value="1" {if isset($node.content.optionsOwl.xl.rewind) && $node.content.optionsOwl.xl.rewind == 1}selected{/if} >{l s='Yes'}</option>
			<option value="0" {if isset($node.content.optionsOwl.xl.rewind) && $node.content.optionsOwl.xl.rewind == 0}selected{/if} >{l s='No'}</option>
			<option value="2" {if isset($node.content.optionsOwl.xl.rewind) && $node.content.optionsOwl.xl.rewind == 2}selected{/if} >{l s='Loop'}</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows type' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="nav_xl">
			<option value="0">{l s='Hidden'}</option>
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.xl.nav_type) && $node.content.optionsOwl.xl.nav_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows position' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="nav_position_xl">
			<option value="bottom-left" {if isset($node.content.optionsOwl.xl.nav_position) && $node.content.optionsOwl.xl.nav_position == 'bottom-left'}selected{/if}>
				{l s='Bottom Left' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-right" {if isset($node.content.optionsOwl.xl.nav_position) && $node.content.optionsOwl.xl.nav_position == 'bottom-right'}selected{/if}>
				{l s='Bottom Right' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-center" {if isset($node.content.optionsOwl.xl.nav_position) && $node.content.optionsOwl.xl.nav_position == 'bottom-center'}selected{/if}>
				{l s='Bottom Center' mod='nrtpagebuilder'}
			</option>
			<option value="top-left" {if isset($node.content.optionsOwl.xl.nav_position) && $node.content.optionsOwl.xl.nav_position == 'top-left'}selected{/if}>
				{l s='Top Left' mod='nrtpagebuilder'}
			</option>
			<option value="top-right" {if isset($node.content.optionsOwl.xl.nav_position) && $node.content.optionsOwl.xl.nav_position == 'top-right'}selected{/if}>
				{l s='Top Right' mod='nrtpagebuilder'}
			</option>
			<option value="top-center" {if isset($node.content.optionsOwl.xl.nav_position) && $node.content.optionsOwl.xl.nav_position == 'top-center'}selected{/if}>
				{l s='Top Center' mod='nrtpagebuilder'}
			</option>
			<option value="middle" {if isset($node.content.optionsOwl.xl.nav_position) && $node.content.optionsOwl.xl.nav_position == 'middle'}selected{/if}>
				{l s='In Middle Slider' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="nav_margin_xl_top" value="{if isset($node.content.optionsOwl.xl.nav_margin.top)}{$node.content.optionsOwl.xl.nav_margin.top}{/if}" type="text">
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
							<input name="nav_margin_xl_right" value="{if isset($node.content.optionsOwl.xl.nav_margin.right)}{$node.content.optionsOwl.xl.nav_margin.right}{/if}" type="text">
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
							<input name="nav_margin_xl_bottom" value="{if isset($node.content.optionsOwl.xl.nav_margin.bottom)}{$node.content.optionsOwl.xl.nav_margin.bottom}{/if}" type="text">
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
							<input name="nav_margin_xl_left" value="{if isset($node.content.optionsOwl.xl.nav_margin.left)}{$node.content.optionsOwl.xl.nav_margin.left}{/if}" type="text">
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
		{l s='Slider dots type' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="dots_xl">
			<option value="0">{l s='Hidden'}</option>
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.xl.dots_type) && $node.content.optionsOwl.xl.dots_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider dots position' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="dots_position_xl">
			<option value="bottom-left" {if isset($node.content.optionsOwl.xl.dots_position) && $node.content.optionsOwl.xl.dots_position == 'bottom-left'}selected{/if}>
				{l s='Bottom Left' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-right" {if isset($node.content.optionsOwl.xl.dots_position) && $node.content.optionsOwl.xl.dots_position == 'bottom-right'}selected{/if}>
				{l s='Bottom Right' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-center" {if isset($node.content.optionsOwl.xl.dots_position) && $node.content.optionsOwl.xl.dots_position == 'bottom-center'}selected{/if}>
				{l s='Bottom Center' mod='nrtpagebuilder'}
			</option>
			<option value="top-left" {if isset($node.content.optionsOwl.xl.dots_position) && $node.content.optionsOwl.xl.dots_position == 'top-left'}selected{/if}>
				{l s='Top Left' mod='nrtpagebuilder'}
			</option>
			<option value="top-right" {if isset($node.content.optionsOwl.xl.dots_position) && $node.content.optionsOwl.xl.dots_position == 'top-right'}selected{/if}>
				{l s='Top Right' mod='nrtpagebuilder'}
			</option>
			<option value="top-center" {if isset($node.content.optionsOwl.xl.dots_position) && $node.content.optionsOwl.xl.dots_position == 'top-center'}selected{/if}>
				{l s='Top Center' mod='nrtpagebuilder'}
			</option>
			<option value="middle" {if isset($node.content.optionsOwl.xl.dots_position) && $node.content.optionsOwl.xl.dots_position == 'middle'}selected{/if}>
				{l s='In Middle Slider' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider dots margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="dots_margin_xl_top" value="{if isset($node.content.optionsOwl.xl.dots_margin.top)}{$node.content.optionsOwl.xl.dots_margin.top}{/if}" type="text">
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
							<input name="dots_margin_xl_right" value="{if isset($node.content.optionsOwl.xl.dots_margin.right)}{$node.content.optionsOwl.xl.dots_margin.right}{/if}" type="text">
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
							<input name="dots_margin_xl_bottom" value="{if isset($node.content.optionsOwl.xl.dots_margin.bottom)}{$node.content.optionsOwl.xl.dots_margin.bottom}{/if}" type="text">
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
							<input name="dots_margin_xl_left" value="{if isset($node.content.optionsOwl.xl.dots_margin.left)}{$node.content.optionsOwl.xl.dots_margin.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Slider autoplay' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="autoplay_xl">
			<option value="0" {if isset($node.content.optionsOwl.xl.autoplay) && $node.content.optionsOwl.xl.autoplay == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.optionsOwl.xl.autoplay) && $node.content.optionsOwl.xl.autoplay == 1}selected{/if} >{l s='Yes'}</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Autoplay Timeout' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="autoplay_timeout_xl" value="{if isset($node.content.optionsOwl.xl.autoplay_timeout)}{$node.content.optionsOwl.xl.autoplay_timeout}{else}5000{/if}">
			<span class="input-group-addon">million seconds</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Autoplay Speed' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="autoplay_speed_xl" value="{if isset($node.content.optionsOwl.xl.autoplay_speed)}{$node.content.optionsOwl.xl.autoplay_speed}{else}250{/if}">
			<span class="input-group-addon">million seconds</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Hover Pause' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="autoplay_pause_xl">
			<option value="0" {if isset($node.content.optionsOwl.xl.autoplay_pause) && $node.content.optionsOwl.xl.autoplay_pause == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.optionsOwl.xl.autoplay_pause) && $node.content.optionsOwl.xl.autoplay_pause == 1}selected{/if} >{l s='Yes'}</option>
		</select>
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
		{l s='Per line' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="line_lg">
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.lg.line) && $node.content.optionsOwl.lg.line == $i}selected{/if}>
					{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Item Margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="margin_lg" value="{if isset($node.content.optionsOwl.lg.margin)}{$node.content.optionsOwl.lg.margin}{else}30{/if}">
			<span class="input-group-addon">px</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Rewind or Loop' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="rewind_lg">
			<option value="1" {if isset($node.content.optionsOwl.lg.rewind) && $node.content.optionsOwl.lg.rewind == 1}selected{/if} >{l s='Yes'}</option>
			<option value="0" {if isset($node.content.optionsOwl.lg.rewind) && $node.content.optionsOwl.lg.rewind == 0}selected{/if} >{l s='No'}</option>
			<option value="2" {if isset($node.content.optionsOwl.lg.rewind) && $node.content.optionsOwl.lg.rewind == 2}selected{/if} >{l s='Loop'}</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows type' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="nav_lg">
			<option value="0">{l s='Hidden'}</option>
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.lg.nav_type) && $node.content.optionsOwl.lg.nav_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows position' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="nav_position_lg">
			<option value="bottom-left" {if isset($node.content.optionsOwl.lg.nav_position) && $node.content.optionsOwl.lg.nav_position == 'bottom-left'}selected{/if}>
				{l s='Bottom Left' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-right" {if isset($node.content.optionsOwl.lg.nav_position) && $node.content.optionsOwl.lg.nav_position == 'bottom-right'}selected{/if}>
				{l s='Bottom Right' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-center" {if isset($node.content.optionsOwl.lg.nav_position) && $node.content.optionsOwl.lg.nav_position == 'bottom-center'}selected{/if}>
				{l s='Bottom Center' mod='nrtpagebuilder'}
			</option>
			<option value="top-left" {if isset($node.content.optionsOwl.lg.nav_position) && $node.content.optionsOwl.lg.nav_position == 'top-left'}selected{/if}>
				{l s='Top Left' mod='nrtpagebuilder'}
			</option>
			<option value="top-right" {if isset($node.content.optionsOwl.lg.nav_position) && $node.content.optionsOwl.lg.nav_position == 'top-right'}selected{/if}>
				{l s='Top Right' mod='nrtpagebuilder'}
			</option>
			<option value="top-center" {if isset($node.content.optionsOwl.lg.nav_position) && $node.content.optionsOwl.lg.nav_position == 'top-center'}selected{/if}>
				{l s='Top Center' mod='nrtpagebuilder'}
			</option>
			<option value="middle" {if isset($node.content.optionsOwl.lg.nav_position) && $node.content.optionsOwl.lg.nav_position == 'middle'}selected{/if}>
				{l s='In Middle Slider' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="nav_margin_lg_top" value="{if isset($node.content.optionsOwl.lg.nav_margin.top)}{$node.content.optionsOwl.lg.nav_margin.top}{/if}" type="text">
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
							<input name="nav_margin_lg_right" value="{if isset($node.content.optionsOwl.lg.nav_margin.right)}{$node.content.optionsOwl.lg.nav_margin.right}{/if}" type="text">
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
							<input name="nav_margin_lg_bottom" value="{if isset($node.content.optionsOwl.lg.nav_margin.bottom)}{$node.content.optionsOwl.lg.nav_margin.bottom}{/if}" type="text">
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
							<input name="nav_margin_lg_left" value="{if isset($node.content.optionsOwl.lg.nav_margin.left)}{$node.content.optionsOwl.lg.nav_margin.left}{/if}" type="text">
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
		{l s='Slider dots type' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="dots_lg">
			<option value="0">{l s='Hidden'}</option>
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.lg.dots_type) && $node.content.optionsOwl.lg.dots_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider dots position' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="dots_position_lg">
			<option value="bottom-left" {if isset($node.content.optionsOwl.lg.dots_position) && $node.content.optionsOwl.lg.dots_position == 'bottom-left'}selected{/if}>
				{l s='Bottom Left' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-right" {if isset($node.content.optionsOwl.lg.dots_position) && $node.content.optionsOwl.lg.dots_position == 'bottom-right'}selected{/if}>
				{l s='Bottom Right' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-center" {if isset($node.content.optionsOwl.lg.dots_position) && $node.content.optionsOwl.lg.dots_position == 'bottom-center'}selected{/if}>
				{l s='Bottom Center' mod='nrtpagebuilder'}
			</option>
			<option value="top-left" {if isset($node.content.optionsOwl.lg.dots_position) && $node.content.optionsOwl.lg.dots_position == 'top-left'}selected{/if}>
				{l s='Top Left' mod='nrtpagebuilder'}
			</option>
			<option value="top-right" {if isset($node.content.optionsOwl.lg.dots_position) && $node.content.optionsOwl.lg.dots_position == 'top-right'}selected{/if}>
				{l s='Top Right' mod='nrtpagebuilder'}
			</option>
			<option value="top-center" {if isset($node.content.optionsOwl.lg.dots_position) && $node.content.optionsOwl.lg.dots_position == 'top-center'}selected{/if}>
				{l s='Top Center' mod='nrtpagebuilder'}
			</option>
			<option value="middle" {if isset($node.content.optionsOwl.lg.dots_position) && $node.content.optionsOwl.lg.dots_position == 'middle'}selected{/if}>
				{l s='In Middle Slider' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider dots margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="dots_margin_lg_top" value="{if isset($node.content.optionsOwl.lg.dots_margin.top)}{$node.content.optionsOwl.lg.dots_margin.top}{/if}" type="text">
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
							<input name="dots_margin_lg_right" value="{if isset($node.content.optionsOwl.lg.dots_margin.right)}{$node.content.optionsOwl.lg.dots_margin.right}{/if}" type="text">
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
							<input name="dots_margin_lg_bottom" value="{if isset($node.content.optionsOwl.lg.dots_margin.bottom)}{$node.content.optionsOwl.lg.dots_margin.bottom}{/if}" type="text">
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
							<input name="dots_margin_lg_left" value="{if isset($node.content.optionsOwl.lg.dots_margin.left)}{$node.content.optionsOwl.lg.dots_margin.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Slider autoplay' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="autoplay_lg">
			<option value="0" {if isset($node.content.optionsOwl.lg.autoplay) && $node.content.optionsOwl.lg.autoplay == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.optionsOwl.lg.autoplay) && $node.content.optionsOwl.lg.autoplay == 1}selected{/if} >{l s='Yes'}</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Autoplay Timeout' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="autoplay_timeout_lg" value="{if isset($node.content.optionsOwl.lg.autoplay_timeout)}{$node.content.optionsOwl.lg.autoplay_timeout}{else}5000{/if}">
			<span class="input-group-addon">million seconds</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Autoplay Speed' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="autoplay_speed_lg" value="{if isset($node.content.optionsOwl.lg.autoplay_speed)}{$node.content.optionsOwl.lg.autoplay_speed}{else}250{/if}">
			<span class="input-group-addon">million seconds</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Hover Pause' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="autoplay_pause_lg">
			<option value="0" {if isset($node.content.optionsOwl.lg.autoplay_pause) && $node.content.optionsOwl.lg.autoplay_pause == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.optionsOwl.lg.autoplay_pause) && $node.content.optionsOwl.lg.autoplay_pause == 1}selected{/if} >{l s='Yes'}</option>
		</select>
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
		{l s='Per line' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="line_md">
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.md.line) && $node.content.optionsOwl.md.line == $i}selected{/if}>
					{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Item Margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="margin_md" value="{if isset($node.content.optionsOwl.md.margin)}{$node.content.optionsOwl.md.margin}{else}30{/if}">
			<span class="input-group-addon">px</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Rewind or Loop' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="rewind_md">
			<option value="1" {if isset($node.content.optionsOwl.md.rewind) && $node.content.optionsOwl.md.rewind == 1}selected{/if} >{l s='Yes'}</option>
			<option value="0" {if isset($node.content.optionsOwl.md.rewind) && $node.content.optionsOwl.md.rewind == 0}selected{/if} >{l s='No'}</option>
			<option value="2" {if isset($node.content.optionsOwl.md.rewind) && $node.content.optionsOwl.md.rewind == 2}selected{/if} >{l s='Loop'}</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows type' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="nav_md">
			<option value="0">{l s='Hidden'}</option>
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.md.nav_type) && $node.content.optionsOwl.md.nav_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows position' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="nav_position_md">
			<option value="bottom-left" {if isset($node.content.optionsOwl.md.nav_position) && $node.content.optionsOwl.md.nav_position == 'bottom-left'}selected{/if}>
				{l s='Bottom Left' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-right" {if isset($node.content.optionsOwl.md.nav_position) && $node.content.optionsOwl.md.nav_position == 'bottom-right'}selected{/if}>
				{l s='Bottom Right' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-center" {if isset($node.content.optionsOwl.md.nav_position) && $node.content.optionsOwl.md.nav_position == 'bottom-center'}selected{/if}>
				{l s='Bottom Center' mod='nrtpagebuilder'}
			</option>
			<option value="top-left" {if isset($node.content.optionsOwl.md.nav_position) && $node.content.optionsOwl.md.nav_position == 'top-left'}selected{/if}>
				{l s='Top Left' mod='nrtpagebuilder'}
			</option>
			<option value="top-right" {if isset($node.content.optionsOwl.md.nav_position) && $node.content.optionsOwl.md.nav_position == 'top-right'}selected{/if}>
				{l s='Top Right' mod='nrtpagebuilder'}
			</option>
			<option value="top-center" {if isset($node.content.optionsOwl.md.nav_position) && $node.content.optionsOwl.md.nav_position == 'top-center'}selected{/if}>
				{l s='Top Center' mod='nrtpagebuilder'}
			</option>
			<option value="middle" {if isset($node.content.optionsOwl.md.nav_position) && $node.content.optionsOwl.md.nav_position == 'middle'}selected{/if}>
				{l s='In Middle Slider' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="nav_margin_md_top" value="{if isset($node.content.optionsOwl.md.nav_margin.top)}{$node.content.optionsOwl.md.nav_margin.top}{/if}" type="text">
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
							<input name="nav_margin_md_right" value="{if isset($node.content.optionsOwl.md.nav_margin.right)}{$node.content.optionsOwl.md.nav_margin.right}{/if}" type="text">
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
							<input name="nav_margin_md_bottom" value="{if isset($node.content.optionsOwl.md.nav_margin.bottom)}{$node.content.optionsOwl.md.nav_margin.bottom}{/if}" type="text">
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
							<input name="nav_margin_md_left" value="{if isset($node.content.optionsOwl.md.nav_margin.left)}{$node.content.optionsOwl.md.nav_margin.left}{/if}" type="text">
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
		{l s='Slider dots type' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="dots_md">
			<option value="0">{l s='Hidden'}</option>
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.md.dots_type) && $node.content.optionsOwl.md.dots_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider dots position' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="dots_position_md">
			<option value="bottom-left" {if isset($node.content.optionsOwl.md.dots_position) && $node.content.optionsOwl.md.dots_position == 'bottom-left'}selected{/if}>
				{l s='Bottom Left' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-right" {if isset($node.content.optionsOwl.md.dots_position) && $node.content.optionsOwl.md.dots_position == 'bottom-right'}selected{/if}>
				{l s='Bottom Right' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-center" {if isset($node.content.optionsOwl.md.dots_position) && $node.content.optionsOwl.md.dots_position == 'bottom-center'}selected{/if}>
				{l s='Bottom Center' mod='nrtpagebuilder'}
			</option>
			<option value="top-left" {if isset($node.content.optionsOwl.md.dots_position) && $node.content.optionsOwl.md.dots_position == 'top-left'}selected{/if}>
				{l s='Top Left' mod='nrtpagebuilder'}
			</option>
			<option value="top-right" {if isset($node.content.optionsOwl.md.dots_position) && $node.content.optionsOwl.md.dots_position == 'top-right'}selected{/if}>
				{l s='Top Right' mod='nrtpagebuilder'}
			</option>
			<option value="top-center" {if isset($node.content.optionsOwl.md.dots_position) && $node.content.optionsOwl.md.dots_position == 'top-center'}selected{/if}>
				{l s='Top Center' mod='nrtpagebuilder'}
			</option>
			<option value="middle" {if isset($node.content.optionsOwl.md.dots_position) && $node.content.optionsOwl.md.dots_position == 'middle'}selected{/if}>
				{l s='In Middle Slider' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider dots margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="dots_margin_md_top" value="{if isset($node.content.optionsOwl.md.dots_margin.top)}{$node.content.optionsOwl.md.dots_margin.top}{/if}" type="text">
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
							<input name="dots_margin_md_right" value="{if isset($node.content.optionsOwl.md.dots_margin.right)}{$node.content.optionsOwl.md.dots_margin.right}{/if}" type="text">
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
							<input name="dots_margin_md_bottom" value="{if isset($node.content.optionsOwl.md.dots_margin.bottom)}{$node.content.optionsOwl.md.dots_margin.bottom}{/if}" type="text">
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
							<input name="dots_margin_md_left" value="{if isset($node.content.optionsOwl.md.dots_margin.left)}{$node.content.optionsOwl.md.dots_margin.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Slider autoplay' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="autoplay_md">
			<option value="0" {if isset($node.content.optionsOwl.md.autoplay) && $node.content.optionsOwl.md.autoplay == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.optionsOwl.md.autoplay) && $node.content.optionsOwl.md.autoplay == 1}selected{/if} >{l s='Yes'}</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Autoplay Timeout' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="autoplay_timeout_md" value="{if isset($node.content.optionsOwl.md.autoplay_timeout)}{$node.content.optionsOwl.md.autoplay_timeout}{else}5000{/if}">
			<span class="input-group-addon">million seconds</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Autoplay Speed' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="autoplay_speed_md" value="{if isset($node.content.optionsOwl.md.autoplay_speed)}{$node.content.optionsOwl.md.autoplay_speed}{else}250{/if}">
			<span class="input-group-addon">million seconds</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Hover Pause' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="autoplay_pause_md">
			<option value="0" {if isset($node.content.optionsOwl.md.autoplay_pause) && $node.content.optionsOwl.md.autoplay_pause == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.optionsOwl.md.autoplay_pause) && $node.content.optionsOwl.md.autoplay_pause == 1}selected{/if} >{l s='Yes'}</option>
		</select>
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
		{l s='Per line' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="line_sm">
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.sm.line) && $node.content.optionsOwl.sm.line == $i}selected{/if}>
					{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Item Margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="margin_sm" value="{if isset($node.content.optionsOwl.sm.margin)}{$node.content.optionsOwl.sm.margin}{else}30{/if}">
			<span class="input-group-addon">px</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Rewind or Loop' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="rewind_sm">
			<option value="1" {if isset($node.content.optionsOwl.sm.rewind) && $node.content.optionsOwl.sm.rewind == 1}selected{/if} >{l s='Yes'}</option>
			<option value="0" {if isset($node.content.optionsOwl.sm.rewind) && $node.content.optionsOwl.sm.rewind == 0}selected{/if} >{l s='No'}</option>
			<option value="2" {if isset($node.content.optionsOwl.sm.rewind) && $node.content.optionsOwl.sm.rewind == 2}selected{/if} >{l s='Loop'}</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows type' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="nav_sm">
			<option value="0">{l s='Hidden'}</option>
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.sm.nav_type) && $node.content.optionsOwl.sm.nav_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows position' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="nav_position_sm">
			<option value="bottom-left" {if isset($node.content.optionsOwl.sm.nav_position) && $node.content.optionsOwl.sm.nav_position == 'bottom-left'}selected{/if}>
				{l s='Bottom Left' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-right" {if isset($node.content.optionsOwl.sm.nav_position) && $node.content.optionsOwl.sm.nav_position == 'bottom-right'}selected{/if}>
				{l s='Bottom Right' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-center" {if isset($node.content.optionsOwl.sm.nav_position) && $node.content.optionsOwl.sm.nav_position == 'bottom-center'}selected{/if}>
				{l s='Bottom Center' mod='nrtpagebuilder'}
			</option>
			<option value="top-left" {if isset($node.content.optionsOwl.sm.nav_position) && $node.content.optionsOwl.sm.nav_position == 'top-left'}selected{/if}>
				{l s='Top Left' mod='nrtpagebuilder'}
			</option>
			<option value="top-right" {if isset($node.content.optionsOwl.sm.nav_position) && $node.content.optionsOwl.sm.nav_position == 'top-right'}selected{/if}>
				{l s='Top Right' mod='nrtpagebuilder'}
			</option>
			<option value="top-center" {if isset($node.content.optionsOwl.sm.nav_position) && $node.content.optionsOwl.sm.nav_position == 'top-center'}selected{/if}>
				{l s='Top Center' mod='nrtpagebuilder'}
			</option>
			<option value="middle" {if isset($node.content.optionsOwl.sm.nav_position) && $node.content.optionsOwl.sm.nav_position == 'middle'}selected{/if}>
				{l s='In Middle Slider' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="nav_margin_sm_top" value="{if isset($node.content.optionsOwl.sm.nav_margin.top)}{$node.content.optionsOwl.sm.nav_margin.top}{/if}" type="text">
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
							<input name="nav_margin_sm_right" value="{if isset($node.content.optionsOwl.sm.nav_margin.right)}{$node.content.optionsOwl.sm.nav_margin.right}{/if}" type="text">
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
							<input name="nav_margin_sm_bottom" value="{if isset($node.content.optionsOwl.sm.nav_margin.bottom)}{$node.content.optionsOwl.sm.nav_margin.bottom}{/if}" type="text">
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
							<input name="nav_margin_sm_left" value="{if isset($node.content.optionsOwl.sm.nav_margin.left)}{$node.content.optionsOwl.sm.nav_margin.left}{/if}" type="text">
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
		{l s='Slider dots type' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="dots_sm">
			<option value="0">{l s='Hidden'}</option>
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.sm.dots_type) && $node.content.optionsOwl.sm.dots_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider dots position' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="dots_position_sm">
			<option value="bottom-left" {if isset($node.content.optionsOwl.sm.dots_position) && $node.content.optionsOwl.sm.dots_position == 'bottom-left'}selected{/if}>
				{l s='Bottom Left' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-right" {if isset($node.content.optionsOwl.sm.dots_position) && $node.content.optionsOwl.sm.dots_position == 'bottom-right'}selected{/if}>
				{l s='Bottom Right' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-center" {if isset($node.content.optionsOwl.sm.dots_position) && $node.content.optionsOwl.sm.dots_position == 'bottom-center'}selected{/if}>
				{l s='Bottom Center' mod='nrtpagebuilder'}
			</option>
			<option value="top-left" {if isset($node.content.optionsOwl.sm.dots_position) && $node.content.optionsOwl.sm.dots_position == 'top-left'}selected{/if}>
				{l s='Top Left' mod='nrtpagebuilder'}
			</option>
			<option value="top-right" {if isset($node.content.optionsOwl.sm.dots_position) && $node.content.optionsOwl.sm.dots_position == 'top-right'}selected{/if}>
				{l s='Top Right' mod='nrtpagebuilder'}
			</option>
			<option value="top-center" {if isset($node.content.optionsOwl.sm.dots_position) && $node.content.optionsOwl.sm.dots_position == 'top-center'}selected{/if}>
				{l s='Top Center' mod='nrtpagebuilder'}
			</option>
			<option value="middle" {if isset($node.content.optionsOwl.sm.dots_position) && $node.content.optionsOwl.sm.dots_position == 'middle'}selected{/if}>
				{l s='In Middle Slider' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider dots margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="dots_margin_sm_top" value="{if isset($node.content.optionsOwl.sm.dots_margin.top)}{$node.content.optionsOwl.sm.dots_margin.top}{/if}" type="text">
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
							<input name="dots_margin_sm_right" value="{if isset($node.content.optionsOwl.sm.dots_margin.right)}{$node.content.optionsOwl.sm.dots_margin.right}{/if}" type="text">
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
							<input name="dots_margin_sm_bottom" value="{if isset($node.content.optionsOwl.sm.dots_margin.bottom)}{$node.content.optionsOwl.sm.dots_margin.bottom}{/if}" type="text">
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
							<input name="dots_margin_sm_left" value="{if isset($node.content.optionsOwl.sm.dots_margin.left)}{$node.content.optionsOwl.sm.dots_margin.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Slider autoplay' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="autoplay_sm">
			<option value="0" {if isset($node.content.optionsOwl.sm.autoplay) && $node.content.optionsOwl.sm.autoplay == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.optionsOwl.sm.autoplay) && $node.content.optionsOwl.sm.autoplay == 1}selected{/if} >{l s='Yes'}</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Autoplay Timeout' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="autoplay_timeout_sm" value="{if isset($node.content.optionsOwl.sm.autoplay_timeout)}{$node.content.optionsOwl.sm.autoplay_timeout}{else}5000{/if}">
			<span class="input-group-addon">million seconds</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Autoplay Speed' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="autoplay_speed_sm" value="{if isset($node.content.optionsOwl.sm.autoplay_speed)}{$node.content.optionsOwl.sm.autoplay_speed}{else}250{/if}">
			<span class="input-group-addon">million seconds</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Hover Pause' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="autoplay_pause_sm">
			<option value="0" {if isset($node.content.optionsOwl.sm.autoplay_pause) && $node.content.optionsOwl.sm.autoplay_pause == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.optionsOwl.sm.autoplay_pause) && $node.content.optionsOwl.sm.autoplay_pause == 1}selected{/if} >{l s='Yes'}</option>
		</select>
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
		{l s='Per line' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="line_xs">
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.xs.line) && $node.content.optionsOwl.xs.line == $i}selected{/if}>
					{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Item Margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="margin_xs" value="{if isset($node.content.optionsOwl.xs.margin)}{$node.content.optionsOwl.xs.margin}{else}30{/if}">
			<span class="input-group-addon">px</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Rewind or Loop' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="rewind_xs">
			<option value="1" {if isset($node.content.optionsOwl.xs.rewind) && $node.content.optionsOwl.xs.rewind == 1}selected{/if} >{l s='Yes'}</option>
			<option value="0" {if isset($node.content.optionsOwl.xs.rewind) && $node.content.optionsOwl.xs.rewind == 0}selected{/if} >{l s='No'}</option>
			<option value="2" {if isset($node.content.optionsOwl.xs.rewind) && $node.content.optionsOwl.xs.rewind == 2}selected{/if} >{l s='Loop'}</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows type' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="nav_xs">
			<option value="0">{l s='Hidden'}</option>
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.xs.nav_type) && $node.content.optionsOwl.xs.nav_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows position' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="nav_position_xs">
			<option value="bottom-left" {if isset($node.content.optionsOwl.xs.nav_position) && $node.content.optionsOwl.xs.nav_position == 'bottom-left'}selected{/if}>
				{l s='Bottom Left' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-right" {if isset($node.content.optionsOwl.xs.nav_position) && $node.content.optionsOwl.xs.nav_position == 'bottom-right'}selected{/if}>
				{l s='Bottom Right' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-center" {if isset($node.content.optionsOwl.xs.nav_position) && $node.content.optionsOwl.xs.nav_position == 'bottom-center'}selected{/if}>
				{l s='Bottom Center' mod='nrtpagebuilder'}
			</option>
			<option value="top-left" {if isset($node.content.optionsOwl.xs.nav_position) && $node.content.optionsOwl.xs.nav_position == 'top-left'}selected{/if}>
				{l s='Top Left' mod='nrtpagebuilder'}
			</option>
			<option value="top-right" {if isset($node.content.optionsOwl.xs.nav_position) && $node.content.optionsOwl.xs.nav_position == 'top-right'}selected{/if}>
				{l s='Top Right' mod='nrtpagebuilder'}
			</option>
			<option value="top-center" {if isset($node.content.optionsOwl.xs.nav_position) && $node.content.optionsOwl.xs.nav_position == 'top-center'}selected{/if}>
				{l s='Top Center' mod='nrtpagebuilder'}
			</option>
			<option value="middle" {if isset($node.content.optionsOwl.xs.nav_position) && $node.content.optionsOwl.xs.nav_position == 'middle'}selected{/if}>
				{l s='In Middle Slider' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider arrows margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="nav_margin_xs_top" value="{if isset($node.content.optionsOwl.xs.nav_margin.top)}{$node.content.optionsOwl.xs.nav_margin.top}{/if}" type="text">
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
							<input name="nav_margin_xs_right" value="{if isset($node.content.optionsOwl.xs.nav_margin.right)}{$node.content.optionsOwl.xs.nav_margin.right}{/if}" type="text">
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
							<input name="nav_margin_xs_bottom" value="{if isset($node.content.optionsOwl.xs.nav_margin.bottom)}{$node.content.optionsOwl.xs.nav_margin.bottom}{/if}" type="text">
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
							<input name="nav_margin_xs_left" value="{if isset($node.content.optionsOwl.xs.nav_margin.left)}{$node.content.optionsOwl.xs.nav_margin.left}{/if}" type="text">
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
		{l s='Slider dots type' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="dots_xs">
			<option value="0">{l s='Hidden'}</option>
			{for $i=1 to 10}
				<option value="{$i}" {if isset($node.content.optionsOwl.xs.dots_type) && $node.content.optionsOwl.xs.dots_type == $i}selected{/if}>
					{l s='Type - ' mod='nrtpagebuilder'}{$i}
				</option>
			{/for}
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider dots position' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="dots_position_xs">
			<option value="bottom-left" {if isset($node.content.optionsOwl.xs.dots_position) && $node.content.optionsOwl.xs.dots_position == 'bottom-left'}selected{/if}>
				{l s='Bottom Left' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-right" {if isset($node.content.optionsOwl.xs.dots_position) && $node.content.optionsOwl.xs.dots_position == 'bottom-right'}selected{/if}>
				{l s='Bottom Right' mod='nrtpagebuilder'}
			</option>
			<option value="bottom-center" {if isset($node.content.optionsOwl.xs.dots_position) && $node.content.optionsOwl.xs.dots_position == 'bottom-center'}selected{/if}>
				{l s='Bottom Center' mod='nrtpagebuilder'}
			</option>
			<option value="top-left" {if isset($node.content.optionsOwl.xs.dots_position) && $node.content.optionsOwl.xs.dots_position == 'top-left'}selected{/if}>
				{l s='Top Left' mod='nrtpagebuilder'}
			</option>
			<option value="top-right" {if isset($node.content.optionsOwl.xs.dots_position) && $node.content.optionsOwl.xs.dots_position == 'top-right'}selected{/if}>
				{l s='Top Right' mod='nrtpagebuilder'}
			</option>
			<option value="top-center" {if isset($node.content.optionsOwl.xs.dots_position) && $node.content.optionsOwl.xs.dots_position == 'top-center'}selected{/if}>
				{l s='Top Center' mod='nrtpagebuilder'}
			</option>
			<option value="middle" {if isset($node.content.optionsOwl.xs.dots_position) && $node.content.optionsOwl.xs.dots_position == 'middle'}selected{/if}>
				{l s='In Middle Slider' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Slider dots margin' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="row">
			<div class="col-lg-3">
				<div class="row">
					<label class="control-label col-lg-5">{l s='Top' mod='nrtpagebuilder'}</label>
					<div class="col-lg-6">
						<div class="input-group fixed-width-sm">
							<input name="dots_margin_xs_top" value="{if isset($node.content.optionsOwl.xs.dots_margin.top)}{$node.content.optionsOwl.xs.dots_margin.top}{/if}" type="text">
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
							<input name="dots_margin_xs_right" value="{if isset($node.content.optionsOwl.xs.dots_margin.right)}{$node.content.optionsOwl.xs.dots_margin.right}{/if}" type="text">
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
							<input name="dots_margin_xs_bottom" value="{if isset($node.content.optionsOwl.xs.dots_margin.bottom)}{$node.content.optionsOwl.xs.dots_margin.bottom}{/if}" type="text">
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
							<input name="dots_margin_xs_left" value="{if isset($node.content.optionsOwl.xs.dots_margin.left)}{$node.content.optionsOwl.xs.dots_margin.left}{/if}" type="text">
							<span class="input-group-addon">px</span>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Slider autoplay' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="autoplay_xs">
			<option value="0" {if isset($node.content.optionsOwl.xs.autoplay) && $node.content.optionsOwl.xs.autoplay == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.optionsOwl.xs.autoplay) && $node.content.optionsOwl.xs.autoplay == 1}selected{/if} >{l s='Yes'}</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Autoplay Timeout' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="autoplay_timeout_xs" value="{if isset($node.content.optionsOwl.xs.autoplay_timeout)}{$node.content.optionsOwl.xs.autoplay_timeout}{else}5000{/if}">
			<span class="input-group-addon">million seconds</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-2">
		{l s='Autoplay Speed' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" name="autoplay_speed_xs" value="{if isset($node.content.optionsOwl.xs.autoplay_speed)}{$node.content.optionsOwl.xs.autoplay_speed}{else}250{/if}">
			<span class="input-group-addon">million seconds</span>
		</div>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Hover Pause' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="autoplay_pause_xs">
			<option value="0" {if isset($node.content.optionsOwl.xs.autoplay_pause) && $node.content.optionsOwl.xs.autoplay_pause == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.optionsOwl.xs.autoplay_pause) && $node.content.optionsOwl.xs.autoplay_pause == 1}selected{/if} >{l s='Yes'}</option>
		</select>
	</div>
</div>
