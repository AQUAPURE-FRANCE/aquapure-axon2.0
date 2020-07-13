<form class="newsletter ajax-newsletter" action="{$urls.pages.index}#footer" method="post">
	<div class="title-newsletter hidden">
		<h4>{l s="Subscribe Newsletter"}</h4>
		{if $conditions}
		   <p class="hidden">{$conditions nofilter}</p>
		{/if}
	</div>
	<div class="content-newsletter">
		<input class="hidden" name="name" type="text" placeholder="{l s='Your name'}">
		<input class="input-email" name="email" type="email" value="{$value}" placeholder="{l s='Your email address' d='Shop.Forms.Labels'}">
		<input type="hidden" name="action" value="0">
		<button class="button-email title_font" name="submitNewsletter" type="submit">
			 <span>{l s='Subscribe' d='Shop.Theme.Actions'}</span>
		</button>
		<div class="send-response">
			{if $msg}
				<p class="alert {if $nw_error}alert-danger{else}alert-success{/if}">
				  {$msg}
				</p>
			{/if}
		</div>
		<div class="text-center">
			{if isset($id_module)}
				{hook h='displayGDPRConsent' id_module=$id_module}
			{/if}
		</div>	
	</div>
</form>
