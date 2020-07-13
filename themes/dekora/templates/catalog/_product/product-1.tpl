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

{block name='wrapper'}
	<div id="wrapper">
		{hook h="displayWrapperTop"}
		<div class="container container-parent">
			{hook h="displayContentWrapperTop"}
			<section id="main" class="product-layout-1" itemscope itemtype="https://schema.org/Product">
				<meta itemprop="url" content="{$product.url}">
				<div class="row">
					<div id="content-wrapper" class="right-column col-xs-12 col-lg-9">
						<div id="main-content">
							<div class="row row-product">
								<div class="col-xs-12 col-lg-6 col-product-image">
									{block name='page_content_container'}
										{block name='page_content'}		
											<div class="js-wrapper-scroll no_grid">	  
												{block name='product_cover_tumbnails'}
													{include file='catalog/_partials/product-cover-thumbnails.tpl'}
												{/block}
											</div>
										{/block}
									{/block}
								</div>
								<div class="col-xs-12 col-lg-6 col-product-info">
									<div class="content-product-detail">
										{block name='page_header_container'}
											{block name='page_header'}
											<div class="wrapper-name-detail">
												<h1 class="name_detail" itemprop="name">
													{block name='page_title'}{$product.name}{/block}
												</h1>
												{hook h='displayProductsLinkNav' product=$product category=$category}  
											</div>
											{/block}
										{/block}

										{hook h='displayProductCommentExtra'}

										{block name='product_prices'}
											{include file='catalog/_partials/product-prices.tpl'}
										{/block} 

										{block name='product_description_short'}
											<div id="product-description-short-{$product.id}" class="product-description-short-detail" itemprop="description">
												{$product.description_short nofilter}
											</div>
										{/block}

										{hook h='displayMultiAccessoriesProduct'}

										{if isset($has_sizeguide)}
											<div class="sizechart-show" data-toggle="modal" data-target="#moda_sizechart">
												{l s='Size Guide'}
											</div>
										{/if}

										{block name='product_images_modal'}
											{include file='catalog/_partials/product-images-modal.tpl'}
										{/block} 

										<div class="product-information">
											{if $product.is_customizable && count($product.customizations.fields)}
												<div class="product-customization-button">
													{if !$configuration.is_catalog}
													<h3 class="action_product_customization" data-toggle="modal" data-target="#moda_product_customization">
														<i class="zmdi zmdi-edit"></i>
														{l s='Product customization' d='Shop.Theme.Catalog'}
													</h3>
													<p>( {l s='If you can not add products to your cart, please customize the product!'} )</p>
													{/if}	
												</div>
											{/if}
											<div class="product-actions"> 
												{block name='product_buy'}
													<form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
														<input type="hidden" name="token" value="{$static_token}">
														<input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
														<input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

														{block name='product_variants'}
															{include file='catalog/_partials/product-variants.tpl'}
														{/block}

														{block name='product_pack'}
															{if $packItems}
																<section class="product-pack">
																	<p class="h4">
																		{l s='This pack contains' d='Shop.Theme.Catalog'}
																	</p>
																{foreach from=$packItems item="product_pack"}
																	{block name='product_miniature'}
																		{include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
																	{/block}
																{/foreach}
																</section>
															{/if}
														{/block}

														{block name='product_discounts'}
															{include file='catalog/_partials/product-discounts.tpl'}
														{/block}

														{block name='product_add_to_cart'}
															{include file='catalog/_partials/product-add-to-cart.tpl'}
														{/block}

														{block name='product_refresh'}{/block}
													</form>              
												{/block}
											</div>	
											{hook h='displayProductAdditionalInfo' product=$product}
											{hook h='displayProductTags'}
										</div>
									</div>
								</div>
							</div>
							{if isset($nrt_themect_product_tabs_type) && 
								($nrt_themect_product_tabs_type == 3 || $nrt_themect_product_tabs_type == 4)}
								{include file='catalog/_partials/product-tabs-accordion.tpl'}
							{else}
								{include file='catalog/_partials/product-tabs-h-v.tpl'}
							{/if}

							{if $product.is_customizable && count($product.customizations.fields)}
								{include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
							{/if}
							{hook h='displayProductSizeGuide'}
						</div>	
					</div>
					<div id="right-column" class="col-xs-12 col-lg-3">
						<div id="right-content">
							{block name="right_content"}
								{if isset($product_manufacturer->id)}
								  <div class="right-product-manufacturer">
									{if isset($manufacturer_image_url)}
									  <a href="{$product_brand_url}" title="{$product_manufacturer->name}">
										<img src="{$manufacturer_image_url}" class="img-responsive" alt="{$product_manufacturer->name}">
									  </a>
									{/if}
								  </div>
								{/if}
								{* {hook h="displayRightColumnProduct"} *}
							{/block}
						</div>
					</div>
				</div>
			</section>
			{hook h="displayContentWrapperBottom"}
		</div>
		{block name='product_footer_container'}
			 <div id="product-footer">
				{hook h='displayFooterProduct' product=$product category=$category}
			 </div>
		{/block}
		{hook h="displayWrapperBottom"}
	</div>
{/block}
