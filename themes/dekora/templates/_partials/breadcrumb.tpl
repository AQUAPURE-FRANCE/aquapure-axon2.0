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

<nav class="breadcrumb hidden-md-down title_font">
  <ol itemscope itemtype="http://schema.org/BreadcrumbList">
    {foreach from=$breadcrumb.links item=path name=breadcrumb}
      <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        <a itemprop="item" href="{$path.url}">
          <span itemprop="name">{$path.title}</span>
        </a>
        <meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
      </li>
    {/foreach}
  </ol>
</nav>
 *}

{if count($breadcrumb.links) == 1 || !$breadcrumb.links[1]}
    {$breadcrumb.links[1]['title'] = "{$page.meta.title}"}
    {$breadcrumb.links[1]['url'] = "{$urls.current_url}"}
{/if}
	 
<nav id="breadcrumb"{if isset($nrt_themect_bg_breadcrumb_img) && $nrt_themect_bg_breadcrumb_img} class="lazy-load" data-src="{$nrt_themect_bg_breadcrumb_img}"{/if}>
	<div class="container container-parent title_font">
		<ol itemscope itemtype="http://schema.org/BreadcrumbList">
			{foreach from=$breadcrumb.links item=path name=breadcrumb}
				{if $path.title}
					<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
						<a itemprop="item" href="{$path.url}">
							<span itemprop="name">
								{$path.title}
							</span>
						</a>
						<meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
					</li>
				{/if}
			{/foreach}
		</ol>
	</div>
</nav>