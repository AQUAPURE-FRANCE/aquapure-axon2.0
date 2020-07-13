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

{extends file="helpers/form/form.tpl"}


{block name="script"}


$(document).ready(function() {

		 $('.iframe-upload').fancybox({	
			'width'		: 900,
			'height'	: 600,
			'type'		: 'iframe',
      		'autoScale' : false,
      		'autoDimensions': false,
      		 'fitToView' : false,
  			 'autoSize' : false,
  			 onUpdate : function(){ $('.fancybox-iframe').contents().find('a.link').data('field_id', $(this.element).data("input-name"));
			 	 $('.fancybox-iframe').contents().find('a.link').attr('data-field_id', $(this.element).data("input-name"));},
  			 afterShow: function(){
			 	 $('.fancybox-iframe').contents().find('a.link').data('field_id', $(this.element).data("input-name"));
			 	 $('.fancybox-iframe').contents().find('a.link').attr('data-field_id', $(this.element).data("input-name"));
			}
  		  });
});

{/block}
	
{block name="input_row"}
    {if $input.type == 'page_trigger'}
        <div class="form-group">
            <label class="control-label col-lg-3"></label>
            <div class="col-lg-9">
                {if $input.url}
                    <a href="{$input.url|escape:'html':'UTF-8'}" class="btn btn-info"><i class="icon-external-link"></i> {l s='Edit with Page Builder' mod='nrtpagebuilder'}</a>
                {else}
                    <div class="alert alert-info">{l s=' Save page first to enable page builder' mod='nrtpagebuilder'}</div>
                {/if}
            </div>
        </div>
    {elseif $input.type == 'src_img_banner'}
		{foreach from=$languages item=language}
			<input type="hidden" name="content-{$language.id_lang|escape:'htmlall':'UTF-8'}" id="content-{$language.id_lang|escape:'htmlall':'UTF-8'}" value="">
		{/foreach}
        <div class="form-group">
            <label  class="control-label col-lg-3">{$input.label}</label>
            <div class="col-lg-9">
                {foreach from=$languages item=language}
                {if $languages|count > 1}
                <div class="translatable-field lang-{$language.id_lang}" {if $language.id_lang != $defaultFormLanguage}style="display:none"{/if}>
                	<div class="form-group">
                    	<div class="col-lg-9">
                    {/if}
                            <p> 
                                <input id="{$input.name}_{$language.id_lang}" type="text" name="{$input.name}_{$language.id_lang}" value="{$fields_value[$input.name][$language.id_lang]}"> 
                            </p>
                            <a href="filemanager/dialog.php?type=1&field_id={$input.name}_{$language.id_lang}" class="btn btn-default iframe-upload"  data-input-name="{$input.name}_{$language.id_lang}" type="button">
                                {l s='Select image' mod='nrtpagebuilder'} <i class="icon-angle-right"></i>
                            </a>
                        {if $languages|count > 1}
                        </div>
                        <div class="col-lg-2">
                            <button type="button" class="btn btn-default dropdown-toggle" tabindex="-1" data-toggle="dropdown">
                                {$language.iso_code}
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                {foreach from=$languages item=lang}
                                <li><a href="javascript:hideOtherLanguage({$lang.id_lang});" tabindex="-1">{$lang.name}</a></li>
                                {/foreach}
                            </ul>
                        </div>
                        {/if}
                    {if $languages|count > 1}
                    </div>
                </div>
                {/if}
                {/foreach}
           </div>
        </div>
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
