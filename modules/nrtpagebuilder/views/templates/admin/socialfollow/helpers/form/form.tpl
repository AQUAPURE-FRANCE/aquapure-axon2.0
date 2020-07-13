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

{block name="input_row"}
    {if $input.type == 'selected_social'}
    
	<div class="alert alert-info">
    {l s='To add the icon class you need goto:'}
    <a href='http://fontawesome.io/cheatsheet/' target='_blank'>http://fontawesome.io/cheatsheet/</a>
    ( Ex:'fa fa-facebook' ) Or
    <a href='http://zavoloklom.github.io/material-design-iconic-font/icons.html' target='_blank'>http://zavoloklom.github.io/material-design-iconic-font/icons.html</a>. ( Ex:'zmdi zmdi-pinterest' )
    {l s='for complete list of available icons.'}
    </div>
	
	{foreach from=$languages item=language}
		<input type="hidden" name="content-{$language.id_lang|escape:'htmlall':'UTF-8'}" id="selected-list-{$language.id_lang|escape:'htmlall':'UTF-8'}" value="">
	{/foreach} 
    
    {function name="social_temp_lang" page=[]}
    {strip}
    <div class="row wrapper-social">
    	<div class="sort_tab_social icon icon-arrows"></div>
        <div class="col-xs-4">
            <div class="form-group">
                {foreach from=$languages item=language}
                {if $languages|count > 1}
                <div class="translatable-field lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" {if $language.id_lang != $defaultFormLanguage}style="display:none"{/if}>
                    {/if}
                    <div class="col-lg-10">
                        <input value="{$page.title[$language.id_lang] nofilter}" type="text" class="social-title-{$language.id_lang|escape:'htmlall':'UTF-8'}">
                    </div>
                    {if $languages|count > 1}
                    <div class="col-lg-2">
                        <button type="button" class="btn btn-default dropdown-toggle" tabindex="-1" data-toggle="dropdown">
                            {$language.iso_code|escape:'htmlall':'UTF-8'}
                            <i class="icon-caret-down"></i>
                        </button>
                        <ul class="dropdown-menu">
                            {foreach from=$languages item=lang}
                            <li><a href="javascript:hideOtherLanguage({$lang.id_lang|escape:'htmlall':'UTF-8'} );" tabindex="-1">{$lang.name|escape:'html'}</a></li>
                            {/foreach}
                        </ul>
                    </div>
                    {/if}
                    {if $languages|count > 1}
                </div>
                {/if}
                {/foreach}
            </div>
        </div>
        <div class="col-xs-4">
            <div class="form-group">
                {foreach from=$languages item=language}
                {if $languages|count > 1}
                <div class="translatable-field lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" {if $language.id_lang != $defaultFormLanguage}style="display:none"{/if}>
                    {/if}
                    <div class="col-lg-10">
                        <input value="{$page.url[$language.id_lang] nofilter}" type="text" class="social-url-{$language.id_lang|escape:'htmlall':'UTF-8'}">
                    </div>
                    {if $languages|count > 1}
                    <div class="col-lg-2">
                        <button type="button" class="btn btn-default dropdown-toggle" tabindex="-1" data-toggle="dropdown">
                            {$language.iso_code|escape:'htmlall':'UTF-8'}
                            <i class="icon-caret-down"></i>
                        </button>
                        <ul class="dropdown-menu">
                            {foreach from=$languages item=lang}
                            <li><a href="javascript:hideOtherLanguage({$lang.id_lang|escape:'htmlall':'UTF-8'} );" tabindex="-1">{$lang.name|escape:'html'}</a></li>
                            {/foreach}
                        </ul>
                    </div>
                    {/if}
                    {if $languages|count > 1}
                </div>
                {/if}
                {/foreach}
        
            </div>
        </div>
        <div class="col-xs-2">
            <div class="form-group">
            	<div class="col-lg-12">
					<input value="{$page.bg nofilter}" type="text" class="social-bg">
                </div>        
            </div>
        </div>
        <div class="col-xs-2">
            <div class="form-group">
            	<div class="col-lg-12">
                    <input value="{$page.icon nofilter}" type="text" class="social-icon">
                </div>        
            </div>
        </div>
        <i class="icon-trash js-remove "></i>
    </div>
    {/strip}
    {/function}
    
    <div id="selected-social-temp" class="hidden">
        {foreach from=$languages item=lang}
            {$page['title'][$lang.id_lang] = ''}
            {$page['url'][$lang.id_lang] = ''}
        {/foreach}
        	{$page['bg'] = ''}
            {$page['icon'] = ''}
        {social_temp_lang page=$page}
    </div>
    
    
    <div class="form-group">
        <div class="col-lg-12">
        	<div class="row">
            	<div class="col-xs-5">{l s='Title' mod='nrtsocialfollows'}</div>
                <div class="col-xs-3">{l s='Url' mod='nrtsocialfollows'}</div>
                <div class="col-xs-2">{l s='Background/Color' mod='nrtsocialfollows'}</div>
                <div class="col-xs-2">{l s='Icon' mod='nrtsocialfollows'}</div>
            </div>
            <br/>
			<div id="selected-social">
                {foreach $fields_value['content'] as $content}
                    {foreach from=$languages item=lang}
                    	{if isset($content['title'][$lang.id_lang])}
                        	{$page['title'][$lang.id_lang] = $content['title'][$lang.id_lang]}
                        {else} 
                        	{$page['title'][$lang.id_lang] = ''}   
                        {/if}
                    	{if isset($content['url'][$lang.id_lang])}
                        	{$page['url'][$lang.id_lang] = $content['url'][$lang.id_lang]}
                        {else} 
                        	{$page['url'][$lang.id_lang] = ''}   
                        {/if}
                    {/foreach}
                    {$page['bg'] = $content['bg']}
                	{$page['icon'] = $content['icon']}
            		{social_temp_lang page=$page}
				{/foreach}
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-3"></label>
        <div class="col-lg-9">
        	<div class="row">
            	<div class="col-lg-5 col-xs-12">
                    <button type="button" id="add-custom-link" class="btn btn-default btn-lg">
                         <i class="icon-plus"></i> {l s='Add' mod='nrtsocialfollows'}
                    </button>
                </div>
            </div>
        </div>
    </div>
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
