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
	 
{$imageType	= 'large_default'}

{if isset($nrt_themect_product_image_type)}
	{$imageType = $nrt_themect_product_image_type}
{/if}	 
	 
<div class="images-container">
	{block name='product_cover'}
	<meta itemprop="image" content="{$product.cover.bySize.{$imageType}.url}">
	<div class="product-cover">
		{include file='catalog/_partials/miniatures/flags.tpl'}
		<div class="js-scroll-large-images row">
			<div class="item-image item-image-0 col-xs-12 col-sm-6">
				<div class="box-item-image">
					<div class="img-placeholder {$imageType}">
						<div class="easyzoom easyzoom-product">
							<a href="{$product.cover.bySize.{$imageType}.url}"></a>
						</div>
						{if $product.cover}
							{$image = $product.cover}
						{else}
							{$image = $urls.no_picture_image}
						{/if}
						<img
							class="img-loader lazy-load" 
							data-src="{$image.bySize.{$imageType}.url}"
							src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
							alt="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
							title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}" 
							width="{$image.bySize.{$imageType}.width}"
							height="{$image.bySize.{$imageType}.height}"
						>
					</div>
					<a class="layer" href="{$product.cover.bySize.{$imageType}.url}">
						<i class="fto fto-plus zoom-in"></i>
					</a>
				</div>
			</div>
			{assign var="item_key" value="1"}
			{foreach from=$product.images item=image}
				{if $image.bySize.{$imageType}.url != $product.cover.bySize.{$imageType}.url}
					<div class="item-image item-image-{$item_key} col-xs-12 col-sm-6">
						<div class="box-item-image">
							<div class="img-placeholder {$imageType}">
								<div class="easyzoom easyzoom-product">
									<a href="{$image.bySize.{$imageType}.url}"></a>
								</div>
								<img
									class="img-loader lazy-load" 
									data-src="{$image.bySize.{$imageType}.url}"
									src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
									alt="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
									title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}" 
									width="{$image.bySize.{$imageType}.width}"
									height="{$image.bySize.{$imageType}.height}"
								>
							</div>
							<a class="layer" href="{$image.bySize.{$imageType}.url}">
								<i class="fto fto-plus zoom-in"></i>
							</a>
						</div>
					</div>
					{assign var="item_key" value="`$item_key+1`"}
				{/if}
			{/foreach}
		</div>
	</div>
	{/block}
	{block name='product_images'}
	<div class="box_thumb images-{count($product.images)}">
		<div class="product-images js-scroll-small-images">
			<div class="item-image item-image-0">
				<div class="box-item-image">
					<div class="img-placeholder {$imageType}">
						{$image = $product.cover}
						<img
							class="img-loader lazy-load" 
							data-src="{$image.bySize.{$imageType}.url}"
							src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
							alt="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
							title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}" 
							width="{$image.bySize.{$imageType}.width}"
							height="{$image.bySize.{$imageType}.height}"
						>
					</div>
				</div>
			</div>
			{assign var="item_key" value="1"}
			{foreach from=$product.images key=item_key item=image}
				{if $image.bySize.{$imageType}.url != $product.cover.bySize.{$imageType}.url}
					<div class="item-image item-image-{$item_key}">
						<div class="box-item-image">
							<div class="img-placeholder {$imageType}">
								<img
									class="img-loader lazy-load" 
									data-src="{$image.bySize.{$imageType}.url}"
									src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
									alt="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
									title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}" 
									width="{$image.bySize.{$imageType}.width}"
									height="{$image.bySize.{$imageType}.height}"
								>
							</div>
						</div>
					</div>
					{assign var="item_key" value="`$item_key+1`"}
				{/if}
			{/foreach}
		</div>
	</div>
	{/block}
</div>
{hook h='displayAfterProductThumbs'}