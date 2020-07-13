<section class="contact-form">
<h4 class="hidden">.</h4>
  <form action="{$urls.pages.contact}#main-content" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>
	<div class="form-group row">
		<div class="col-md-12">
		  <h3>{l s='LEAVE A MESSAGE' d='Shop.Theme.Global'}</h3>
		</div>
	</div>
    {if $notifications}
        <div class="row">
            <div class="col-xs-12">
                <div class="alert {if $notifications.nw_error}alert-danger{else}alert-success{/if}">
                    <ul style="margin:0;">
                        {foreach $notifications.messages as $notif}
                            <li>{$notif}</li>
                        {/foreach}
                    </ul>
                </div>
            </div>
        </div>
    {/if}
	{if !$notifications || $notifications.nw_error}
		<section class="form-fields">
		  <div class="form-group row">
			<div class="col-xs-12">
			  <select name="id_contact" class="form-control form-control-select">
				{foreach from=$contact.contacts item=contact_elt}
				  <option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
				{/foreach}
			  </select>
			</div>
		  </div>

		  <div class="form-group row">
			<div class="col-xs-12">
			  <input
				class="form-control"
				name="from"
				type="email"
				value="{$contact.email}"
				placeholder="{l s='your@email.com' d='Shop.Forms.Help'}"
			  >
			</div>
		  </div>

		  {if $contact.orders}
			<div class="form-group row">
			  <div class="col-xs-12">
				<select name="id_order" class="form-control form-control-select">
				  <option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
				  {foreach from=$contact.orders item=order}
					<option value="{$order.id_order}">{$order.reference}</option>
				  {/foreach}
				</select>
			  </div>
			</div>
		  {/if}

		  {if $contact.allow_file_upload}
			<div class="form-group row">
			  <div class="col-xs-12">
				<input type="file" name="fileUpload" class="filestyle" data-buttonText="{l s='Choose file' d='Shop.Theme.Actions'}">
			  </div>
			</div>
		  {/if}

		  <div class="form-group row">
			<div class="col-xs-12">
			  <textarea
				class="form-control"
				name="message"
				placeholder="{l s='How can we help?' d='Shop.Forms.Help'}"
				rows="3"
			  >{if $contact.message}{$contact.message}{/if}</textarea>
			</div>
		  </div>
			{if isset($id_module)}
			  <div class="form-group row">
				<div class="col-xs-12">
				  {hook h='displayGDPRConsent' id_module=$id_module}
				</div>
			  </div>
			{/if}
		</section>

		<footer class="form-footer">
			<style>
			  input[name=url] {
				display: none !important;
			  }
			</style>
			<input type="text" name="url" value=""/>
			<input type="hidden" name="token" value="{$token}" />
			<input class="btn btn-primary" type="submit" name="submitMessage" value="{l s='Send message' d='Shop.Theme.Actions'}">
		</footer>
	{/if}
  </form>
</section>
