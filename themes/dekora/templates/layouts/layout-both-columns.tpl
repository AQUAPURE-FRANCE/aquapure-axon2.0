{**
* 2007-2019 PrestaShop and Contributors
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to https://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2019 PrestaShop SA and Contributors
* @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}

<!doctype html>
<html lang="{$language.iso_code}">
    <head>
        {block name='head'}
        	{include file='_partials/head.tpl'}
        {/block}
    </head>
    <body id="{$page.page_name}" class="{$page.body_classes|classnames}{if isset($nrt_themect_general_main_layout)} {$nrt_themect_general_main_layout}{/if}{if isset($nrt_themect_header_layout)} header-desktop-{$nrt_themect_header_layout}{/if}{if isset($nrt_themect_header_m_layout)} header-mobile-{$nrt_themect_header_m_layout}{/if}{if isset($active_footer_layout)} footer-{$active_footer_layout}{/if}{if isset($nrt_themect_general_style_content_page)} content-type-{$nrt_themect_general_style_content_page}{/if}{if isset($nrt_themect_general_page_is_fullwidth) && $nrt_themect_general_page_is_fullwidth} is-full-width{/if}{if isset($nrt_themect_general_affix_scroll) && $nrt_themect_general_affix_scroll} has-sticky{/if}{if isset($nrt_themect_sticky_md) && $nrt_themect_sticky_md} menu-sticky{/if}{if isset($nrt_themect_sticky_xs) && $nrt_themect_sticky_xs} menu-sticky-mb{/if}{if isset($nrt_themect_category_banner_layout) && !$nrt_themect_category_banner_layout} has-banner-full-width{/if}">
        {block name='hook_after_body_opening_tag'}
          {hook h='displayAfterBodyOpeningTag'}
        {/block}
        <main>
            {block name='product_activation'}
                {include file='catalog/_partials/product-activation.tpl'}
            {/block}      
            {block name='header'}
                {include file='_partials/header.tpl'}
            {/block}
			{block name='breadcrumb'}
				{include file='_partials/breadcrumb.tpl'}
			{/block}
            {block name='notifications'}
                {include file='_partials/notifications.tpl'}
            {/block}
			{block name='banner_full_width'}{/block}
            {block name="wrapper"}
                <div id="wrapper">
                    {hook h="displayWrapperTop"}
                    <div class="container container-parent">
                        {block name='title_header'}{/block}
                        {block name='maps_contact'}{/block}
                    </div>
					{block name='block_category_description'}{/block}
					{block name='block_full_width'}
                    <div class="container container-parent">
                        <div class="row">
                            {block name="content_wrapper"}
                                <div id="content-wrapper" class="left-column right-column col-xs-12 col-lg-6">
                                    <div id="main-content">
                                        {hook h="displayContentWrapperTop"}
                                        {block name="content"}
                                            <p>Hello world! This is HTML5 Boilerplate.</p>
                                        {/block}
                                        {hook h="displayContentWrapperBottom"}
                                    </div>
                                </div>
                            {/block}
                            {block name="left_column"}
                                <div id="left-column" class="col-xs-12 col-lg-3">
                                    <div id="left-content">
										{block name="left_content"}
											{hook h="displayLeftColumn"}
										{/block}
                                    </div>
                                </div>
                            {/block}
                            {block name="right_column"}
                                <div id="right-column" class="col-xs-12 col-lg-3">
                                    <div id="right-content">
										{block name="right_content"}
											{hook h="displayRightColumn"}
										{/block}
                                    </div>
                                </div>
                            {/block}
                        </div>
                    </div>
					{/block}
                    {block name='product_footer_container'}{/block}
                    {hook h="displayWrapperBottom"}
                </div>
            {/block}
            {block name="footer"}
                {include file="_partials/footer.tpl"}
            {/block}
        </main>
		
        {block name='javascript_bottom'}
          {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
        {/block}
        {block name='hook_before_body_closing_tag'}
          {hook h='displayBeforeBodyClosingTag'}
        {/block}
		{hook h='displaySearchBox'}
		{hook h='displayPopupNewsLetter'}
		{hook h='displayModalAddWishList'}
		{include file="_partials/side_bar/account.tpl"} 
		{include file="_partials/side_bar/facets-search.tpl"} 
		{include file="_partials/side_bar/login-comment.tpl"} 
		{include file="_partials/side_bar/login-wishlist.tpl"} 
		{include file="_partials/side_bar/mega-menu.tpl"} 
		{include file="_partials/side_bar/shoppingcart.tpl"} 
		<div class="slide-bar-backdrop" data-dismiss="slide-bar"></div>
		<button id="back-top">
			<i class="zmdi zmdi-long-arrow-up"></i>
		</button>
		
    </body>
</html>
