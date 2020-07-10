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
    {if $input.type == 'repository_links'}    
        <div class="col-xs-6">
            <div class="panel link-selector">
                <div class="panel-heading">{$input.label}</div>
                <ul id="repository-list">
                  <li class="list-subtitle">{l s='Cms pages' mod='nrtpagebuilder'}</li>
                  {foreach $cms_pages as $cms_category}
                        <li data-id="{$cms_category.id_cms_category}" data-type="cms_category">
                          <span class="drag-handle">&#9776;</span>
                          {$cms_category.name|escape} 
                          <small>({l s='cms category' mod='nrtpagebuilder'})</small> 
                          <i class="icon-trash js-remove "></i>
                        </li>
                        {foreach $cms_category.pages as $key => $page}
                            <li data-id="{$page.id_cms}" data-type="cms">
                              <span class="drag-handle">&#9776;</span>
                              {$page.title|escape}
                              <small>({l s='cms page' mod='nrtpagebuilder'})</small> 
                              <i class="icon-trash js-remove "></i>
                            </li>
                        {/foreach}
                  {/foreach}
                  <li class="list-subtitle">{l s='Product pages' mod='nrtpagebuilder'}</li>
                  {foreach $product_pages as $product_page}
                    {foreach $product_page.pages as $key => $page}
                      <li data-id="{$page.id_cms}" data-type="product">
                          <span class="drag-handle">&#9776;</span>
                          {$page.title|escape} 
                          <small>({l s='product page' mod='nrtpagebuilder'})</small> 
                          <i class="icon-trash js-remove "></i>
                      </li>
                    {/foreach}
                  {/foreach}
                  <li class="list-subtitle">{l s='Static pages' mod='nrtpagebuilder'}</li>
                  {foreach $static_pages as $static}
                    {foreach $static.pages as $key => $page}
                      <li data-id="{$page.id_cms}" data-type="static">
                          <span class="drag-handle">&#9776;</span>
                          {$page.title|escape} 
                          <small>({l s='static page' mod='nrtpagebuilder'})</small> 
                          <i class="icon-trash js-remove "></i>
                      </li>
                    {/foreach}
                  {/foreach}
                </ul>
            </div>
        </div>
    {elseif $input.type == 'selected_links'}
	
	{foreach from=$languages item=language}
		<input type="hidden" name="content-{$language.id_lang|escape:'htmlall':'UTF-8'}" id="selected-links-{$language.id_lang|escape:'htmlall':'UTF-8'}" value="">
	{/foreach}

    {function name="custom_link_lang" page=[]}
    {strip}
    <div class="form-group">
        <label class="control-label col-lg-3">
            {l s='Title' mod='nrtpagebuilder'}
        </label>
        {foreach from=$languages item=language}
        {if $languages|count > 1}
        <div class="translatable-field lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" {if $language.id_lang != $defaultFormLanguage}style="display:none"{/if}>
        {/if}
            <div class="col-lg-7">
                <input value="{if isset($page.title[$language.id_lang])}{$page.title[$language.id_lang]}{/if}" type="text" class="link-title-{$language.id_lang|escape:'htmlall':'UTF-8'}">
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

    <div class="form-group">
        <label class="control-label col-lg-3">
            {l s='Url' mod='nrtpagebuilder'}
        </label>
        {foreach from=$languages item=language}
        {if $languages|count > 1}
        <div class="translatable-field lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" {if $language.id_lang != $defaultFormLanguage}style="display:none"{/if}>
            {/if}
            <div class="col-lg-7">
                <input value="{if isset($page.url[$language.id_lang])}{$page.url[$language.id_lang]}{/if}" type="text" class="link-url-{$language.id_lang|escape:'htmlall':'UTF-8'}">
                <p class="help-block">{l s='Put absolute url with http:// or https:// prefix' mod='nrtpagebuilder'}</p>
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
    {/strip}
    {/function}
    
    <div class="col-xs-6">
        <div class="panel link-selector">
            <div class="panel-heading">{$input.label}</div>
            <div class="drag-info">
            	<span class="drag-handle">&#9776;</span>
                {l s='Drag&drop links below from repository' mod='nrtpagebuilder'}
            </div>
            <ul id="selected-list">
                {foreach $selected_links as $page}
                    {if ($page.type == 'custom')}
                        <li data-type="{$page.type}"><span class="drag-handle">&#9776;</span>
                            {custom_link_lang page=$page}
                        <i class="icon-trash js-remove "></i></li>
                    {else}
                        <li data-type="{$page.type}" data-id="{$page.id}"><span class="drag-handle">&#9776;</span>{$page.data.title}<small>
                         {if ($page.type == 'cms_category')}({l s='cms category' mod='nrtpagebuilder'}){/if} 
                         {if ($page.type == 'cms')}({l s='cms page' mod='nrtpagebuilder'}){/if}
                         {if ($page.type == 'product')}({l s='product page' mod='nrtpagebuilder'}){/if} 
                         {if ($page.type == 'static')}({l s='static page' mod='nrtpagebuilder'}){/if} 
                        </small> <i class="icon-trash js-remove "></i></li>
                    {/if}
                {/foreach}
            </ul>
        </div>
        <div class="panel link-selector">
            <div class="drag-info">{l s='Or add custom link' mod='nrtpagebuilder'} </div>
            <div id="custom-links-panel">
            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Title' mod='nrtpagebuilder'}
                </label>
                {foreach from=$languages item=language}
                {if $languages|count > 1}
                <div class="translatable-field lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" {if $language.id_lang != $defaultFormLanguage}style="display:none"{/if}>
                    {/if}
                    <div class="col-lg-7">
                        <input value="" type="text" class="link-title-{$language.id_lang|escape:'htmlall':'UTF-8'}">
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
        
            <div class="form-group">
                <label class="control-label col-lg-3">
                   {l s='Url' mod='nrtpagebuilder'}
                </label>
                {foreach from=$languages item=language}
                {if $languages|count > 1}
                <div class="translatable-field lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" {if $language.id_lang != $defaultFormLanguage}style="display:none"{/if}>
                    {/if}
                    <div class="col-lg-7">
                        <input value="" type="text" class="link-url-{$language.id_lang|escape:'htmlall':'UTF-8'}">
                        <p class="help-block">{l s='Put absolute url with http:// or https:// prefix' mod='nrtpagebuilder'}</p>
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
        
            <div class="form-group">
                <button type="button" id="add-custom-link" class="btn btn-default btn-lg">
                     <i class="icon-plus"></i> {l s='Add' mod='nrtpagebuilder'}
                </button>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    {else}
        {$smarty.block.parent}
    {/if}
{/block}
