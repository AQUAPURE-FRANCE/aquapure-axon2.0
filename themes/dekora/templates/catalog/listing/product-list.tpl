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
{extends file=$layout}
	 
{block name='title_header'}
	<div class="title-header">
		<h1 class="page-title">
			<span>
				{$listing.label}
			</span>
		</h1>
	</div>
{/block} 

{block name='content'}
	<section id="main">
		{block name='banner_boxed'}{/block}
		<section id="products">
			{if $listing.products|count}
				{block name='product_list_active_filters'}
					{$listing.rendered_active_filters nofilter}
				{/block}
				{block name='product_list_top'}
					{include file='catalog/_partials/products-top.tpl' listing=$listing}
				{/block}
				<div id="product_list_grid">
					{block name='product_list'}
						<div id="facets-loader-icon"><i class="fa fa-spinner fa-spin"></i></div>
						{include file='catalog/_partials/products.tpl' listing=$listing}
					{/block}
				</div>
				{block name='product_list_bottom'}
					{include file='catalog/_partials/products-bottom.tpl' listing=$listing}
				{/block}
			{else}
				<div id="js-product-list-top"></div>

				<div id="js-product-list">
				  {include file='errors/not-found.tpl'}
				</div>

				<div id="js-product-list-bottom"></div>
			{/if}
		</section>
	</section>
{/block}