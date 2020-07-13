<div class="footer-contact">
	<div class="content_title">
		<div class="title_block title_font h3">
			<div class="title_text">
				{l s='Store information' d='Shop.Theme.Global'}
			</div>	
		</div>
		<span class="title_line"></span>
		{if isset($nrt_themect_footer_collapse) && $nrt_themect_footer_collapse}
			<span class="navbar-toggler collapse-icons hidden-lg-up" data-target="#footer_sub_menu_contact" data-toggle="collapse">
				<i class="zmdi zmdi-chevron-up add"></i>
				<i class="zmdi zmdi-chevron-down remove"></i>
			</span>
		{/if}
	</div>	
	<ul {if isset($nrt_themect_footer_collapse) && $nrt_themect_footer_collapse}id="footer_sub_menu_contact" class="collapse"{/if}>
	  {if $contact_infos.address.address1 || $contact_infos.address.address2}
		  <li>
			<span>{l s="Address:"}</span>  
			<a href="{$urls.pages.contact}" title="{l s='Contact us' d='Shop.Theme.Global'}">
				{$contact_infos.address.address1 nofilter}{$contact_infos.address.address2 nofilter}
			</a>
		  </li> 
	  {/if}
	  {if $contact_infos.email}
		  <li>
			<span>{l s="Email:"}</span>  
			<a href="mailto:{$contact_infos.email}">
				{$contact_infos.email}
			</a>
		  </li> 
	  {/if}
	  {if $contact_infos.phone || $contact_infos.fax}
		  <li>
			<span>{l s="Phone:"}</span>    
			{if $contact_infos.phone}   
				<a href="tel:{$contact_infos.phone|replace:' ':''}">
					{$contact_infos.phone}
				</a>
			{/if}  
		  </li> 
	  {/if} 
	  {if $contact_infos.fax}
		  <li>
			<span>{l s="Fax:"}</span>    
			{if $contact_infos.fax}   
				<a href="tel:{$contact_infos.fax|replace:' ':''}">
					{$contact_infos.fax}
				</a>
			{/if}  
		  </li> 
	  {/if} 
	  {if !$contact_infos.phone && !$contact_infos.email && !$contact_infos.fax}
		  <li>
			<a href="{$urls.pages.contact}" title="{l s='Contact us' d='Shop.Theme.Global'}">
				{l s='Contact us' d='Shop.Theme.Global'}
			</a>
		  </li> 
	  {/if} 
	</ul>
</div>