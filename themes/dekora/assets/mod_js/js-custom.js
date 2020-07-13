/*------------------------------------------------------------------------------------------------------------------*/

function createMySpin(){
	
	$('.js-number-qty').each(function() {
		var $this = $(this);
		$this.TouchSpin({
		  buttondown_class: 'hidden',
		  buttonup_class: 'hidden',
		  min: parseInt($this.data('min'), 10),
		  max: 1000000,
		});
    });	
		
}

$(document).ready(function() {
	
	createMySpin();
	
	prestashop.on('updateProductList', function (e) {
		createMySpin();
	});
	
	prestashop.on('updatedProductAjax',function (e) {
		createMySpin();
	});
	
	prestashop.on('mustUpdateTouchSpin',function (e) {
		createMySpin();
	});	
	
});

/*------------------------------------------------------------------------------------------------------------------*/

function myLazyLoad(){
	new LazyLoad({
		elements_selector: ".lazy-load",
		threshold: 30,
		callback_loaded: function(e) {
			$(e).parent().addClass("loaded");
		}
	});
}

$(document).ready(function() {
	
	myLazyLoad();
	
	$('body').on('show.bs.modal','.quickview',(function() {
		myLazyLoad();
	}));
	
    prestashop.on('updatedProduct', function (e) {
        myLazyLoad();
    });
	
	prestashop.on('updateProductList', function (e) {
		myLazyLoad();
	});
	
	prestashop.on('updatedProductAjax',function (e) {
		myLazyLoad();
	});	
	
	prestashop.on('updateCarted',function (e) {
		myLazyLoad();
	});	
	
	prestashop.on('updatedCart',function (e) {
		myLazyLoad();
	});	
	
	prestashop.on('updatedProductThumb',function (e) {
		myLazyLoad();
	});	
	
	prestashop.on('mustUpdateLazyLoad',function (e) {
		myLazyLoad();
	});	
	
});

/*------------------------------------------------------------------------------------------------------------------*/

function scroll_thumbnails() {
	$('.js-wrapper-scroll').each(function() {
		
		var $this = $(this);
		
		$this.find('.js-scroll-large-images:not(.slick-initialized)').first().slick({ 
			dots: false,
			fade: true,
			cssEase: 'linear',
			slidesToShow: 1,
			slidesToScroll: 1,
			infinite: true,
            prevArrow: '<button class="slick-prev slick-arrow">&#10094;</button>',
            nextArrow: '<button class="slick-next slick-arrow">&#10095;</button>',
			asNavFor: $this.find('.js-scroll-small-images')
		});
			
		$this.find('.js-scroll-small-images:not(.slick-initialized)').first().slick({ 
			dots: false,
			arrows: false,
			vertical: false,
			slidesToShow: 4,
			slidesToScroll: 1,
			infinite: true,
            prevArrow: '<button class="slick-prev slick-arrow">&#10094;</button>',
            nextArrow: '<button class="slick-next slick-arrow">&#10095;</button>',
			asNavFor: $this.find('.js-scroll-large-images'),
			focusOnSelect: true
		});
		
		$this.on('afterChange', function(event){
		  	prestashop.emit('updatedProductThumb', null);
		});
		
		prestashop.emit('updatedProductThumb', null);
		
    });		
	
	$('.js-wrapper-scroll-3-items').each(function() {
		
		var $this = $(this);
		
		$this.find('.js-scroll-large-images:not(.slick-initialized)').first().slick({ 
			dots: false,
			slidesToShow: 3,
			slidesToScroll: 1,
			infinite: true,
            prevArrow: '<button class="slick-prev slick-arrow">&#10094;</button>',
            nextArrow: '<button class="slick-next slick-arrow">&#10095;</button>',
			responsive: [
				{
				  breakpoint: 767,
				  settings: {
					slidesToShow: 2
				  }
				},
				{
				  breakpoint: 575,
				  settings: {
					slidesToShow: 1
				  }
				}
			]
		});	
		
		$this.on('afterChange', function(event){
		  	prestashop.emit('updatedProductThumb', null);
		});
		
		prestashop.emit('updatedProductThumb', null);
		
    });
	
	$('.js-wrapper-scroll-vertical').each(function() {
		
		var $this = $(this);
		
		$this.find('.js-scroll-large-images:not(.slick-initialized)').first().slick({ 
			dots: false,
			fade: true,
			cssEase: 'linear',
			slidesToShow: 1,
			slidesToScroll: 1,
			infinite: true,
            prevArrow: '<button class="slick-prev slick-arrow">&#10094;</button>',
            nextArrow: '<button class="slick-next slick-arrow">&#10095;</button>',
			asNavFor: $this.find('.js-scroll-small-images')
		});
			
		$this.find('.js-scroll-small-images:not(.slick-initialized)').first().slick({ 
			dots: false,
			arrows: false,
			vertical: true,
			slidesToShow: 3,
			slidesToScroll: 1,
			infinite: true,
            prevArrow: '<button class="slick-prev slick-arrow">&#10094;</button>',
            nextArrow: '<button class="slick-next slick-arrow">&#10095;</button>',
			asNavFor: $this.find('.js-scroll-large-images'),
			focusOnSelect: true
		});
		
		$this.on('afterChange', function(event){
		  	prestashop.emit('updatedProductThumb', null);
		});
		
		prestashop.emit('updatedProductThumb', null);
		
    });
	
}

