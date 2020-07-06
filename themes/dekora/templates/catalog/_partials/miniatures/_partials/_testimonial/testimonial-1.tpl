<div class="item-inner">
	<div class="main-block">
		<div class="content_test_top">
			<div class="content_test_box">
				{if $testimonial.src}
					<div class="wrapper-img">
						<div class="img-placeholder" style="padding-top: 100%;">
							<img
								class="img-loader lazy-load" 
								data-src="{$testimonial.src}"
								src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
								alt="{$testimonial.name_post}"
								title="{$testimonial.name_post}" 
							>
						</div>
					</div>
				{/if}
				<p class="des_namepost"><b class="title_font">{$testimonial.name_post}</b>{$testimonial.company}</p>
			</div>
			<div class="des_testimonial">
				<i class="fa fa-quote-left"></i>
				{$testimonial.text nofilter}
				<i class="fa fa-quote-right"></i>
			</div>
		</div>
	</div>
</div>