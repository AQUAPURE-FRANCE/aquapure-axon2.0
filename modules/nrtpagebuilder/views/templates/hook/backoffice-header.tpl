{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
	
<script type="text/template" id="btn-edit-page-builder-category">
    <div>
		{if $urlPageBuilder }
			<br />
			<a target="_blank" href="{$urlPageBuilder}" class="btn btn-info"><i class="icon-external-link"></i> 
				{l s='Add extendend content with - Page Builder' mod='nrtpagebuilder'}
			</a>
		{else}
			<br />
			<div class="alert alert-info">{l s=' Save page first to enable page builder' mod='nrtpagebuilder'}</div>
		{/if}
    </div>
</script>

<script type="text/template" id="btn-edit-page-builder-product">
    <div>
		{if $urlPageBuilder }
			<a target="_blank" href="{$urlPageBuilder}" class="btn btn-info"><i class="icon-external-link"></i> 
				{l s='Add extendend content with - Page Builder' mod='nrtpagebuilder'}
			</a>
		{else}
			<div class="alert alert-info">{l s=' Save page first to enable page builder' mod='nrtpagebuilder'}</div>
		{/if}
    </div>
	<br />
</script>
	
<script type="text/template" id="btn-edit-page-builder-cms">
    <div>
		{if $urlPageBuilder }
			<br />
			<a target="_blank" href="{$urlPageBuilder}" class="btn btn-info"><i class="icon-external-link"></i> 
				{l s='Add extendend content with - Page Builder' mod='nrtpagebuilder'}
			</a>
		{else}
			<br />
			<div class="alert alert-info">{l s=' Save page first to enable page builder' mod='nrtpagebuilder'}</div>
		{/if}
    </div>
</script>

<script type="text/template" id="btn-edit-page-builder-blog">
    <div class="form-group">
        <label class="control-label col-lg-3"></label>
        <div class="col-lg-9">
			{if $urlPageBuilder }
				<a href="{$urlPageBuilder}" class="btn btn-info"><i class="icon-external-link"></i> {l s='Edit with Page Builder' mod='nrtpagebuilder'}</a>
			{else}
				<div class="alert alert-info">{l s=' Save page first to enable page builder' mod='nrtpagebuilder'}</div>
			{/if}
		</div>
    </div>
</script>

<script type="text/javascript">
$(document).ready(function () {

	var $wrapperCategory = $('div#category_description, div#root_category_description').closest('.col-sm'),
		$wrapperProduct = $('#features'),
		$wrapperCms = $('#cms_page_content'),
		$wrapperBlog = $('#smart_blog_post_form').find("[name^=content_]").first().parents('.form-group').last(),
		
		$btnTemplateCategory = $('#btn-edit-page-builder-category'),
		$btnTemplateProduct = $('#btn-edit-page-builder-product'),
		$btnTemplateCms = $('#btn-edit-page-builder-cms'),
		$btnTemplateBlog = $('#btn-edit-page-builder-blog');

		$wrapperCategory.append($btnTemplateCategory.html());
		$wrapperProduct.prepend($btnTemplateProduct.html());
		$wrapperCms.after($btnTemplateCms.html());
		$wrapperBlog.after($btnTemplateBlog.html());

});
</script>
