<div class="column_content">
	<div class="tabs-c">
		<div class="nav-tabs-c">
			<a href="#" class='tab-c active' data-tab-c="columnsetting">
				<span class="hidden-is-tabs">
					{l s='Column Setting' mod='nrtpagebuilder'}
				</span>
				<span class="show-is-tabs">
					{l s='Tabs Setting' mod='nrtpagebuilder'}
				</span>
			</a>
			<a href="#" class='tab-c' data-tab-c="columnstyle">
				<span class="hidden-is-tabs">
					{l s='Column Style' mod='nrtpagebuilder'}
				</span>
				<span class="show-is-tabs">
					{l s='Tabs Style' mod='nrtpagebuilder'}
				</span>
			</a>
		</div>
		<div class="tab-content-c">
			<div class="tab-pane-c active" tab-pane-c="columnsetting">
				<div class="form-group">
					<label class="control-label col-lg-2">
						{l s='Title' mod='nrtpagebuilder'}
					</label>
					<div class="col-lg-10">
						<textarea name="column_title" style="resize: vertical;">{if isset($node.content_s.title)}{$node.content_s.title}{/if}</textarea>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2">
						{l s='Title Link' mod='nrtpagebuilder'}
					</label>
					<div class="col-lg-10">
						<input value="{if isset($node.content_s.href)}{$node.content_s.href}{/if}" type="text" name="column_href">
						<p class="help-block">
							{l s='Example : http://google.com' mod='nrtpagebuilder'}
						</p>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2">
						{l s='Title content' mod='nrtpagebuilder'}
					</label>
					<div class="col-lg-10">
						<textarea name="column_title_c" style="resize: vertical;">{if isset($node.content_s.title_c)}{$node.content_s.title_c}{/if}</textarea>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2">{l s='Title Align' mod='nrtpagebuilder'}</label>
					<div class="col-lg-10">
						<select name="column_title_align">
							<option value="1" {if isset($node.content_s.title_align) && $node.content_s.title_align == 1}selected{/if}>
								{l s='Left' mod='nrtpagebuilder'}
							</option>
							<option value="2" {if isset($node.content_s.title_align) && $node.content_s.title_align == 2}selected{/if}>
								{l s='Right' mod='nrtpagebuilder'}
							</option>
							<option value="3" {if isset($node.content_s.title_align) && $node.content_s.title_align == 3}selected{/if}>
								{l s='Center' mod='nrtpagebuilder'}
							</option>
						</select>
					</div>
				</div>	

				<div class="form-group">
					<label class="control-label col-lg-2">{l s='Custom Class' mod='nrtpagebuilder'}</label>
					<div class="col-lg-10">
						<input name="col_class" {if isset($node.content_s.class) && $node.content_s.class} value="{$node.content_s.class}"{/if} type="text" />
					</div>
				</div>

				<div class="form-group hidden show-is-tabs">
					<label class="control-label col-lg-2">{l s='Tabs Type' mod='nrtpagebuilder'}</label>
					<div class="col-lg-10">
						<select name="tabs_type">
							<option value="1" {if isset($node.content_s.tabs_type) && $node.content_s.tabs_type == 1}selected{/if}>
								{l s='Horizontal - 1' mod='nrtpagebuilder'}
							</option>
							<option value="2" {if isset($node.content_s.tabs_type) && $node.content_s.tabs_type == 2}selected{/if}>
								{l s='Horizontal - 2' mod='nrtpagebuilder'}
							</option>
							<option value="3" {if isset($node.content_s.tabs_type) && $node.content_s.tabs_type == 3}selected{/if}>
								{l s='Horizontal - 3' mod='nrtpagebuilder'}
							</option>
							<option value="4" {if isset($node.content_s.tabs_type) && $node.content_s.tabs_type == 4}selected{/if}>
								{l s='Horizontal - 4' mod='nrtpagebuilder'}
							</option>
							<option value="5" {if isset($node.content_s.tabs_type) && $node.content_s.tabs_type == 5}selected{/if}>
								{l s='Horizontal - 5' mod='nrtpagebuilder'}
							</option>	
							<option value="6" {if isset($node.content_s.tabs_type) && $node.content_s.tabs_type == 6}selected{/if}>
								{l s='Vertical - 1' mod='nrtpagebuilder'}
							</option>	
							<option value="7" {if isset($node.content_s.tabs_type) && $node.content_s.tabs_type == 7}selected{/if}>
								{l s='Vertical - 2' mod='nrtpagebuilder'}
							</option>
							<option value="8" {if isset($node.content_s.tabs_type) && $node.content_s.tabs_type == 8}selected{/if}>
								{l s='Vertical - 3' mod='nrtpagebuilder'}
							</option>
							<option value="9" {if isset($node.content_s.tabs_type) && $node.content_s.tabs_type == 9}selected{/if}>
								{l s='Vertical - 4' mod='nrtpagebuilder'}
							</option>
							<option value="10" {if isset($node.content_s.tabs_type) && $node.content_s.tabs_type == 10}selected{/if}>
								{l s='Vertical - 5' mod='nrtpagebuilder'}
							</option>
						</select>
					</div>
				</div>	

				<div class="form-group hidden-is-tabs">
					<label class="control-label col-lg-2">
						{l s='Content type' mod='nrtpagebuilder'}
					</label>
					<div class="col-lg-10">
						<select name="content_type">
							<option value="0" {if isset($node.contentType)}{if $node.contentType == 0}selected{/if}{else}selected{/if}>
								{l s='Empty' mod='nrtpagebuilder'}
							</option>
							<option value="1" {if isset($node.contentType) && $node.contentType == 1}selected{/if}>
								{l s='Products Slider' mod='nrtpagebuilder'}
							</option>
							<option value="2" {if isset($node.contentType) && $node.contentType == 2}selected{/if}>
								{l s='Products Load' mod='nrtpagebuilder'}
							</option>
							<option value="3" {if isset($node.contentType) && $node.contentType == 3}selected{/if}>
								{l s='Selected Products' mod='nrtpagebuilder'}
							</option>
							<option value="4" {if isset($node.contentType) && $node.contentType == 4}selected{/if}>
								{l s='Selected Categories' mod='nrtpagebuilder'}
							</option>
							<option value="5" {if isset($node.contentType) && $node.contentType == 5}selected{/if}>
								{l s='Manufacturers logos' mod='nrtpagebuilder'}
							</option>
							{if $blogStatus}
								<option value="6" {if isset($node.contentType) && $node.contentType == 6}selected{/if}>
									{l s='Blogs Slider' mod='nrtpagebuilder'}
								</option>
							{/if}
							<option value="7" {if isset($node.contentType) && $node.contentType == 7}selected{/if}>
								{l s='Sliders' mod='nrtpagebuilder'}
							</option>
							<option value="8" {if isset($node.contentType) && $node.contentType == 8}selected{/if}>
								{l s='Testimonials' mod='nrtpagebuilder'}
							</option>
							<option value="9" {if isset($node.contentType) && $node.contentType == 9}selected{/if}>
								{l s='Instagrams' mod='nrtpagebuilder'}
							</option>
							
							<option value="17" {if isset($node.contentType) && $node.contentType == 17}selected{/if}>
								{l s='Owl Custom' mod='nrtpagebuilder'}
							</option>
							<option value="18" {if isset($node.contentType) && $node.contentType == 18}selected{/if}>
								{l s='Links List' mod='nrtpagebuilder'}
							</option>
							<option value="19" {if isset($node.contentType) && $node.contentType == 19}selected{/if}>
								{l s='Social Follow' mod='nrtpagebuilder'}
							</option>
							<option value="20" {if isset($node.contentType) && $node.contentType == 20}selected{/if}>
								{l s='Module include' mod='nrtpagebuilder'}
							</option>
							<option value="21" {if isset($node.contentType) && $node.contentType == 21}selected{/if}>
								{l s='Banner image' mod='nrtpagebuilder'}
							</option>
							<option value="22" {if isset($node.contentType) && $node.contentType == 22}selected{/if}>
								{l s='Html Custom' mod='nrtpagebuilder'}
							</option>
							<option value="23" {if isset($node.contentType) && $node.contentType == 23}selected{/if}>
								{l s='Custom hook' mod='nrtpagebuilder'}
							</option>
						</select>
					</div>
				</div>

				<div class="products-slider-wrapper content-options-wrapper">
					{include file="./content_modal_products_slider.tpl"}
				</div>	
				<div class="products-load-wrapper content-options-wrapper">
					{include file="./content_modal_products_load.tpl"}
				</div>
				<div class="products-selected-wrapper content-options-wrapper">
					{include file="./content_modal_products_selected.tpl"}
				</div>
				<div class="categories-selected-wrapper content-options-wrapper">
					{include file="./content_modal_categories_selected.tpl"}
				</div>
				<div class="brands-selected-wrapper content-options-wrapper">
					{include file="./content_modal_brands_selected.tpl"}
				</div>
				{if $blogStatus}
					<div class="blogs-slider-wrapper content-options-wrapper">
						{include file="./content_modal_blogs_slider.tpl"}
					</div>	
				{/if}
				<div class="sliders-wrapper content-options-wrapper">
					{include file="./content_modal_slider.tpl"}
				</div>
				<div class="testimonials-wrapper content-options-wrapper">
					{include file="./content_modal_testimonial.tpl"}
				</div>
				<div class="instagrams-wrapper content-options-wrapper">
					{include file="./content_modal_instagram.tpl"}
				</div>
				<div class="owl-custom-wrapper content-options-wrapper">
					{include file="./content_modal_owl_custom.tpl"}
				</div>
				<div class="links-wrapper content-options-wrapper">
					{include file="./content_modal_link.tpl"}
				</div>
				<div class="socials-wrapper content-options-wrapper">
					{include file="./content_modal_social.tpl"}
				</div>
				<div class="module-wrapper content-options-wrapper">
					{include file="./content_modal_module.tpl"}
				</div>	
				<div class="banner-wrapper content-options-wrapper">
					{include file="./content_modal_banner.tpl"}
				</div>	
				<div class="html-wrapper content-options-wrapper">
					{include file="./content_modal_html.tpl"}
				</div>	
				<div class="hook-wrapper content-options-wrapper">
					{include file="./content_modal_custom_hook.tpl"}
				</div>	
			</div>
			<div class="tab-pane-c" tab-pane-c="columnstyle">
				{if isset($node.content_s.style)}
					{include file="./content_modal_style.tpl" el_style=$node.content_s.style}
				{else}
					{include file="./content_modal_style.tpl"}
				{/if}
			</div>
		</div>
	</div>	
</div>	