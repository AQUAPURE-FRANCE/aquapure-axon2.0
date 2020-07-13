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
		{l s='Source of products' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name='product_type'>
			{foreach from=$productsType item=productType}
				<option value="{$productType.id}" {if isset($node.content.ids) && $node.contentType == 2 && $productType.id == $node.content.ids}selected{/if}>
					{$productType.name}
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
				<option value="{$i}" {if isset($node.content.view_type) && $node.contentType == 2 && $node.content.view_type == $i}selected{/if}>
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
			{foreach from=$productImages item=format}
				<option value="{$format.name}" {if isset($node.content.image_type) && $node.contentType == 2 && $node.content.image_type == $format.name}selected{/if}>
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
		{l s='Order by' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name='order_by'>
			<option value="position" {if isset($node.content.order_by) && $node.content.order_by == 'position'}selected{/if}>
				{l s='Position' mod='nrtpagebuilder'}
			</option>
			<option value="name"  {if isset($node.content.order_by) && $node.content.order_by == 'name'}selected{/if}>
				{l s='Name' mod='nrtpagebuilder'}
			</option>
			<option value="date_add"  {if isset($node.content.order_by) && $node.content.order_by == 'date_add'}selected{/if}>
				{l s='Date add' mod='nrtpagebuilder'}
			</option>
			<option value="price"  {if isset($node.content.order_by) && $node.content.order_by == 'price'}selected{/if}>
				{l s='Price' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Order way' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name='order_way'>
			<option value="ASC" {if isset($node.content.order_way) && $node.content.order_way == 'ASC'}selected{/if}>
				{l s='Ascending' mod='nrtpagebuilder'}
			</option>
			<option value="DESC" {if isset($node.content.order_way) && $node.content.order_way == 'DESC'}selected{/if}>
				{l s='Descending' mod='nrtpagebuilder'}
			</option>
		</select>
	</div>
</div>

<div class="form-group">
	<label  class="control-label col-lg-2">
		{l s='Display sort order' mod='nrtpagebuilder'}
	</label>
	<div class="col-lg-10">
		<select name="sort_order">
			<option value="0" {if isset($node.content.sort_order) && $node.content.sort_order == 0}selected{/if} >{l s='No'}</option>
			<option value="1" {if isset($node.content.sort_order) && $node.content.sort_order == 1}selected{/if} >{l s='Yes'}</option>
		</select>
	</div>
</div>

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
