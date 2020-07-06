{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='page.tpl'}

{block name='page_title'}
  <span class="store-title">{l s='Our stores' d='Shop.Theme.Global'}</span>	 
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-stores">

    {foreach $stores as $store}
      <article id="store-{$store.id}" class="store-item">
        <div class="store-item-container clearfix">
			<div class="row">
				<div class="col-xs-12 col-sm-4 store-picture">
					<img class="img-responsive" src="{$store.image.bySize.stores_default.url}" alt="{$store.image.legend}" title="{$store.image.legend}">
				</div>
				<div class="col-xs-12 col-sm-4 store-description">
					<h3 class="h3 card-title">{$store.name}</h3>
					<address>{$store.address.formatted nofilter}</address>
					{if $store.note || $store.phone || $store.fax || $store.email}			  
						<div class="info-store" data-toggle="modal" data-target="#about-{$store.id}">
							<i class="zmdi zmdi-info-outline"></i>
							{l s='About and Contact' d='Shop.Theme.Global'}
						</div>
					{/if}
				</div>
				<div class="col-xs-12 col-sm-4 divide-left">
					<table>
					  {foreach $store.business_hours as $day}
					  <tr>
						<th>{$day.day|truncate:4:'.'}</th>
						<td>
						  <ul>
						  {foreach $day.hours as $h}
							<li>{$h}</li>
						  {/foreach}
						  </ul>
						</td>
					  </tr>
					  {/foreach}
					</table>
				</div>
			</div>
        </div>
		  
		<footer id="about-{$store.id}" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="modal-body">
				  <h4 class="modal-title">
					{$store.name}
				  </h4>	
				  <div class="store-item-footer divide-top">
					<div class="card-store">
					  {if $store.note}
						<p>{$store.note}</p>
					  {/if}
					</div>
					<ul class="card-store">
					  {if $store.phone}
						<li><i class="zmdi zmdi-phone"></i>{$store.phone}</li>
					  {/if}
					  {if $store.fax}
						<li><i class="zmdi zmdi-print"></i>{$store.fax}</li>
					  {/if}
					  {if $store.email}
						<li><i class="zmdi zmdi-email"></i>{$store.email}</li>
					  {/if}
					</ul>
				  </div>
				</div>
			</div>
		  </div>
		</footer>
      </article>
    {/foreach}

  </section>
{/block}
	 
{block name='page_footer_container'}{/block}
