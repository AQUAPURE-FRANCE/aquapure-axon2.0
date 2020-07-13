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
	 
{extends file='catalog/listing/product-list.tpl'}
	 
{$c_imageType	= 'category_default'}
	 
{if isset($nrt_themect_category_image_type)}
	{$c_imageType = $nrt_themect_category_image_type}
{/if} 
	 
{block name='title_header'}
	{if isset($nrt_themect_category_show_sub) && $nrt_themect_category_show_sub}
		{include file='catalog/_partials/miniatures/category-subcategories.tpl'}
	{/if}
	<div class="title-header{if $category.description} title-has-description{/if}">
		<h1 class="page-title">
			<span>
				{$category.name}
			</span>
		</h1>
		{if $category.description}
			<div class="category-description">{$category.description nofilter}</div>
		{/if}
	</div>
{/block} 
	 
{block name='block_category_description'}
	{hook h='displayCategoryPageBuilder'}
{/block}  
	 
{if isset($nrt_themect_category_banner_layout) && !$nrt_themect_category_banner_layout} 
	{block name='banner_full_width'}
		{if $category.image.bySize.{$c_imageType}.url}
			<div class="category-banner{if $category.description} has-description{/if}">
				<div class="img-placeholder {$c_imageType}">
					<img
						class="img-loader lazy-load" 
						data-src="{$category.image.bySize.{$c_imageType}.url}"
						src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
						alt="{$category.name}"
						title="{$category.name}" 
						width="{$category.image.bySize.{$c_imageType}.width}"
						height="{$category.image.bySize.{$c_imageType}.height}"
					>
				</div> 
			</div>
		{/if} 
	{/block}
{else}
    {block name='banner_boxed'}
		{if $category.image.bySize.{$c_imageType}.url}
			<div class="category-banner-boxed">
				<div class="img-placeholder {$c_imageType}">
					<img
						class="img-loader lazy-load" 
						data-src="{$category.image.bySize.{$c_imageType}.url}"
						src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
						alt="{$category.name}"
						title="{$category.name}" 
						width="{$category.image.bySize.{$c_imageType}.width}"
						height="{$category.image.bySize.{$c_imageType}.height}"
					>
				</div> 
			</div>
		{/if} 
    {/block}
{/if}
