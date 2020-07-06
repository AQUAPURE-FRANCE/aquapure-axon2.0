<div class="item-inner">
    <div class="news_module_image_holder">
        <div class="inline-block_relative">
            <div class="image_holder_wrap">
                <a href="{$post.url}">  
					<div class="img-placeholder {$post.image.type}">
						<img
							class="img-loader lazy-load" 
							data-src="{$post.image.url}"
							src="{if isset($nrt_themect_placeholder)}{$nrt_themect_placeholder}{/if}" 
							alt="{$post.title}"
							title="{$post.title}" 
							width="{$post.image.width}"
							height="{$post.image.height}"
						>
					</div>
                </a>
            </div> 
            <div class="right_blog_home">    
                <h3 class="post_title">
                    <a href="{$post.url}">
                        {$post.title}
                    </a>
                </h3>   
                <p>
                    {$post.short_description nofilter}
                </p>   
				<a class="post_read_more" href="{$post.url}">
					{l s="Read More"}
					<i class="fa fa-angle-right"></i>
				</a>				
            </div>
        </div>
    </div>
</div>