function scroll_large_images() {
	$('.js-scroll-large-images').each(function() {
		var $this = $(this);	
		$this.magnificPopup({
			delegate: '.layer',
			type: 'image',
			tLoading: '',
			gallery: {
				enabled: true
			},
			image: {
				verticalFit: false
			}
		});
		
		$this.find('.easyzoom-product').click(function(e) {
			var $this_ = $(this).closest('.box-item-image');
			$this_.find('.layer').click();
		});
		
    });		
}

$(document).ready(function() {
    scroll_thumbnails();
	scroll_large_images();
	
	$('body').on('shown.bs.modal','.quickview',(function() {
		scroll_thumbnails();
		scroll_large_images();
	}));

	prestashop.on('updatedProduct', function (e) {
		scroll_thumbnails();
		scroll_large_images();
	});
});

/*------------------------------------------------------------------------------------------------------------------*/

$('body').on('show.bs.modal','.quickview',(function() {
	$('.quick-view').removeClass('processing');
}));	
	
/*------------------------------------------------------------------------------------------------------------------*/

$('body').on('click','.quick-view',(function() {
	 $(".quick-view").removeClass('processing');
	 $(this).addClass('processing');
}));	

/*------------------------------------------------------------------------------------------------------------------*/

$(document).ready(function() {
	
	var el=$('#back-top');
	
	$(window).scroll(function(){
		if ($(this).scrollTop() >= 500) {
			el.fadeIn();
		} else {
			el.fadeOut();
		}
	});
	
	
	el.click(function(){
	  $('html, body').animate({scrollTop : 0},800);
	  return false;
	});
	
});

/*-----------------------------------------------Footer-fixed-------------------------------------------------*/

function footerFixed() {
	if (typeof (opThemect.footer_fixed) != 'undefined' && opThemect.footer_fixed == 1 && $(window).width() > 991) {
		$('#wrapper').css({'margin-bottom':$('#footer').outerHeight()});
		$('#footer').css({'width':$('main').innerWidth(), 'position': 'fixed', 'z-index': -1, 'bottom': 0});
	}else{
		$('#wrapper').css({'margin-bottom': ''});
		$('#footer').css({'width': '', 'position': '', 'z-index': '', 'bottom': ''});
	}
}

$(window).load(function(e) {
	footerFixed();
});

$(window).on('resize', function() {
	footerFixed();
});

/*------------------------------------------------------------------------------------------------------------------*/

$('body').on('change','.product-variants [data-product-attribute]',(function(e) {
	$(this).closest('.product-variants').find('[data-product-attribute]').not(this).parent().append('<span class="variants-no-event-icon"></span>');
	$(this).parent().append('<span class="variants-loader-icon"><i class="fa fa-spinner fa-spin"></i></span>');
}));

prestashop.on('updateFacets', function (e) {
	$('#product_list_grid').addClass('facets-loading');
});

prestashop.on('updateProductList', function (e) {
	$('#product_list_grid').removeClass('facets-loading');
});

/*------------------------------------------------------------------------------------------------------------------*/

function owlItemImages(){
	$(".js-owl-images").each(function() {
		var item = $(this).data('item');
		var margin = $(this).data('margin');
		$(this).owlCarousel({
			navText: ['&#10094;','&#10095;'],
			navSpeed: 250,
			margin: margin,
			items: item,
			rewind: true,
			nav: true,
			navContainerClass: 'owl-nav-images',
			dotsClass: 'owl-dots-images',
			dots: false,
		});
	});
}

$(document).ready(function() {

    owlItemImages();

    prestashop.on('updateProductList', function (e) {
        owlItemImages();
    });
	
	prestashop.on('updatedProductAjax',function (e) {
		owlItemImages();
	});	
	
	$('body').on('click','.js-img-thumb',(function() {
		$(this).closest('.js-product-miniature').find('.js-img-thumb').removeClass('active');
		$(this).addClass('active');
		var el = $(this).closest('.js-product-miniature').find('.js-img-cover');
		var src = $(this).data('src');
		el.attr('data-src',src);
		el.attr('src',src);
	}));	

});

/*------------------------------------------------------------------------------------------------------------------*/

