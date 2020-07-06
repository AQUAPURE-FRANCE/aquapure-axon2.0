{**
 * 2007-2016 PrestaShop
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
 * @copyright 2007-2016 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='layouts/layout-both-columns.tpl'}
	 
{block name='title_header'}
	<div class="title-header">	
		<h1 class="page-title">
			<span>
				{l s='Contact us' d='Shop.Theme.Global'}
			</span>
		</h1>
	</div>
{/block}

{block name='right_column'}{/block}

{block name='maps_contact'}
	{if isset($nrt_themect_maps_js) && $nrt_themect_maps_js}
		<div class="nrt-maps" style="height:400px;">
			<iframe class="lazy-load" data-src="https://maps.google.com/maps?&amp;q={if isset($nrt_themect_maps_address) && $nrt_themect_maps_address}{$nrt_themect_maps_address|urlencode}{/if}&amp;z=12&amp;t=q&amp;output=embed" style="height: 100%; width: 100%;" frameborder="0"></iframe>
		</div>
	{/if}
{/block}

{block name='content_wrapper'}
  <div id="content-wrapper" class="left-column col-xs-12 col-lg-8">
  	<div id="main-content">
        {hook h="displayContentWrapperTop"}
            {block name="content"}
                {widget name="contactform"}
            {/block}
        {hook h="displayContentWrapperBottom"}
    </div>
  </div>
{/block}

{block name="left_column"}
    <div id="left-column" class="col-xs-12 col-lg-4">
        <div id="left-content">
			{block name="left_content"}
				{widget name="ps_contactinfo" hook='displayLeftColumn'}
			{/block}
        </div>
    </div>
{/block}