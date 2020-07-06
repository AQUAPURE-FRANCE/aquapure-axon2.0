<div class="item-inner">
    <div class="news_module_image_holder">
        <div class="inline-block_relative">
            <div class="right_blog_home">  
				<a class="post_title title_font" href="{$post.url}">
					{$post.title}
				</a> 
				<span class="date_added">
					<i class="fa fa-clock-o"></i>
					<span>
						{l s='Date:'} 
						{$post.created|date_format:d}
						{$post.created|date_format:M},
						{$post.created|date_format:Y}
					</span>
				</span>
				{if $post.smartshowauthor == 1}
					<span class="date_added">
						<i class="fa fa-user"></i>
						<span>
						{if $post.smartshowauthorstyle != 0}
							{$post.firstname|escape:'htmlall':'UTF-8'}{$post.lastname|escape:'htmlall':'UTF-8'}
						{else} 
							{$post.lastname|escape:'htmlall':'UTF-8'}{$post.firstname|escape:'htmlall':'UTF-8'}
						{/if}
						</span>	
					</span>
				{/if}	
				<span class="date_added">
					<i class="fa fa-eye"></i>
					<span>
						{$post.viewed}												   
						{if $post.viewed < 2}
							{l s='View'}
						{else}
							{l s='Views'}												   
						{/if}
					</span>
				</span>
				<span class="date_added">
					<i class="fa fa-comment"></i>
					<span>
						{$post.totalcomment = Blogcomment::getToltalComment($post.id)}

						{if $post.totalcomment < 1}
							0
						{else}
							{$post.totalcomment}												   
						{/if}
						{if $post.totalcomment < 2}
							{l s='Comment'}
						{else}
							{l s='Comments'}												   
						{/if}
					</span>
				</span>
                <div class="content">		
					<p>
						{$post.short_description nofilter}
					</p> 
                </div> 		
				<a class="read-more-blog" href="{$post.url}">
					{l s='Read more' }
					<i class="fa fa-long-arrow-right"></i>
				</a>
            </div>
        </div>
    </div>
</div>

                            