$('body').on('click','#js-load-more',(function(e) {
	$('#js-loading').removeClass('hidden');
	$('#js-load-more').addClass('hidden');
	$('#product_list_grid').addClass('infinite');
}));

prestashop.on('updateProductList', function (data) {
	
	$("#js-products-list-top").replaceWith(data.rendered_products_top);
	$("#js-products-list-bottom").replaceWith(data.rendered_products_bottom);
	
	if (typeof (data.infinite) != 'undefined' && data.infinite) {
		$("#js-products-list [data-button-action=add-product-infinite]").append($(data.rendered_products).find('[data-button-action=add-product-infinite]').html());
		$('#js-loading').addClass('hidden');
		$('#js-load-more').removeClass('hidden');
		$('#product_list_grid').removeClass('infinite');
	}else{
		$('html, body').animate({scrollTop: $('#js-products-list-top').position().top}, '400');
		$("#js-products-list").replaceWith(data.rendered_products);
	}
	
});

/*-------------------------------------------*/

$(document).ready(function() {
		
    $('[data-toggle="tab"]').on('shown.bs.tab', function(e) {
        var $this = $(this).closest('.box-nav-tab');
        $this.find('.dropdown-toggle-nav-tab').html($(this).html());
        $this.find('.dropdown-menu-nav-tab').removeClass('active');
    });
	
    $('body').on('click', '.dropdown-toggle-nav-tab', (function(e) {
        var $this = $(this).closest('.box-nav-tab');
        $this.find('.dropdown-menu-nav-tab').toggleClass('active');
        e.stopPropagation();
    }));
	
    $("body").click(function(e) {
        $(".dropdown-menu-nav-tab").removeClass('active');
    });
		
});

/*-------------------------------------------*/

function makeEffect() {
	$('.effect-transparent').each(function(i, el) {
		var delay = (i + 1) * 300;
		var $this = $(this);
		setTimeout(function() {
			$this.removeClass('effect-transparent');
			$this.addClass('effect-translator');
		}, delay);
		setTimeout(function() {
			$this.removeClass('effect-translator');
		}, delay + 1500)
	});
	$('.effect-transparent-2').each(function(i, el) {
		var $this = $(this);
		$this.removeClass('effect-transparent-2');
		$this.addClass('effect-opacity');
		setTimeout(function() {
			$this.removeClass('effect-opacity');
		}, 1500)
	});
}

$(document).ready(function() {

    makeEffect();

    prestashop.on('updateProductList', function (e) {
        makeEffect();
    });	
	
	prestashop.on('updatedProductAjax',function (e) {
		makeEffect();
	});	
	
});

/*-------------------------------------------*/

$(document).ready(function() {
	
	$("#nav-mobile-content").slick({
		dots: false,
		arrows: false,
		infinite: false,
		slidesToShow: 4,
		slidesToScroll: 4
	});
	
});

/*-------------------------------------------*/

function makeTooltip(){
	
	var el_tt = '.item-product-list [data-link-action=quickview]:not(.add-to-cart), .item-product-list .js-wishlist, .item-product-list .js-compare';
		el_tt += ', #add-to-cart-or-refresh .js-wishlist, #add-to-cart-or-refresh .js-compare';
		el_tt += ', .product-information .social-sharing li a';
	
	$(el_tt).tooltip({
      position: {
        my: "center bottom-7",
        at: "center top",
        using: function( position, feedback ) {
          $( this ).css( position );
          $( "<div>" )
            .addClass( "arrow" )
            .addClass( feedback.vertical )
            .addClass( feedback.horizontal )
            .appendTo( this );
        }
      }
	});
}

$(document).ready(function() {
	
	makeTooltip();
	
	$('body').on('show.bs.modal','.quickview',(function() {
		makeTooltip();
	}));
	
	prestashop.on(
		  'updateProductList',
		  function (event) {
			  makeTooltip();
		}
	);	
	
	prestashop.on(
		  'updatedProduct',
		  function (event) {
			  makeTooltip();
		}
	);	
		
	prestashop.on(
		  'updatedProductAjax',
		  function (event) {
			  makeTooltip();
		}
	);	
});

$(document).ready(function() {
	
	$('.footer_collapse .content_title').each(function() {
		$(this).siblings().addClass('is-collapse');
    });	
	
    $('body').on('click', '.footer_collapse .footer-toggler', (function(e) {
		$(this).toggleClass('active');
        $(this).closest('.content_title').siblings().slideToggle();
    }));
	
});


/****************************************/

$('body').on('hidden.bs.modal','.video',(function(e) {
	$('#'+e.target.id).find('iframe').each(function(i, el){
		var vidSrc = $(el).prop('src');
		$(el).prop('src', '');
		$(el).prop('src', vidSrc);
	});
}));	
